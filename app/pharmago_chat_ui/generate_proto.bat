@echo off
setlocal enabledelayedexpansion

REM Configurações
set PROTO_DIR=B:\ModSpace\PharmaGO\pharmago_chat\app\pharmago_chat_ui\lib\protos

set OUTPUT_DIR=B:\ModSpace\PharmaGO\pharmago_chat\app\pharmago_chat_ui\lib\src\grpc
set CURRENT_DIR=%CD%

echo ===== Inicializando Geração de Código Protobuf para Dart =====

REM Limpar diretório de saída para garantir arquivos novos
if exist "%OUTPUT_DIR%" (
    echo Limpando diretório de saída: %OUTPUT_DIR%
    rd /s /q "%OUTPUT_DIR%"
    echo Diretório limpo com sucesso
)

REM Criar diretório de saída limpo
echo Criando diretório de saída: %OUTPUT_DIR%
mkdir "%OUTPUT_DIR%"

REM Ir para o diretório dos protos
cd /d "%PROTO_DIR%"
echo Diretório atual: %PROTO_DIR%

echo.
echo ===== Processando arquivos .proto =====

set PROCESSED=0

REM Processar arquivos na raiz do diretório protos
echo Processando arquivos na raiz...
for %%f in (*.proto) do (
    call :ProcessProtoFile "%%f" ""
)

REM Processar arquivos em subdiretórios
echo.
echo Processando arquivos em subdiretórios...
for /r /d %%d in (*) do (
    set "FULL_DIR=%%~fd"

    REM Ignorar se for o diretório raiz
    if not "!FULL_DIR!"=="%PROTO_DIR%" (
        echo Verificando subdiretório: !FULL_DIR!

        REM Extrair caminho relativo (remover o caminho base)
        set "MODULE_PATH=!FULL_DIR:%PROTO_DIR%=!"
        REM Remover a barra inicial se existir
        if "!MODULE_PATH:~0,1!"=="\" set "MODULE_PATH=!MODULE_PATH:~1!"

        echo   Módulo: !MODULE_PATH!

        for %%f in ("!FULL_DIR!\*.proto") do (
            call :ProcessProtoFile "%%f" "!MODULE_PATH!"
        )
    )
)

goto :End

:ProcessProtoFile
REM Parâmetros: %~1 = Caminho completo do arquivo, %~2 = Caminho do módulo relativo
set "FULL_FILE_PATH=%~1"
set "MODULE_PATH=%~2"

REM Extrair nome do arquivo sem extensão
for %%i in ("%FULL_FILE_PATH%") do set "filename=%%~ni"

echo.
echo Processando: !filename!.proto

REM Determine o diretório de saída (módulo + nome completo do arquivo)
if "%MODULE_PATH%"=="" (
    REM Para arquivos na raiz
    set "output_subdir=!filename!"
    echo   Arquivo na raiz, usando subdiretório: !output_subdir!
) else (
    REM Para arquivos em subdiretórios, combinar módulo + nome completo do arquivo
    set "output_subdir=!MODULE_PATH!\!filename!"
    echo   Arquivo em subdiretório, usando caminho: !output_subdir!
)

REM Crie o diretório de saída completo
if not exist "%OUTPUT_DIR%\!output_subdir!" (
    echo   Criando diretório: %OUTPUT_DIR%\!output_subdir!
    mkdir "%OUTPUT_DIR%\!output_subdir!"
)

REM Calcular o caminho relativo para importação com base na profundidade do diretório
set "DEPTH=0"

REM Contar quantas barras existem no caminho de saída
for /f "tokens=1* delims=\" %%a in ("!output_subdir!") do (
    set /a DEPTH+=1
    set "REMAINING=%%b"
    :CountLoop
    if defined REMAINING (
        for /f "tokens=1* delims=\" %%c in ("!REMAINING!") do (
            set /a DEPTH+=1
            set "REMAINING=%%d"
            goto CountLoop
        )
    )
)

REM Construir caminho relativo baseado na profundidade
set "REL_PATH=../.."
for /l %%i in (3,1,!DEPTH!) do (
    set "REL_PATH=!REL_PATH!/.."
)

echo   Profundidade do diretório: !DEPTH!, caminho relativo: !REL_PATH!

REM Crie um diretório temporário para a saída do protoc
set "TEMP_DIR=%TEMP%\protoc_temp"
if exist "!TEMP_DIR!" rd /s /q "!TEMP_DIR!"
mkdir "!TEMP_DIR!"

REM Execute o protoc para o arquivo atual, direcionando para o diretório temporário
echo   Executando protoc para !FULL_FILE_PATH!
if "%MODULE_PATH%"=="" (
    REM Para arquivos na raiz
    protoc --dart_out=grpc:!TEMP_DIR! -I. "!filename!.proto"
) else (
    REM Para arquivos em subdiretórios
    protoc --dart_out=grpc:!TEMP_DIR! -I. "%MODULE_PATH%\!filename!.proto"
)

if errorlevel 1 (
    echo   [ERRO] Falha ao gerar código para !filename!.proto
) else (
    echo   [OK] Código gerado com sucesso para !filename!.proto

    REM Mova os arquivos .dart do diretório temporário para o diretório final
    echo   Movendo arquivos para o diretório final...

    REM Encontre o subdiretório criado pelo protoc
    for /d %%d in ("!TEMP_DIR!\*") do (
        for %%f in ("%%d\*.dart") do (
            echo   Copiando arquivo: %%~nxf para %OUTPUT_DIR%\!output_subdir!
            copy "%%f" "%OUTPUT_DIR%\!output_subdir!" > nul
        )
    )

echo   Substituindo importações do Google Protobuf pelo package...

echo   Substituindo importações do Google Protobuf pelo package...

REM Use comandos PowerShell com arquivos de substituição
> "%TEMP%\replace_empty.ps1" (
    echo $files = Get-ChildItem -Path '%OUTPUT_DIR%\!output_subdir!' -Filter '*.dart'
    echo foreach^($file in $files^) {
    echo   $content = Get-Content $file.FullName
    echo   $content = $content -replace "import '.*google/protobuf/empty.pb.dart'", "import 'package:mod_proto_google/mod_proto_google.dart'"
    echo   Set-Content -Path $file.FullName -Value $content
    echo }
)
> "%TEMP%\replace_timestamp.ps1" (
    echo $files = Get-ChildItem -Path '%OUTPUT_DIR%\!output_subdir!' -Filter '*.dart'
    echo foreach^($file in $files^) {
    echo   $content = Get-Content $file.FullName
    echo   $content = $content -replace "import '.*google/protobuf/timestamp.pb.dart'", "import 'package:mod_proto_google/mod_proto_google.dart'"
    echo   Set-Content -Path $file.FullName -Value $content
    echo }
)

powershell -ExecutionPolicy Bypass -File "%TEMP%\replace_empty.ps1"
powershell -ExecutionPolicy Bypass -File "%TEMP%\replace_timestamp.ps1"

if errorlevel 1 (
    echo   [AVISO] Não foi possível substituir as importações para !filename!.proto
) else (
    echo   [OK] Importações substituídas com sucesso para !filename!.proto
)

del "%TEMP%\replace_empty.ps1"
del "%TEMP%\replace_timestamp.ps1"

    set /a PROCESSED+=1
)

REM Limpe o diretório temporário
if exist "!TEMP_DIR!" rd /s /q "!TEMP_DIR!"

goto :eof

:End
echo ===== Processamento concluído =====

REM Retornar ao diretório original
cd /d "%CURRENT_DIR%"

echo.
echo Resumo:
echo   Arquivos processados: %PROCESSED%
echo   Diretório de origem: %PROTO_DIR%
echo   Diretório de saída: %OUTPUT_DIR%
echo.
echo Verifique os arquivos gerados em: %OUTPUT_DIR%

echo.
echo.
echo ===== Gerando arquivo de exports =====

REM Crie o arquivo de exports
set "EXPORT_FILE=%OUTPUT_DIR%\grpc_exports.dart"
echo // Arquivo gerado automaticamente em %date% %time% > "%EXPORT_FILE%"
echo. >> "%EXPORT_FILE%"
echo // Este arquivo exporta todos os arquivos gRPC gerados >> "%EXPORT_FILE%"
echo. >> "%EXPORT_FILE%"

REM Encontre todos os arquivos .pbgrpc.dart e adicione-os ao arquivo de exports
for /r "%OUTPUT_DIR%" %%f in (*.pbgrpc.dart) do (
    set "REL_PATH=%%f"
    setlocal EnableDelayedExpansion
    REM Extrair apenas o caminho relativo a partir de src/grpc
    set "REL_PATH=!REL_PATH:*\src\grpc\=!"
    REM Substitua backslash por forward slash para compatibilidade com Flutter/Dart
    set "DART_PATH=!REL_PATH:\=/!"
    echo export 'package:pharmago_chat_ui/src/grpc/!DART_PATH!'; >> "%EXPORT_FILE%"
    endlocal
)
echo export 'package:mod_proto_google/mod_proto_google.dart'; >> "%EXPORT_FILE%"


echo Arquivo de exports gerado em: %EXPORT_FILE%
