// This is a generated file - do not edit.
//
// Generated from prompts/prompt_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'prompt_service.pb.dart' as $0;

export 'prompt_service.pb.dart';

/// ============================================================================
/// Prompt Service - CRUD operations for ChatPrompts
/// ============================================================================
@$pb.GrpcServiceName('chat.PromptService')
class PromptServiceClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  PromptServiceClient(super.channel, {super.options, super.interceptors});

  /// Create a new prompt
  $grpc.ResponseFuture<$0.CreatePromptResponse> createPrompt(
    $0.CreatePromptRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$createPrompt, request, options: options);
  }

  /// Update an existing prompt
  $grpc.ResponseFuture<$0.UpdatePromptResponse> updatePrompt(
    $0.UpdatePromptRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$updatePrompt, request, options: options);
  }

  /// Delete a prompt
  $grpc.ResponseFuture<$0.DeletePromptResponse> deletePrompt(
    $0.DeletePromptRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$deletePrompt, request, options: options);
  }

  /// Get a prompt by ID
  $grpc.ResponseFuture<$0.PromptInfo> getPrompt(
    $0.GetPromptRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getPrompt, request, options: options);
  }

  /// List all prompts with optional pagination
  $grpc.ResponseFuture<$0.ListPromptsResponse> listPrompts(
    $0.ListPromptsRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$listPrompts, request, options: options);
  }

  /// Get prompts by type
  $grpc.ResponseFuture<$0.ListPromptsResponse> getPromptsByType(
    $0.GetPromptsByTypeRequest request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getPromptsByType, request, options: options);
  }

  // method descriptors

  static final _$createPrompt =
      $grpc.ClientMethod<$0.CreatePromptRequest, $0.CreatePromptResponse>(
          '/chat.PromptService/CreatePrompt',
          ($0.CreatePromptRequest value) => value.writeToBuffer(),
          $0.CreatePromptResponse.fromBuffer);
  static final _$updatePrompt =
      $grpc.ClientMethod<$0.UpdatePromptRequest, $0.UpdatePromptResponse>(
          '/chat.PromptService/UpdatePrompt',
          ($0.UpdatePromptRequest value) => value.writeToBuffer(),
          $0.UpdatePromptResponse.fromBuffer);
  static final _$deletePrompt =
      $grpc.ClientMethod<$0.DeletePromptRequest, $0.DeletePromptResponse>(
          '/chat.PromptService/DeletePrompt',
          ($0.DeletePromptRequest value) => value.writeToBuffer(),
          $0.DeletePromptResponse.fromBuffer);
  static final _$getPrompt =
      $grpc.ClientMethod<$0.GetPromptRequest, $0.PromptInfo>(
          '/chat.PromptService/GetPrompt',
          ($0.GetPromptRequest value) => value.writeToBuffer(),
          $0.PromptInfo.fromBuffer);
  static final _$listPrompts =
      $grpc.ClientMethod<$0.ListPromptsRequest, $0.ListPromptsResponse>(
          '/chat.PromptService/ListPrompts',
          ($0.ListPromptsRequest value) => value.writeToBuffer(),
          $0.ListPromptsResponse.fromBuffer);
  static final _$getPromptsByType =
      $grpc.ClientMethod<$0.GetPromptsByTypeRequest, $0.ListPromptsResponse>(
          '/chat.PromptService/GetPromptsByType',
          ($0.GetPromptsByTypeRequest value) => value.writeToBuffer(),
          $0.ListPromptsResponse.fromBuffer);
}

@$pb.GrpcServiceName('chat.PromptService')
abstract class PromptServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.PromptService';

  PromptServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.CreatePromptRequest, $0.CreatePromptResponse>(
            'CreatePrompt',
            createPrompt_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CreatePromptRequest.fromBuffer(value),
            ($0.CreatePromptResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdatePromptRequest, $0.UpdatePromptResponse>(
            'UpdatePrompt',
            updatePrompt_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdatePromptRequest.fromBuffer(value),
            ($0.UpdatePromptResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.DeletePromptRequest, $0.DeletePromptResponse>(
            'DeletePrompt',
            deletePrompt_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.DeletePromptRequest.fromBuffer(value),
            ($0.DeletePromptResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPromptRequest, $0.PromptInfo>(
        'GetPrompt',
        getPrompt_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPromptRequest.fromBuffer(value),
        ($0.PromptInfo value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ListPromptsRequest, $0.ListPromptsResponse>(
            'ListPrompts',
            listPrompts_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ListPromptsRequest.fromBuffer(value),
            ($0.ListPromptsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetPromptsByTypeRequest, $0.ListPromptsResponse>(
            'GetPromptsByType',
            getPromptsByType_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetPromptsByTypeRequest.fromBuffer(value),
            ($0.ListPromptsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreatePromptResponse> createPrompt_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.CreatePromptRequest> $request) async {
    return createPrompt($call, await $request);
  }

  $async.Future<$0.CreatePromptResponse> createPrompt(
      $grpc.ServiceCall call, $0.CreatePromptRequest request);

  $async.Future<$0.UpdatePromptResponse> updatePrompt_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.UpdatePromptRequest> $request) async {
    return updatePrompt($call, await $request);
  }

  $async.Future<$0.UpdatePromptResponse> updatePrompt(
      $grpc.ServiceCall call, $0.UpdatePromptRequest request);

  $async.Future<$0.DeletePromptResponse> deletePrompt_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.DeletePromptRequest> $request) async {
    return deletePrompt($call, await $request);
  }

  $async.Future<$0.DeletePromptResponse> deletePrompt(
      $grpc.ServiceCall call, $0.DeletePromptRequest request);

  $async.Future<$0.PromptInfo> getPrompt_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetPromptRequest> $request) async {
    return getPrompt($call, await $request);
  }

  $async.Future<$0.PromptInfo> getPrompt(
      $grpc.ServiceCall call, $0.GetPromptRequest request);

  $async.Future<$0.ListPromptsResponse> listPrompts_Pre($grpc.ServiceCall $call,
      $async.Future<$0.ListPromptsRequest> $request) async {
    return listPrompts($call, await $request);
  }

  $async.Future<$0.ListPromptsResponse> listPrompts(
      $grpc.ServiceCall call, $0.ListPromptsRequest request);

  $async.Future<$0.ListPromptsResponse> getPromptsByType_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetPromptsByTypeRequest> $request) async {
    return getPromptsByType($call, await $request);
  }

  $async.Future<$0.ListPromptsResponse> getPromptsByType(
      $grpc.ServiceCall call, $0.GetPromptsByTypeRequest request);
}
