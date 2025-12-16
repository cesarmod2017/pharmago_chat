//
//  Generated code. Do not modify.
//  source: chat/chat_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'package:protobuf_google/protobuf_google.dart' as $1;

class ChatCreateSessionRequest extends $pb.GeneratedMessage {
  factory ChatCreateSessionRequest({
    $core.String? name,
    $core.String? email,
    $core.String? client,
    $core.String? agentName,
    $core.String? erpName,
    $core.String? language,
    $core.String? type,
    $core.Map<$core.String, $core.String>? metadata,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (email != null) {
      $result.email = email;
    }
    if (client != null) {
      $result.client = client;
    }
    if (agentName != null) {
      $result.agentName = agentName;
    }
    if (erpName != null) {
      $result.erpName = erpName;
    }
    if (language != null) {
      $result.language = language;
    }
    if (type != null) {
      $result.type = type;
    }
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    return $result;
  }
  ChatCreateSessionRequest._() : super();
  factory ChatCreateSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCreateSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatCreateSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'client')
    ..aOS(4, _omitFieldNames ? '' : 'agentName')
    ..aOS(5, _omitFieldNames ? '' : 'erpName')
    ..aOS(6, _omitFieldNames ? '' : 'language')
    ..aOS(7, _omitFieldNames ? '' : 'type')
    ..m<$core.String, $core.String>(8, _omitFieldNames ? '' : 'metadata', entryClassName: 'ChatCreateSessionRequest.MetadataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('chat'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatCreateSessionRequest clone() => ChatCreateSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatCreateSessionRequest copyWith(void Function(ChatCreateSessionRequest) updates) => super.copyWith((message) => updates(message as ChatCreateSessionRequest)) as ChatCreateSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCreateSessionRequest create() => ChatCreateSessionRequest._();
  ChatCreateSessionRequest createEmptyInstance() => create();
  static $pb.PbList<ChatCreateSessionRequest> createRepeated() => $pb.PbList<ChatCreateSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatCreateSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatCreateSessionRequest>(create);
  static ChatCreateSessionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get client => $_getSZ(2);
  @$pb.TagNumber(3)
  set client($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasClient() => $_has(2);
  @$pb.TagNumber(3)
  void clearClient() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get agentName => $_getSZ(3);
  @$pb.TagNumber(4)
  set agentName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAgentName() => $_has(3);
  @$pb.TagNumber(4)
  void clearAgentName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get erpName => $_getSZ(4);
  @$pb.TagNumber(5)
  set erpName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasErpName() => $_has(4);
  @$pb.TagNumber(5)
  void clearErpName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get language => $_getSZ(5);
  @$pb.TagNumber(6)
  set language($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLanguage() => $_has(5);
  @$pb.TagNumber(6)
  void clearLanguage() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get type => $_getSZ(6);
  @$pb.TagNumber(7)
  set type($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasType() => $_has(6);
  @$pb.TagNumber(7)
  void clearType() => clearField(7);

  @$pb.TagNumber(8)
  $core.Map<$core.String, $core.String> get metadata => $_getMap(7);
}

class ChatCreateSessionResponse extends $pb.GeneratedMessage {
  factory ChatCreateSessionResponse({
    $core.String? sessionId,
    $1.Timestamp? createdAt,
    $core.String? welcomeMessage,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (welcomeMessage != null) {
      $result.welcomeMessage = welcomeMessage;
    }
    return $result;
  }
  ChatCreateSessionResponse._() : super();
  factory ChatCreateSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCreateSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatCreateSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOS(3, _omitFieldNames ? '' : 'welcomeMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatCreateSessionResponse clone() => ChatCreateSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatCreateSessionResponse copyWith(void Function(ChatCreateSessionResponse) updates) => super.copyWith((message) => updates(message as ChatCreateSessionResponse)) as ChatCreateSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCreateSessionResponse create() => ChatCreateSessionResponse._();
  ChatCreateSessionResponse createEmptyInstance() => create();
  static $pb.PbList<ChatCreateSessionResponse> createRepeated() => $pb.PbList<ChatCreateSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatCreateSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatCreateSessionResponse>(create);
  static ChatCreateSessionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);

  @$pb.TagNumber(2)
  $1.Timestamp get createdAt => $_getN(1);
  @$pb.TagNumber(2)
  set createdAt($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureCreatedAt() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get welcomeMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set welcomeMessage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWelcomeMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearWelcomeMessage() => clearField(3);
}

class ChatSendMessageRequest extends $pb.GeneratedMessage {
  factory ChatSendMessageRequest({
    $core.String? sessionId,
    $core.String? message,
    $core.bool? useStreaming,
    $core.String? preferredModel,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (message != null) {
      $result.message = message;
    }
    if (useStreaming != null) {
      $result.useStreaming = useStreaming;
    }
    if (preferredModel != null) {
      $result.preferredModel = preferredModel;
    }
    return $result;
  }
  ChatSendMessageRequest._() : super();
  factory ChatSendMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatSendMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatSendMessageRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..aOB(3, _omitFieldNames ? '' : 'useStreaming')
    ..aOS(4, _omitFieldNames ? '' : 'preferredModel')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatSendMessageRequest clone() => ChatSendMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatSendMessageRequest copyWith(void Function(ChatSendMessageRequest) updates) => super.copyWith((message) => updates(message as ChatSendMessageRequest)) as ChatSendMessageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatSendMessageRequest create() => ChatSendMessageRequest._();
  ChatSendMessageRequest createEmptyInstance() => create();
  static $pb.PbList<ChatSendMessageRequest> createRepeated() => $pb.PbList<ChatSendMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatSendMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatSendMessageRequest>(create);
  static ChatSendMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get useStreaming => $_getBF(2);
  @$pb.TagNumber(3)
  set useStreaming($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUseStreaming() => $_has(2);
  @$pb.TagNumber(3)
  void clearUseStreaming() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get preferredModel => $_getSZ(3);
  @$pb.TagNumber(4)
  set preferredModel($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPreferredModel() => $_has(3);
  @$pb.TagNumber(4)
  void clearPreferredModel() => clearField(4);
}

class ChatSendMessageResponse extends $pb.GeneratedMessage {
  factory ChatSendMessageResponse({
    $core.String? messageId,
    $core.String? response,
    $core.String? modelUsed,
    $core.int? tokensUsed,
    $1.Timestamp? timestamp,
    $core.Iterable<$core.String>? sources,
  }) {
    final $result = create();
    if (messageId != null) {
      $result.messageId = messageId;
    }
    if (response != null) {
      $result.response = response;
    }
    if (modelUsed != null) {
      $result.modelUsed = modelUsed;
    }
    if (tokensUsed != null) {
      $result.tokensUsed = tokensUsed;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (sources != null) {
      $result.sources.addAll(sources);
    }
    return $result;
  }
  ChatSendMessageResponse._() : super();
  factory ChatSendMessageResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatSendMessageResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatSendMessageResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..aOS(2, _omitFieldNames ? '' : 'response')
    ..aOS(3, _omitFieldNames ? '' : 'modelUsed')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'tokensUsed', $pb.PbFieldType.O3)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'timestamp', subBuilder: $1.Timestamp.create)
    ..pPS(6, _omitFieldNames ? '' : 'sources')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatSendMessageResponse clone() => ChatSendMessageResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatSendMessageResponse copyWith(void Function(ChatSendMessageResponse) updates) => super.copyWith((message) => updates(message as ChatSendMessageResponse)) as ChatSendMessageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatSendMessageResponse create() => ChatSendMessageResponse._();
  ChatSendMessageResponse createEmptyInstance() => create();
  static $pb.PbList<ChatSendMessageResponse> createRepeated() => $pb.PbList<ChatSendMessageResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatSendMessageResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatSendMessageResponse>(create);
  static ChatSendMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get response => $_getSZ(1);
  @$pb.TagNumber(2)
  set response($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearResponse() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get modelUsed => $_getSZ(2);
  @$pb.TagNumber(3)
  set modelUsed($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasModelUsed() => $_has(2);
  @$pb.TagNumber(3)
  void clearModelUsed() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get tokensUsed => $_getIZ(3);
  @$pb.TagNumber(4)
  set tokensUsed($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTokensUsed() => $_has(3);
  @$pb.TagNumber(4)
  void clearTokensUsed() => clearField(4);

  @$pb.TagNumber(5)
  $1.Timestamp get timestamp => $_getN(4);
  @$pb.TagNumber(5)
  set timestamp($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTimestamp() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimestamp() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureTimestamp() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get sources => $_getList(5);
}

class ChatMessageChunk extends $pb.GeneratedMessage {
  factory ChatMessageChunk({
    $core.String? chunkId,
    $core.String? content,
    $core.bool? isFinal,
    $core.String? modelUsed,
    $core.int? tokensUsed,
    $core.Iterable<$core.String>? sources,
  }) {
    final $result = create();
    if (chunkId != null) {
      $result.chunkId = chunkId;
    }
    if (content != null) {
      $result.content = content;
    }
    if (isFinal != null) {
      $result.isFinal = isFinal;
    }
    if (modelUsed != null) {
      $result.modelUsed = modelUsed;
    }
    if (tokensUsed != null) {
      $result.tokensUsed = tokensUsed;
    }
    if (sources != null) {
      $result.sources.addAll(sources);
    }
    return $result;
  }
  ChatMessageChunk._() : super();
  factory ChatMessageChunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatMessageChunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatMessageChunk', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'chunkId')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOB(3, _omitFieldNames ? '' : 'isFinal')
    ..aOS(4, _omitFieldNames ? '' : 'modelUsed')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'tokensUsed', $pb.PbFieldType.O3)
    ..pPS(6, _omitFieldNames ? '' : 'sources')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatMessageChunk clone() => ChatMessageChunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatMessageChunk copyWith(void Function(ChatMessageChunk) updates) => super.copyWith((message) => updates(message as ChatMessageChunk)) as ChatMessageChunk;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatMessageChunk create() => ChatMessageChunk._();
  ChatMessageChunk createEmptyInstance() => create();
  static $pb.PbList<ChatMessageChunk> createRepeated() => $pb.PbList<ChatMessageChunk>();
  @$core.pragma('dart2js:noInline')
  static ChatMessageChunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatMessageChunk>(create);
  static ChatMessageChunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get chunkId => $_getSZ(0);
  @$pb.TagNumber(1)
  set chunkId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChunkId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChunkId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isFinal => $_getBF(2);
  @$pb.TagNumber(3)
  set isFinal($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsFinal() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsFinal() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get modelUsed => $_getSZ(3);
  @$pb.TagNumber(4)
  set modelUsed($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasModelUsed() => $_has(3);
  @$pb.TagNumber(4)
  void clearModelUsed() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get tokensUsed => $_getIZ(4);
  @$pb.TagNumber(5)
  set tokensUsed($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTokensUsed() => $_has(4);
  @$pb.TagNumber(5)
  void clearTokensUsed() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get sources => $_getList(5);
}

class ChatGetHistoryRequest extends $pb.GeneratedMessage {
  factory ChatGetHistoryRequest({
    $core.String? sessionId,
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  ChatGetHistoryRequest._() : super();
  factory ChatGetHistoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetHistoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatGetHistoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatGetHistoryRequest clone() => ChatGetHistoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatGetHistoryRequest copyWith(void Function(ChatGetHistoryRequest) updates) => super.copyWith((message) => updates(message as ChatGetHistoryRequest)) as ChatGetHistoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatGetHistoryRequest create() => ChatGetHistoryRequest._();
  ChatGetHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<ChatGetHistoryRequest> createRepeated() => $pb.PbList<ChatGetHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatGetHistoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatGetHistoryRequest>(create);
  static ChatGetHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get offset => $_getIZ(2);
  @$pb.TagNumber(3)
  set offset($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffset() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffset() => clearField(3);
}

class ChatGetHistoryResponse extends $pb.GeneratedMessage {
  factory ChatGetHistoryResponse({
    $core.Iterable<ChatMessage>? messages,
    $core.int? totalCount,
  }) {
    final $result = create();
    if (messages != null) {
      $result.messages.addAll(messages);
    }
    if (totalCount != null) {
      $result.totalCount = totalCount;
    }
    return $result;
  }
  ChatGetHistoryResponse._() : super();
  factory ChatGetHistoryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetHistoryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatGetHistoryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<ChatMessage>(1, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM, subBuilder: ChatMessage.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatGetHistoryResponse clone() => ChatGetHistoryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatGetHistoryResponse copyWith(void Function(ChatGetHistoryResponse) updates) => super.copyWith((message) => updates(message as ChatGetHistoryResponse)) as ChatGetHistoryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatGetHistoryResponse create() => ChatGetHistoryResponse._();
  ChatGetHistoryResponse createEmptyInstance() => create();
  static $pb.PbList<ChatGetHistoryResponse> createRepeated() => $pb.PbList<ChatGetHistoryResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatGetHistoryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatGetHistoryResponse>(create);
  static ChatGetHistoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ChatMessage> get messages => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => clearField(2);
}

class ChatMessage extends $pb.GeneratedMessage {
  factory ChatMessage({
    $core.String? messageId,
    $core.String? role,
    $core.String? content,
    $1.Timestamp? timestamp,
    $core.String? modelUsed,
    $core.int? tokensUsed,
  }) {
    final $result = create();
    if (messageId != null) {
      $result.messageId = messageId;
    }
    if (role != null) {
      $result.role = role;
    }
    if (content != null) {
      $result.content = content;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (modelUsed != null) {
      $result.modelUsed = modelUsed;
    }
    if (tokensUsed != null) {
      $result.tokensUsed = tokensUsed;
    }
    return $result;
  }
  ChatMessage._() : super();
  factory ChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..aOS(2, _omitFieldNames ? '' : 'role')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'timestamp', subBuilder: $1.Timestamp.create)
    ..aOS(5, _omitFieldNames ? '' : 'modelUsed')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'tokensUsed', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatMessage clone() => ChatMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatMessage copyWith(void Function(ChatMessage) updates) => super.copyWith((message) => updates(message as ChatMessage)) as ChatMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatMessage create() => ChatMessage._();
  ChatMessage createEmptyInstance() => create();
  static $pb.PbList<ChatMessage> createRepeated() => $pb.PbList<ChatMessage>();
  @$core.pragma('dart2js:noInline')
  static ChatMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatMessage>(create);
  static ChatMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get role => $_getSZ(1);
  @$pb.TagNumber(2)
  set role($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);

  @$pb.TagNumber(4)
  $1.Timestamp get timestamp => $_getN(3);
  @$pb.TagNumber(4)
  set timestamp($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureTimestamp() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get modelUsed => $_getSZ(4);
  @$pb.TagNumber(5)
  set modelUsed($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasModelUsed() => $_has(4);
  @$pb.TagNumber(5)
  void clearModelUsed() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get tokensUsed => $_getIZ(5);
  @$pb.TagNumber(6)
  set tokensUsed($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTokensUsed() => $_has(5);
  @$pb.TagNumber(6)
  void clearTokensUsed() => clearField(6);
}

class ChatEndSessionRequest extends $pb.GeneratedMessage {
  factory ChatEndSessionRequest({
    $core.String? sessionId,
    $core.String? reason,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    return $result;
  }
  ChatEndSessionRequest._() : super();
  factory ChatEndSessionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatEndSessionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatEndSessionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatEndSessionRequest clone() => ChatEndSessionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatEndSessionRequest copyWith(void Function(ChatEndSessionRequest) updates) => super.copyWith((message) => updates(message as ChatEndSessionRequest)) as ChatEndSessionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatEndSessionRequest create() => ChatEndSessionRequest._();
  ChatEndSessionRequest createEmptyInstance() => create();
  static $pb.PbList<ChatEndSessionRequest> createRepeated() => $pb.PbList<ChatEndSessionRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatEndSessionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatEndSessionRequest>(create);
  static ChatEndSessionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => clearField(2);
}

class ChatEndSessionResponse extends $pb.GeneratedMessage {
  factory ChatEndSessionResponse({
    $core.bool? success,
    $1.Timestamp? endedAt,
    $core.int? totalMessages,
    $core.int? totalTokens,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (endedAt != null) {
      $result.endedAt = endedAt;
    }
    if (totalMessages != null) {
      $result.totalMessages = totalMessages;
    }
    if (totalTokens != null) {
      $result.totalTokens = totalTokens;
    }
    return $result;
  }
  ChatEndSessionResponse._() : super();
  factory ChatEndSessionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatEndSessionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatEndSessionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'endedAt', subBuilder: $1.Timestamp.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'totalMessages', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'totalTokens', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatEndSessionResponse clone() => ChatEndSessionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatEndSessionResponse copyWith(void Function(ChatEndSessionResponse) updates) => super.copyWith((message) => updates(message as ChatEndSessionResponse)) as ChatEndSessionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatEndSessionResponse create() => ChatEndSessionResponse._();
  ChatEndSessionResponse createEmptyInstance() => create();
  static $pb.PbList<ChatEndSessionResponse> createRepeated() => $pb.PbList<ChatEndSessionResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatEndSessionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatEndSessionResponse>(create);
  static ChatEndSessionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $1.Timestamp get endedAt => $_getN(1);
  @$pb.TagNumber(2)
  set endedAt($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndedAt() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureEndedAt() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get totalMessages => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalMessages($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalMessages() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalMessages() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get totalTokens => $_getIZ(3);
  @$pb.TagNumber(4)
  set totalTokens($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTotalTokens() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalTokens() => clearField(4);
}

class ChatGetSessionInfoRequest extends $pb.GeneratedMessage {
  factory ChatGetSessionInfoRequest({
    $core.String? sessionId,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    return $result;
  }
  ChatGetSessionInfoRequest._() : super();
  factory ChatGetSessionInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetSessionInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatGetSessionInfoRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatGetSessionInfoRequest clone() => ChatGetSessionInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatGetSessionInfoRequest copyWith(void Function(ChatGetSessionInfoRequest) updates) => super.copyWith((message) => updates(message as ChatGetSessionInfoRequest)) as ChatGetSessionInfoRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatGetSessionInfoRequest create() => ChatGetSessionInfoRequest._();
  ChatGetSessionInfoRequest createEmptyInstance() => create();
  static $pb.PbList<ChatGetSessionInfoRequest> createRepeated() => $pb.PbList<ChatGetSessionInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatGetSessionInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatGetSessionInfoRequest>(create);
  static ChatGetSessionInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);
}

class ChatSessionInfo extends $pb.GeneratedMessage {
  factory ChatSessionInfo({
    $core.String? sessionId,
    $core.String? userName,
    $core.String? userEmail,
    $core.String? status,
    $1.Timestamp? createdAt,
    $1.Timestamp? lastActivity,
    $core.int? messageCount,
    $core.int? totalTokens,
    $core.String? currentOperatorId,
    $core.String? client,
    $core.String? agentName,
    $core.String? erpName,
    $core.String? language,
    $core.String? type,
    $core.Map<$core.String, $core.String>? metadata,
  }) {
    final $result = create();
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    if (userName != null) {
      $result.userName = userName;
    }
    if (userEmail != null) {
      $result.userEmail = userEmail;
    }
    if (status != null) {
      $result.status = status;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (lastActivity != null) {
      $result.lastActivity = lastActivity;
    }
    if (messageCount != null) {
      $result.messageCount = messageCount;
    }
    if (totalTokens != null) {
      $result.totalTokens = totalTokens;
    }
    if (currentOperatorId != null) {
      $result.currentOperatorId = currentOperatorId;
    }
    if (client != null) {
      $result.client = client;
    }
    if (agentName != null) {
      $result.agentName = agentName;
    }
    if (erpName != null) {
      $result.erpName = erpName;
    }
    if (language != null) {
      $result.language = language;
    }
    if (type != null) {
      $result.type = type;
    }
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    return $result;
  }
  ChatSessionInfo._() : super();
  factory ChatSessionInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatSessionInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatSessionInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aOS(2, _omitFieldNames ? '' : 'userName')
    ..aOS(3, _omitFieldNames ? '' : 'userEmail')
    ..aOS(4, _omitFieldNames ? '' : 'status')
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'lastActivity', subBuilder: $1.Timestamp.create)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'messageCount', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'totalTokens', $pb.PbFieldType.O3)
    ..aOS(9, _omitFieldNames ? '' : 'currentOperatorId')
    ..aOS(10, _omitFieldNames ? '' : 'client')
    ..aOS(11, _omitFieldNames ? '' : 'agentName')
    ..aOS(12, _omitFieldNames ? '' : 'erpName')
    ..aOS(13, _omitFieldNames ? '' : 'language')
    ..aOS(14, _omitFieldNames ? '' : 'type')
    ..m<$core.String, $core.String>(15, _omitFieldNames ? '' : 'metadata', entryClassName: 'ChatSessionInfo.MetadataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('chat'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatSessionInfo clone() => ChatSessionInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatSessionInfo copyWith(void Function(ChatSessionInfo) updates) => super.copyWith((message) => updates(message as ChatSessionInfo)) as ChatSessionInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatSessionInfo create() => ChatSessionInfo._();
  ChatSessionInfo createEmptyInstance() => create();
  static $pb.PbList<ChatSessionInfo> createRepeated() => $pb.PbList<ChatSessionInfo>();
  @$core.pragma('dart2js:noInline')
  static ChatSessionInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatSessionInfo>(create);
  static ChatSessionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get userEmail => $_getSZ(2);
  @$pb.TagNumber(3)
  set userEmail($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserEmail() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $1.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($1.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureCreatedAt() => $_ensure(4);

  @$pb.TagNumber(6)
  $1.Timestamp get lastActivity => $_getN(5);
  @$pb.TagNumber(6)
  set lastActivity($1.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastActivity() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastActivity() => clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureLastActivity() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.int get messageCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set messageCount($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMessageCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearMessageCount() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get totalTokens => $_getIZ(7);
  @$pb.TagNumber(8)
  set totalTokens($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTotalTokens() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalTokens() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get currentOperatorId => $_getSZ(8);
  @$pb.TagNumber(9)
  set currentOperatorId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCurrentOperatorId() => $_has(8);
  @$pb.TagNumber(9)
  void clearCurrentOperatorId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get client => $_getSZ(9);
  @$pb.TagNumber(10)
  set client($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasClient() => $_has(9);
  @$pb.TagNumber(10)
  void clearClient() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get agentName => $_getSZ(10);
  @$pb.TagNumber(11)
  set agentName($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasAgentName() => $_has(10);
  @$pb.TagNumber(11)
  void clearAgentName() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get erpName => $_getSZ(11);
  @$pb.TagNumber(12)
  set erpName($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasErpName() => $_has(11);
  @$pb.TagNumber(12)
  void clearErpName() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get language => $_getSZ(12);
  @$pb.TagNumber(13)
  set language($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasLanguage() => $_has(12);
  @$pb.TagNumber(13)
  void clearLanguage() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get type => $_getSZ(13);
  @$pb.TagNumber(14)
  set type($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasType() => $_has(13);
  @$pb.TagNumber(14)
  void clearType() => clearField(14);

  @$pb.TagNumber(15)
  $core.Map<$core.String, $core.String> get metadata => $_getMap(14);
}

class ChatListActiveSessionsRequest extends $pb.GeneratedMessage {
  factory ChatListActiveSessionsRequest({
    $core.int? limit,
    $core.int? offset,
    $core.String? statusFilter,
  }) {
    final $result = create();
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    if (statusFilter != null) {
      $result.statusFilter = statusFilter;
    }
    return $result;
  }
  ChatListActiveSessionsRequest._() : super();
  factory ChatListActiveSessionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatListActiveSessionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatListActiveSessionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'statusFilter')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatListActiveSessionsRequest clone() => ChatListActiveSessionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatListActiveSessionsRequest copyWith(void Function(ChatListActiveSessionsRequest) updates) => super.copyWith((message) => updates(message as ChatListActiveSessionsRequest)) as ChatListActiveSessionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatListActiveSessionsRequest create() => ChatListActiveSessionsRequest._();
  ChatListActiveSessionsRequest createEmptyInstance() => create();
  static $pb.PbList<ChatListActiveSessionsRequest> createRepeated() => $pb.PbList<ChatListActiveSessionsRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatListActiveSessionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatListActiveSessionsRequest>(create);
  static ChatListActiveSessionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get statusFilter => $_getSZ(2);
  @$pb.TagNumber(3)
  set statusFilter($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatusFilter() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatusFilter() => clearField(3);
}

class ChatListActiveSessionsResponse extends $pb.GeneratedMessage {
  factory ChatListActiveSessionsResponse({
    $core.Iterable<ChatSessionInfo>? sessions,
    $core.int? totalCount,
  }) {
    final $result = create();
    if (sessions != null) {
      $result.sessions.addAll(sessions);
    }
    if (totalCount != null) {
      $result.totalCount = totalCount;
    }
    return $result;
  }
  ChatListActiveSessionsResponse._() : super();
  factory ChatListActiveSessionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatListActiveSessionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatListActiveSessionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<ChatSessionInfo>(1, _omitFieldNames ? '' : 'sessions', $pb.PbFieldType.PM, subBuilder: ChatSessionInfo.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatListActiveSessionsResponse clone() => ChatListActiveSessionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatListActiveSessionsResponse copyWith(void Function(ChatListActiveSessionsResponse) updates) => super.copyWith((message) => updates(message as ChatListActiveSessionsResponse)) as ChatListActiveSessionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatListActiveSessionsResponse create() => ChatListActiveSessionsResponse._();
  ChatListActiveSessionsResponse createEmptyInstance() => create();
  static $pb.PbList<ChatListActiveSessionsResponse> createRepeated() => $pb.PbList<ChatListActiveSessionsResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatListActiveSessionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatListActiveSessionsResponse>(create);
  static ChatListActiveSessionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ChatSessionInfo> get sessions => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => clearField(2);
}

class ChatGetHistoryByEmailRequest extends $pb.GeneratedMessage {
  factory ChatGetHistoryByEmailRequest({
    $core.String? userEmail,
    $core.int? limit,
  }) {
    final $result = create();
    if (userEmail != null) {
      $result.userEmail = userEmail;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    return $result;
  }
  ChatGetHistoryByEmailRequest._() : super();
  factory ChatGetHistoryByEmailRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetHistoryByEmailRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatGetHistoryByEmailRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userEmail')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatGetHistoryByEmailRequest clone() => ChatGetHistoryByEmailRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatGetHistoryByEmailRequest copyWith(void Function(ChatGetHistoryByEmailRequest) updates) => super.copyWith((message) => updates(message as ChatGetHistoryByEmailRequest)) as ChatGetHistoryByEmailRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatGetHistoryByEmailRequest create() => ChatGetHistoryByEmailRequest._();
  ChatGetHistoryByEmailRequest createEmptyInstance() => create();
  static $pb.PbList<ChatGetHistoryByEmailRequest> createRepeated() => $pb.PbList<ChatGetHistoryByEmailRequest>();
  @$core.pragma('dart2js:noInline')
  static ChatGetHistoryByEmailRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatGetHistoryByEmailRequest>(create);
  static ChatGetHistoryByEmailRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userEmail => $_getSZ(0);
  @$pb.TagNumber(1)
  set userEmail($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);
}

class ChatGetHistoryByEmailResponse extends $pb.GeneratedMessage {
  factory ChatGetHistoryByEmailResponse({
    $core.Iterable<ChatHistoryMessage>? messages,
    $core.int? totalCount,
  }) {
    final $result = create();
    if (messages != null) {
      $result.messages.addAll(messages);
    }
    if (totalCount != null) {
      $result.totalCount = totalCount;
    }
    return $result;
  }
  ChatGetHistoryByEmailResponse._() : super();
  factory ChatGetHistoryByEmailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatGetHistoryByEmailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatGetHistoryByEmailResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<ChatHistoryMessage>(1, _omitFieldNames ? '' : 'messages', $pb.PbFieldType.PM, subBuilder: ChatHistoryMessage.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatGetHistoryByEmailResponse clone() => ChatGetHistoryByEmailResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatGetHistoryByEmailResponse copyWith(void Function(ChatGetHistoryByEmailResponse) updates) => super.copyWith((message) => updates(message as ChatGetHistoryByEmailResponse)) as ChatGetHistoryByEmailResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatGetHistoryByEmailResponse create() => ChatGetHistoryByEmailResponse._();
  ChatGetHistoryByEmailResponse createEmptyInstance() => create();
  static $pb.PbList<ChatGetHistoryByEmailResponse> createRepeated() => $pb.PbList<ChatGetHistoryByEmailResponse>();
  @$core.pragma('dart2js:noInline')
  static ChatGetHistoryByEmailResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatGetHistoryByEmailResponse>(create);
  static ChatGetHistoryByEmailResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ChatHistoryMessage> get messages => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => clearField(2);
}

class ChatHistoryMessage extends $pb.GeneratedMessage {
  factory ChatHistoryMessage({
    $core.String? messageId,
    $core.String? role,
    $core.String? content,
    $1.Timestamp? timestamp,
    $core.String? modelUsed,
    $core.int? tokensUsed,
    $core.String? sessionId,
  }) {
    final $result = create();
    if (messageId != null) {
      $result.messageId = messageId;
    }
    if (role != null) {
      $result.role = role;
    }
    if (content != null) {
      $result.content = content;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (modelUsed != null) {
      $result.modelUsed = modelUsed;
    }
    if (tokensUsed != null) {
      $result.tokensUsed = tokensUsed;
    }
    if (sessionId != null) {
      $result.sessionId = sessionId;
    }
    return $result;
  }
  ChatHistoryMessage._() : super();
  factory ChatHistoryMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatHistoryMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatHistoryMessage', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..aOS(2, _omitFieldNames ? '' : 'role')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'timestamp', subBuilder: $1.Timestamp.create)
    ..aOS(5, _omitFieldNames ? '' : 'modelUsed')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'tokensUsed', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'sessionId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatHistoryMessage clone() => ChatHistoryMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatHistoryMessage copyWith(void Function(ChatHistoryMessage) updates) => super.copyWith((message) => updates(message as ChatHistoryMessage)) as ChatHistoryMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatHistoryMessage create() => ChatHistoryMessage._();
  ChatHistoryMessage createEmptyInstance() => create();
  static $pb.PbList<ChatHistoryMessage> createRepeated() => $pb.PbList<ChatHistoryMessage>();
  @$core.pragma('dart2js:noInline')
  static ChatHistoryMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatHistoryMessage>(create);
  static ChatHistoryMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get role => $_getSZ(1);
  @$pb.TagNumber(2)
  set role($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => clearField(3);

  @$pb.TagNumber(4)
  $1.Timestamp get timestamp => $_getN(3);
  @$pb.TagNumber(4)
  set timestamp($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureTimestamp() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get modelUsed => $_getSZ(4);
  @$pb.TagNumber(5)
  set modelUsed($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasModelUsed() => $_has(4);
  @$pb.TagNumber(5)
  void clearModelUsed() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get tokensUsed => $_getIZ(5);
  @$pb.TagNumber(6)
  set tokensUsed($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTokensUsed() => $_has(5);
  @$pb.TagNumber(6)
  void clearTokensUsed() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sessionId => $_getSZ(6);
  @$pb.TagNumber(7)
  set sessionId($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSessionId() => $_has(6);
  @$pb.TagNumber(7)
  void clearSessionId() => clearField(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
