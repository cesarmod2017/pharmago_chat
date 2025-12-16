//
//  Generated code. Do not modify.
//  source: chat/chat_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'chat_service.pb.dart' as $0;

export 'chat_service.pb.dart';

@$pb.GrpcServiceName('chat.ChatService')
class ChatServiceClient extends $grpc.Client {
  static final _$createSession = $grpc.ClientMethod<$0.ChatCreateSessionRequest, $0.ChatCreateSessionResponse>(
      '/chat.ChatService/CreateSession',
      ($0.ChatCreateSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatCreateSessionResponse.fromBuffer(value));
  static final _$sendMessage = $grpc.ClientMethod<$0.ChatSendMessageRequest, $0.ChatSendMessageResponse>(
      '/chat.ChatService/SendMessage',
      ($0.ChatSendMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatSendMessageResponse.fromBuffer(value));
  static final _$sendMessageStream = $grpc.ClientMethod<$0.ChatSendMessageRequest, $0.ChatMessageChunk>(
      '/chat.ChatService/SendMessageStream',
      ($0.ChatSendMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatMessageChunk.fromBuffer(value));
  static final _$getHistory = $grpc.ClientMethod<$0.ChatGetHistoryRequest, $0.ChatGetHistoryResponse>(
      '/chat.ChatService/GetHistory',
      ($0.ChatGetHistoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatGetHistoryResponse.fromBuffer(value));
  static final _$endSession = $grpc.ClientMethod<$0.ChatEndSessionRequest, $0.ChatEndSessionResponse>(
      '/chat.ChatService/EndSession',
      ($0.ChatEndSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatEndSessionResponse.fromBuffer(value));
  static final _$getSessionInfo = $grpc.ClientMethod<$0.ChatGetSessionInfoRequest, $0.ChatSessionInfo>(
      '/chat.ChatService/GetSessionInfo',
      ($0.ChatGetSessionInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatSessionInfo.fromBuffer(value));
  static final _$listActiveSessions = $grpc.ClientMethod<$0.ChatListActiveSessionsRequest, $0.ChatListActiveSessionsResponse>(
      '/chat.ChatService/ListActiveSessions',
      ($0.ChatListActiveSessionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatListActiveSessionsResponse.fromBuffer(value));
  static final _$getHistoryByEmail = $grpc.ClientMethod<$0.ChatGetHistoryByEmailRequest, $0.ChatGetHistoryByEmailResponse>(
      '/chat.ChatService/GetHistoryByEmail',
      ($0.ChatGetHistoryByEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ChatGetHistoryByEmailResponse.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ChatCreateSessionResponse> createSession($0.ChatCreateSessionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createSession, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChatSendMessageResponse> sendMessage($0.ChatSendMessageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendMessage, request, options: options);
  }

  $grpc.ResponseStream<$0.ChatMessageChunk> sendMessageStream($0.ChatSendMessageRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$sendMessageStream, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.ChatGetHistoryResponse> getHistory($0.ChatGetHistoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHistory, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChatEndSessionResponse> endSession($0.ChatEndSessionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$endSession, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChatSessionInfo> getSessionInfo($0.ChatGetSessionInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSessionInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChatListActiveSessionsResponse> listActiveSessions($0.ChatListActiveSessionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listActiveSessions, request, options: options);
  }

  $grpc.ResponseFuture<$0.ChatGetHistoryByEmailResponse> getHistoryByEmail($0.ChatGetHistoryByEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHistoryByEmail, request, options: options);
  }
}

@$pb.GrpcServiceName('chat.ChatService')
abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.ChatCreateSessionRequest, $0.ChatCreateSessionResponse>(
        'CreateSession',
        createSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatCreateSessionRequest.fromBuffer(value),
        ($0.ChatCreateSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatSendMessageRequest, $0.ChatSendMessageResponse>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatSendMessageRequest.fromBuffer(value),
        ($0.ChatSendMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatSendMessageRequest, $0.ChatMessageChunk>(
        'SendMessageStream',
        sendMessageStream_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ChatSendMessageRequest.fromBuffer(value),
        ($0.ChatMessageChunk value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatGetHistoryRequest, $0.ChatGetHistoryResponse>(
        'GetHistory',
        getHistory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatGetHistoryRequest.fromBuffer(value),
        ($0.ChatGetHistoryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatEndSessionRequest, $0.ChatEndSessionResponse>(
        'EndSession',
        endSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatEndSessionRequest.fromBuffer(value),
        ($0.ChatEndSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatGetSessionInfoRequest, $0.ChatSessionInfo>(
        'GetSessionInfo',
        getSessionInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatGetSessionInfoRequest.fromBuffer(value),
        ($0.ChatSessionInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatListActiveSessionsRequest, $0.ChatListActiveSessionsResponse>(
        'ListActiveSessions',
        listActiveSessions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatListActiveSessionsRequest.fromBuffer(value),
        ($0.ChatListActiveSessionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ChatGetHistoryByEmailRequest, $0.ChatGetHistoryByEmailResponse>(
        'GetHistoryByEmail',
        getHistoryByEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ChatGetHistoryByEmailRequest.fromBuffer(value),
        ($0.ChatGetHistoryByEmailResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.ChatCreateSessionResponse> createSession_Pre($grpc.ServiceCall call, $async.Future<$0.ChatCreateSessionRequest> request) async {
    return createSession(call, await request);
  }

  $async.Future<$0.ChatSendMessageResponse> sendMessage_Pre($grpc.ServiceCall call, $async.Future<$0.ChatSendMessageRequest> request) async {
    return sendMessage(call, await request);
  }

  $async.Stream<$0.ChatMessageChunk> sendMessageStream_Pre($grpc.ServiceCall call, $async.Future<$0.ChatSendMessageRequest> request) async* {
    yield* sendMessageStream(call, await request);
  }

  $async.Future<$0.ChatGetHistoryResponse> getHistory_Pre($grpc.ServiceCall call, $async.Future<$0.ChatGetHistoryRequest> request) async {
    return getHistory(call, await request);
  }

  $async.Future<$0.ChatEndSessionResponse> endSession_Pre($grpc.ServiceCall call, $async.Future<$0.ChatEndSessionRequest> request) async {
    return endSession(call, await request);
  }

  $async.Future<$0.ChatSessionInfo> getSessionInfo_Pre($grpc.ServiceCall call, $async.Future<$0.ChatGetSessionInfoRequest> request) async {
    return getSessionInfo(call, await request);
  }

  $async.Future<$0.ChatListActiveSessionsResponse> listActiveSessions_Pre($grpc.ServiceCall call, $async.Future<$0.ChatListActiveSessionsRequest> request) async {
    return listActiveSessions(call, await request);
  }

  $async.Future<$0.ChatGetHistoryByEmailResponse> getHistoryByEmail_Pre($grpc.ServiceCall call, $async.Future<$0.ChatGetHistoryByEmailRequest> request) async {
    return getHistoryByEmail(call, await request);
  }

  $async.Future<$0.ChatCreateSessionResponse> createSession($grpc.ServiceCall call, $0.ChatCreateSessionRequest request);
  $async.Future<$0.ChatSendMessageResponse> sendMessage($grpc.ServiceCall call, $0.ChatSendMessageRequest request);
  $async.Stream<$0.ChatMessageChunk> sendMessageStream($grpc.ServiceCall call, $0.ChatSendMessageRequest request);
  $async.Future<$0.ChatGetHistoryResponse> getHistory($grpc.ServiceCall call, $0.ChatGetHistoryRequest request);
  $async.Future<$0.ChatEndSessionResponse> endSession($grpc.ServiceCall call, $0.ChatEndSessionRequest request);
  $async.Future<$0.ChatSessionInfo> getSessionInfo($grpc.ServiceCall call, $0.ChatGetSessionInfoRequest request);
  $async.Future<$0.ChatListActiveSessionsResponse> listActiveSessions($grpc.ServiceCall call, $0.ChatListActiveSessionsRequest request);
  $async.Future<$0.ChatGetHistoryByEmailResponse> getHistoryByEmail($grpc.ServiceCall call, $0.ChatGetHistoryByEmailRequest request);
}
