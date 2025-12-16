//
//  Generated code. Do not modify.
//  source: support/support_service.proto
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

import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'support_service.pb.dart' as $0;

export 'support_service.pb.dart';

@$pb.GrpcServiceName('chat.SupportService')
class SupportServiceClient extends $grpc.Client {
  static final _$requestTransfer = $grpc.ClientMethod<$0.SupportRequestTransferRequest, $0.SupportRequestTransferResponse>(
      '/chat.SupportService/RequestTransfer',
      ($0.SupportRequestTransferRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SupportRequestTransferResponse.fromBuffer(value));
  static final _$acceptTransfer = $grpc.ClientMethod<$0.SupportAcceptTransferRequest, $0.SupportAcceptTransferResponse>(
      '/chat.SupportService/AcceptTransfer',
      ($0.SupportAcceptTransferRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SupportAcceptTransferResponse.fromBuffer(value));
  static final _$endSupportSession = $grpc.ClientMethod<$0.SupportEndSupportSessionRequest, $0.SupportEndSupportSessionResponse>(
      '/chat.SupportService/EndSupportSession',
      ($0.SupportEndSupportSessionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SupportEndSupportSessionResponse.fromBuffer(value));
  static final _$sendSupportMessage = $grpc.ClientMethod<$0.SupportSendSupportMessageRequest, $0.SupportSendSupportMessageResponse>(
      '/chat.SupportService/SendSupportMessage',
      ($0.SupportSendSupportMessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SupportSendSupportMessageResponse.fromBuffer(value));
  static final _$streamSupportMessages = $grpc.ClientMethod<$0.SupportStreamSupportMessagesRequest, $0.SupportMessage>(
      '/chat.SupportService/StreamSupportMessages',
      ($0.SupportStreamSupportMessagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SupportMessage.fromBuffer(value));
  static final _$listPendingTransfers = $grpc.ClientMethod<$0.SupportListPendingTransfersRequest, $0.SupportListPendingTransfersResponse>(
      '/chat.SupportService/ListPendingTransfers',
      ($0.SupportListPendingTransfersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SupportListPendingTransfersResponse.fromBuffer(value));
  static final _$getQueueStatus = $grpc.ClientMethod<$1.Empty, $0.SupportQueueStatusResponse>(
      '/chat.SupportService/GetQueueStatus',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.SupportQueueStatusResponse.fromBuffer(value));

  SupportServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.SupportRequestTransferResponse> requestTransfer($0.SupportRequestTransferRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$requestTransfer, request, options: options);
  }

  $grpc.ResponseFuture<$0.SupportAcceptTransferResponse> acceptTransfer($0.SupportAcceptTransferRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$acceptTransfer, request, options: options);
  }

  $grpc.ResponseFuture<$0.SupportEndSupportSessionResponse> endSupportSession($0.SupportEndSupportSessionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$endSupportSession, request, options: options);
  }

  $grpc.ResponseFuture<$0.SupportSendSupportMessageResponse> sendSupportMessage($0.SupportSendSupportMessageRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendSupportMessage, request, options: options);
  }

  $grpc.ResponseStream<$0.SupportMessage> streamSupportMessages($0.SupportStreamSupportMessagesRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamSupportMessages, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.SupportListPendingTransfersResponse> listPendingTransfers($0.SupportListPendingTransfersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listPendingTransfers, request, options: options);
  }

  $grpc.ResponseFuture<$0.SupportQueueStatusResponse> getQueueStatus($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getQueueStatus, request, options: options);
  }
}

@$pb.GrpcServiceName('chat.SupportService')
abstract class SupportServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.SupportService';

  SupportServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SupportRequestTransferRequest, $0.SupportRequestTransferResponse>(
        'RequestTransfer',
        requestTransfer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SupportRequestTransferRequest.fromBuffer(value),
        ($0.SupportRequestTransferResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SupportAcceptTransferRequest, $0.SupportAcceptTransferResponse>(
        'AcceptTransfer',
        acceptTransfer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SupportAcceptTransferRequest.fromBuffer(value),
        ($0.SupportAcceptTransferResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SupportEndSupportSessionRequest, $0.SupportEndSupportSessionResponse>(
        'EndSupportSession',
        endSupportSession_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SupportEndSupportSessionRequest.fromBuffer(value),
        ($0.SupportEndSupportSessionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SupportSendSupportMessageRequest, $0.SupportSendSupportMessageResponse>(
        'SendSupportMessage',
        sendSupportMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SupportSendSupportMessageRequest.fromBuffer(value),
        ($0.SupportSendSupportMessageResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SupportStreamSupportMessagesRequest, $0.SupportMessage>(
        'StreamSupportMessages',
        streamSupportMessages_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.SupportStreamSupportMessagesRequest.fromBuffer(value),
        ($0.SupportMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SupportListPendingTransfersRequest, $0.SupportListPendingTransfersResponse>(
        'ListPendingTransfers',
        listPendingTransfers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SupportListPendingTransfersRequest.fromBuffer(value),
        ($0.SupportListPendingTransfersResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.SupportQueueStatusResponse>(
        'GetQueueStatus',
        getQueueStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.SupportQueueStatusResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.SupportRequestTransferResponse> requestTransfer_Pre($grpc.ServiceCall call, $async.Future<$0.SupportRequestTransferRequest> request) async {
    return requestTransfer(call, await request);
  }

  $async.Future<$0.SupportAcceptTransferResponse> acceptTransfer_Pre($grpc.ServiceCall call, $async.Future<$0.SupportAcceptTransferRequest> request) async {
    return acceptTransfer(call, await request);
  }

  $async.Future<$0.SupportEndSupportSessionResponse> endSupportSession_Pre($grpc.ServiceCall call, $async.Future<$0.SupportEndSupportSessionRequest> request) async {
    return endSupportSession(call, await request);
  }

  $async.Future<$0.SupportSendSupportMessageResponse> sendSupportMessage_Pre($grpc.ServiceCall call, $async.Future<$0.SupportSendSupportMessageRequest> request) async {
    return sendSupportMessage(call, await request);
  }

  $async.Stream<$0.SupportMessage> streamSupportMessages_Pre($grpc.ServiceCall call, $async.Future<$0.SupportStreamSupportMessagesRequest> request) async* {
    yield* streamSupportMessages(call, await request);
  }

  $async.Future<$0.SupportListPendingTransfersResponse> listPendingTransfers_Pre($grpc.ServiceCall call, $async.Future<$0.SupportListPendingTransfersRequest> request) async {
    return listPendingTransfers(call, await request);
  }

  $async.Future<$0.SupportQueueStatusResponse> getQueueStatus_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getQueueStatus(call, await request);
  }

  $async.Future<$0.SupportRequestTransferResponse> requestTransfer($grpc.ServiceCall call, $0.SupportRequestTransferRequest request);
  $async.Future<$0.SupportAcceptTransferResponse> acceptTransfer($grpc.ServiceCall call, $0.SupportAcceptTransferRequest request);
  $async.Future<$0.SupportEndSupportSessionResponse> endSupportSession($grpc.ServiceCall call, $0.SupportEndSupportSessionRequest request);
  $async.Future<$0.SupportSendSupportMessageResponse> sendSupportMessage($grpc.ServiceCall call, $0.SupportSendSupportMessageRequest request);
  $async.Stream<$0.SupportMessage> streamSupportMessages($grpc.ServiceCall call, $0.SupportStreamSupportMessagesRequest request);
  $async.Future<$0.SupportListPendingTransfersResponse> listPendingTransfers($grpc.ServiceCall call, $0.SupportListPendingTransfersRequest request);
  $async.Future<$0.SupportQueueStatusResponse> getQueueStatus($grpc.ServiceCall call, $1.Empty request);
}
