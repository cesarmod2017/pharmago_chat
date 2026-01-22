// This is a generated file - do not edit.
//
// Generated from support/support_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;
import 'package:mod_proto_google/mod_proto_google.dart'
    as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class SupportRequestTransferRequest extends $pb.GeneratedMessage {
  factory SupportRequestTransferRequest({
    $core.String? sessionId,
    $core.String? reason,
    $core.int? priority,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (reason != null) result.reason = reason;
    if (priority != null) result.priority = priority;
    return result;
  }

  SupportRequestTransferRequest._();

  factory SupportRequestTransferRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportRequestTransferRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportRequestTransferRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..aI(3, _omitFieldNames ? '' : 'priority')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportRequestTransferRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportRequestTransferRequest copyWith(
          void Function(SupportRequestTransferRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SupportRequestTransferRequest))
          as SupportRequestTransferRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportRequestTransferRequest create() =>
      SupportRequestTransferRequest._();
  @$core.override
  SupportRequestTransferRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportRequestTransferRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportRequestTransferRequest>(create);
  static SupportRequestTransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get priority => $_getIZ(2);
  @$pb.TagNumber(3)
  set priority($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPriority() => $_has(2);
  @$pb.TagNumber(3)
  void clearPriority() => $_clearField(3);
}

class SupportRequestTransferResponse extends $pb.GeneratedMessage {
  factory SupportRequestTransferResponse({
    $core.String? transferId,
    $core.int? queuePosition,
    $core.String? estimatedWait,
    $2.Timestamp? requestedAt,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (queuePosition != null) result.queuePosition = queuePosition;
    if (estimatedWait != null) result.estimatedWait = estimatedWait;
    if (requestedAt != null) result.requestedAt = requestedAt;
    return result;
  }

  SupportRequestTransferResponse._();

  factory SupportRequestTransferResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportRequestTransferResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportRequestTransferResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..aI(2, _omitFieldNames ? '' : 'queuePosition')
    ..aOS(3, _omitFieldNames ? '' : 'estimatedWait')
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'requestedAt',
        subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportRequestTransferResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportRequestTransferResponse copyWith(
          void Function(SupportRequestTransferResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SupportRequestTransferResponse))
          as SupportRequestTransferResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportRequestTransferResponse create() =>
      SupportRequestTransferResponse._();
  @$core.override
  SupportRequestTransferResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportRequestTransferResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportRequestTransferResponse>(create);
  static SupportRequestTransferResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get queuePosition => $_getIZ(1);
  @$pb.TagNumber(2)
  set queuePosition($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQueuePosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearQueuePosition() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get estimatedWait => $_getSZ(2);
  @$pb.TagNumber(3)
  set estimatedWait($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEstimatedWait() => $_has(2);
  @$pb.TagNumber(3)
  void clearEstimatedWait() => $_clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get requestedAt => $_getN(3);
  @$pb.TagNumber(4)
  set requestedAt($2.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRequestedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequestedAt() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureRequestedAt() => $_ensure(3);
}

class SupportAcceptTransferRequest extends $pb.GeneratedMessage {
  factory SupportAcceptTransferRequest({
    $core.String? transferId,
    $core.String? operatorId,
    $core.String? operatorName,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (operatorId != null) result.operatorId = operatorId;
    if (operatorName != null) result.operatorName = operatorName;
    return result;
  }

  SupportAcceptTransferRequest._();

  factory SupportAcceptTransferRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportAcceptTransferRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportAcceptTransferRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..aOS(2, _omitFieldNames ? '' : 'operatorId')
    ..aOS(3, _omitFieldNames ? '' : 'operatorName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportAcceptTransferRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportAcceptTransferRequest copyWith(
          void Function(SupportAcceptTransferRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SupportAcceptTransferRequest))
          as SupportAcceptTransferRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportAcceptTransferRequest create() =>
      SupportAcceptTransferRequest._();
  @$core.override
  SupportAcceptTransferRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportAcceptTransferRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportAcceptTransferRequest>(create);
  static SupportAcceptTransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get operatorId => $_getSZ(1);
  @$pb.TagNumber(2)
  set operatorId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOperatorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperatorId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get operatorName => $_getSZ(2);
  @$pb.TagNumber(3)
  set operatorName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOperatorName() => $_has(2);
  @$pb.TagNumber(3)
  void clearOperatorName() => $_clearField(3);
}

class SupportAcceptTransferResponse extends $pb.GeneratedMessage {
  factory SupportAcceptTransferResponse({
    $core.bool? success,
    $core.String? sessionId,
    $core.String? userName,
    $core.String? userEmail,
    $core.Iterable<SupportChatMessage>? history,
    $2.Timestamp? acceptedAt,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (sessionId != null) result.sessionId = sessionId;
    if (userName != null) result.userName = userName;
    if (userEmail != null) result.userEmail = userEmail;
    if (history != null) result.history.addAll(history);
    if (acceptedAt != null) result.acceptedAt = acceptedAt;
    return result;
  }

  SupportAcceptTransferResponse._();

  factory SupportAcceptTransferResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportAcceptTransferResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportAcceptTransferResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'sessionId')
    ..aOS(3, _omitFieldNames ? '' : 'userName')
    ..aOS(4, _omitFieldNames ? '' : 'userEmail')
    ..pPM<SupportChatMessage>(5, _omitFieldNames ? '' : 'history',
        subBuilder: SupportChatMessage.create)
    ..aOM<$2.Timestamp>(6, _omitFieldNames ? '' : 'acceptedAt',
        subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportAcceptTransferResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportAcceptTransferResponse copyWith(
          void Function(SupportAcceptTransferResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SupportAcceptTransferResponse))
          as SupportAcceptTransferResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportAcceptTransferResponse create() =>
      SupportAcceptTransferResponse._();
  @$core.override
  SupportAcceptTransferResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportAcceptTransferResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportAcceptTransferResponse>(create);
  static SupportAcceptTransferResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get sessionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sessionId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userName => $_getSZ(2);
  @$pb.TagNumber(3)
  set userName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserName() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get userEmail => $_getSZ(3);
  @$pb.TagNumber(4)
  set userEmail($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserEmail() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<SupportChatMessage> get history => $_getList(4);

  @$pb.TagNumber(6)
  $2.Timestamp get acceptedAt => $_getN(5);
  @$pb.TagNumber(6)
  set acceptedAt($2.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasAcceptedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearAcceptedAt() => $_clearField(6);
  @$pb.TagNumber(6)
  $2.Timestamp ensureAcceptedAt() => $_ensure(5);
}

class SupportEndSupportSessionRequest extends $pb.GeneratedMessage {
  factory SupportEndSupportSessionRequest({
    $core.String? sessionId,
    $core.String? operatorId,
    $core.String? resolution,
    $core.String? notes,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (operatorId != null) result.operatorId = operatorId;
    if (resolution != null) result.resolution = resolution;
    if (notes != null) result.notes = notes;
    return result;
  }

  SupportEndSupportSessionRequest._();

  factory SupportEndSupportSessionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportEndSupportSessionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportEndSupportSessionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aOS(2, _omitFieldNames ? '' : 'operatorId')
    ..aOS(3, _omitFieldNames ? '' : 'resolution')
    ..aOS(4, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportEndSupportSessionRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportEndSupportSessionRequest copyWith(
          void Function(SupportEndSupportSessionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SupportEndSupportSessionRequest))
          as SupportEndSupportSessionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportEndSupportSessionRequest create() =>
      SupportEndSupportSessionRequest._();
  @$core.override
  SupportEndSupportSessionRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportEndSupportSessionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportEndSupportSessionRequest>(
          create);
  static SupportEndSupportSessionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get operatorId => $_getSZ(1);
  @$pb.TagNumber(2)
  set operatorId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOperatorId() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperatorId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get resolution => $_getSZ(2);
  @$pb.TagNumber(3)
  set resolution($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasResolution() => $_has(2);
  @$pb.TagNumber(3)
  void clearResolution() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get notes => $_getSZ(3);
  @$pb.TagNumber(4)
  set notes($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearNotes() => $_clearField(4);
}

class SupportEndSupportSessionResponse extends $pb.GeneratedMessage {
  factory SupportEndSupportSessionResponse({
    $core.bool? success,
    $2.Timestamp? endedAt,
    $core.int? supportDurationSeconds,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (endedAt != null) result.endedAt = endedAt;
    if (supportDurationSeconds != null)
      result.supportDurationSeconds = supportDurationSeconds;
    return result;
  }

  SupportEndSupportSessionResponse._();

  factory SupportEndSupportSessionResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportEndSupportSessionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportEndSupportSessionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'endedAt',
        subBuilder: $2.Timestamp.create)
    ..aI(3, _omitFieldNames ? '' : 'supportDurationSeconds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportEndSupportSessionResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportEndSupportSessionResponse copyWith(
          void Function(SupportEndSupportSessionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SupportEndSupportSessionResponse))
          as SupportEndSupportSessionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportEndSupportSessionResponse create() =>
      SupportEndSupportSessionResponse._();
  @$core.override
  SupportEndSupportSessionResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportEndSupportSessionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportEndSupportSessionResponse>(
          create);
  static SupportEndSupportSessionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get endedAt => $_getN(1);
  @$pb.TagNumber(2)
  set endedAt($2.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasEndedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndedAt() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureEndedAt() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get supportDurationSeconds => $_getIZ(2);
  @$pb.TagNumber(3)
  set supportDurationSeconds($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSupportDurationSeconds() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupportDurationSeconds() => $_clearField(3);
}

class SupportSendSupportMessageRequest extends $pb.GeneratedMessage {
  factory SupportSendSupportMessageRequest({
    $core.String? sessionId,
    $core.String? senderId,
    $core.String? senderType,
    $core.String? message,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (senderId != null) result.senderId = senderId;
    if (senderType != null) result.senderType = senderType;
    if (message != null) result.message = message;
    return result;
  }

  SupportSendSupportMessageRequest._();

  factory SupportSendSupportMessageRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportSendSupportMessageRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportSendSupportMessageRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aOS(2, _omitFieldNames ? '' : 'senderId')
    ..aOS(3, _omitFieldNames ? '' : 'senderType')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportSendSupportMessageRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportSendSupportMessageRequest copyWith(
          void Function(SupportSendSupportMessageRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SupportSendSupportMessageRequest))
          as SupportSendSupportMessageRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportSendSupportMessageRequest create() =>
      SupportSendSupportMessageRequest._();
  @$core.override
  SupportSendSupportMessageRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportSendSupportMessageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportSendSupportMessageRequest>(
          create);
  static SupportSendSupportMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get senderId => $_getSZ(1);
  @$pb.TagNumber(2)
  set senderId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSenderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSenderId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get senderType => $_getSZ(2);
  @$pb.TagNumber(3)
  set senderType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSenderType() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => $_clearField(4);
}

class SupportSendSupportMessageResponse extends $pb.GeneratedMessage {
  factory SupportSendSupportMessageResponse({
    $core.String? messageId,
    $2.Timestamp? timestamp,
    $core.bool? delivered,
  }) {
    final result = create();
    if (messageId != null) result.messageId = messageId;
    if (timestamp != null) result.timestamp = timestamp;
    if (delivered != null) result.delivered = delivered;
    return result;
  }

  SupportSendSupportMessageResponse._();

  factory SupportSendSupportMessageResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportSendSupportMessageResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportSendSupportMessageResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..aOM<$2.Timestamp>(2, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $2.Timestamp.create)
    ..aOB(3, _omitFieldNames ? '' : 'delivered')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportSendSupportMessageResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportSendSupportMessageResponse copyWith(
          void Function(SupportSendSupportMessageResponse) updates) =>
      super.copyWith((message) =>
              updates(message as SupportSendSupportMessageResponse))
          as SupportSendSupportMessageResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportSendSupportMessageResponse create() =>
      SupportSendSupportMessageResponse._();
  @$core.override
  SupportSendSupportMessageResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportSendSupportMessageResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportSendSupportMessageResponse>(
          create);
  static SupportSendSupportMessageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.Timestamp get timestamp => $_getN(1);
  @$pb.TagNumber(2)
  set timestamp($2.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasTimestamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimestamp() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.Timestamp ensureTimestamp() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get delivered => $_getBF(2);
  @$pb.TagNumber(3)
  set delivered($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDelivered() => $_has(2);
  @$pb.TagNumber(3)
  void clearDelivered() => $_clearField(3);
}

class SupportStreamSupportMessagesRequest extends $pb.GeneratedMessage {
  factory SupportStreamSupportMessagesRequest({
    $core.String? sessionId,
    $core.String? subscriberId,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (subscriberId != null) result.subscriberId = subscriberId;
    return result;
  }

  SupportStreamSupportMessagesRequest._();

  factory SupportStreamSupportMessagesRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportStreamSupportMessagesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportStreamSupportMessagesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sessionId')
    ..aOS(2, _omitFieldNames ? '' : 'subscriberId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportStreamSupportMessagesRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportStreamSupportMessagesRequest copyWith(
          void Function(SupportStreamSupportMessagesRequest) updates) =>
      super.copyWith((message) =>
              updates(message as SupportStreamSupportMessagesRequest))
          as SupportStreamSupportMessagesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportStreamSupportMessagesRequest create() =>
      SupportStreamSupportMessagesRequest._();
  @$core.override
  SupportStreamSupportMessagesRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportStreamSupportMessagesRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SupportStreamSupportMessagesRequest>(create);
  static SupportStreamSupportMessagesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get subscriberId => $_getSZ(1);
  @$pb.TagNumber(2)
  set subscriberId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSubscriberId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubscriberId() => $_clearField(2);
}

class SupportMessage extends $pb.GeneratedMessage {
  factory SupportMessage({
    $core.String? messageId,
    $core.String? sessionId,
    $core.String? senderId,
    $core.String? senderType,
    $core.String? senderName,
    $core.String? content,
    $2.Timestamp? timestamp,
    $core.String? messageType,
  }) {
    final result = create();
    if (messageId != null) result.messageId = messageId;
    if (sessionId != null) result.sessionId = sessionId;
    if (senderId != null) result.senderId = senderId;
    if (senderType != null) result.senderType = senderType;
    if (senderName != null) result.senderName = senderName;
    if (content != null) result.content = content;
    if (timestamp != null) result.timestamp = timestamp;
    if (messageType != null) result.messageType = messageType;
    return result;
  }

  SupportMessage._();

  factory SupportMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..aOS(2, _omitFieldNames ? '' : 'sessionId')
    ..aOS(3, _omitFieldNames ? '' : 'senderId')
    ..aOS(4, _omitFieldNames ? '' : 'senderType')
    ..aOS(5, _omitFieldNames ? '' : 'senderName')
    ..aOS(6, _omitFieldNames ? '' : 'content')
    ..aOM<$2.Timestamp>(7, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $2.Timestamp.create)
    ..aOS(8, _omitFieldNames ? '' : 'messageType')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportMessage copyWith(void Function(SupportMessage) updates) =>
      super.copyWith((message) => updates(message as SupportMessage))
          as SupportMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportMessage create() => SupportMessage._();
  @$core.override
  SupportMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportMessage>(create);
  static SupportMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get sessionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sessionId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get senderId => $_getSZ(2);
  @$pb.TagNumber(3)
  set senderId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSenderId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get senderType => $_getSZ(3);
  @$pb.TagNumber(4)
  set senderType($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSenderType() => $_has(3);
  @$pb.TagNumber(4)
  void clearSenderType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get senderName => $_getSZ(4);
  @$pb.TagNumber(5)
  set senderName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSenderName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSenderName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get content => $_getSZ(5);
  @$pb.TagNumber(6)
  set content($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasContent() => $_has(5);
  @$pb.TagNumber(6)
  void clearContent() => $_clearField(6);

  @$pb.TagNumber(7)
  $2.Timestamp get timestamp => $_getN(6);
  @$pb.TagNumber(7)
  set timestamp($2.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasTimestamp() => $_has(6);
  @$pb.TagNumber(7)
  void clearTimestamp() => $_clearField(7);
  @$pb.TagNumber(7)
  $2.Timestamp ensureTimestamp() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get messageType => $_getSZ(7);
  @$pb.TagNumber(8)
  set messageType($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasMessageType() => $_has(7);
  @$pb.TagNumber(8)
  void clearMessageType() => $_clearField(8);
}

class SupportListPendingTransfersRequest extends $pb.GeneratedMessage {
  factory SupportListPendingTransfersRequest({
    $core.int? limit,
    $core.int? offset,
  }) {
    final result = create();
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    return result;
  }

  SupportListPendingTransfersRequest._();

  factory SupportListPendingTransfersRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportListPendingTransfersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportListPendingTransfersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'limit')
    ..aI(2, _omitFieldNames ? '' : 'offset')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportListPendingTransfersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportListPendingTransfersRequest copyWith(
          void Function(SupportListPendingTransfersRequest) updates) =>
      super.copyWith((message) =>
              updates(message as SupportListPendingTransfersRequest))
          as SupportListPendingTransfersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportListPendingTransfersRequest create() =>
      SupportListPendingTransfersRequest._();
  @$core.override
  SupportListPendingTransfersRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportListPendingTransfersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportListPendingTransfersRequest>(
          create);
  static SupportListPendingTransfersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get limit => $_getIZ(0);
  @$pb.TagNumber(1)
  set limit($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearLimit() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);
}

class SupportListPendingTransfersResponse extends $pb.GeneratedMessage {
  factory SupportListPendingTransfersResponse({
    $core.Iterable<SupportTransferRequest>? transfers,
    $core.int? totalCount,
  }) {
    final result = create();
    if (transfers != null) result.transfers.addAll(transfers);
    if (totalCount != null) result.totalCount = totalCount;
    return result;
  }

  SupportListPendingTransfersResponse._();

  factory SupportListPendingTransfersResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportListPendingTransfersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportListPendingTransfersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..pPM<SupportTransferRequest>(1, _omitFieldNames ? '' : 'transfers',
        subBuilder: SupportTransferRequest.create)
    ..aI(2, _omitFieldNames ? '' : 'totalCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportListPendingTransfersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportListPendingTransfersResponse copyWith(
          void Function(SupportListPendingTransfersResponse) updates) =>
      super.copyWith((message) =>
              updates(message as SupportListPendingTransfersResponse))
          as SupportListPendingTransfersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportListPendingTransfersResponse create() =>
      SupportListPendingTransfersResponse._();
  @$core.override
  SupportListPendingTransfersResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportListPendingTransfersResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          SupportListPendingTransfersResponse>(create);
  static SupportListPendingTransfersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SupportTransferRequest> get transfers => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);
}

class SupportTransferRequest extends $pb.GeneratedMessage {
  factory SupportTransferRequest({
    $core.String? transferId,
    $core.String? sessionId,
    $core.String? userName,
    $core.String? userEmail,
    $core.String? reason,
    $core.int? priority,
    $2.Timestamp? requestedAt,
    $core.int? waitTimeSeconds,
    $core.String? lastMessage,
  }) {
    final result = create();
    if (transferId != null) result.transferId = transferId;
    if (sessionId != null) result.sessionId = sessionId;
    if (userName != null) result.userName = userName;
    if (userEmail != null) result.userEmail = userEmail;
    if (reason != null) result.reason = reason;
    if (priority != null) result.priority = priority;
    if (requestedAt != null) result.requestedAt = requestedAt;
    if (waitTimeSeconds != null) result.waitTimeSeconds = waitTimeSeconds;
    if (lastMessage != null) result.lastMessage = lastMessage;
    return result;
  }

  SupportTransferRequest._();

  factory SupportTransferRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportTransferRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportTransferRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transferId')
    ..aOS(2, _omitFieldNames ? '' : 'sessionId')
    ..aOS(3, _omitFieldNames ? '' : 'userName')
    ..aOS(4, _omitFieldNames ? '' : 'userEmail')
    ..aOS(5, _omitFieldNames ? '' : 'reason')
    ..aI(6, _omitFieldNames ? '' : 'priority')
    ..aOM<$2.Timestamp>(7, _omitFieldNames ? '' : 'requestedAt',
        subBuilder: $2.Timestamp.create)
    ..aI(8, _omitFieldNames ? '' : 'waitTimeSeconds')
    ..aOS(9, _omitFieldNames ? '' : 'lastMessage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportTransferRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportTransferRequest copyWith(
          void Function(SupportTransferRequest) updates) =>
      super.copyWith((message) => updates(message as SupportTransferRequest))
          as SupportTransferRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportTransferRequest create() => SupportTransferRequest._();
  @$core.override
  SupportTransferRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportTransferRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportTransferRequest>(create);
  static SupportTransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get transferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transferId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransferId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get sessionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sessionId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get userName => $_getSZ(2);
  @$pb.TagNumber(3)
  set userName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserName() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get userEmail => $_getSZ(3);
  @$pb.TagNumber(4)
  set userEmail($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUserEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserEmail() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get reason => $_getSZ(4);
  @$pb.TagNumber(5)
  set reason($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReason() => $_has(4);
  @$pb.TagNumber(5)
  void clearReason() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get priority => $_getIZ(5);
  @$pb.TagNumber(6)
  set priority($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPriority() => $_has(5);
  @$pb.TagNumber(6)
  void clearPriority() => $_clearField(6);

  @$pb.TagNumber(7)
  $2.Timestamp get requestedAt => $_getN(6);
  @$pb.TagNumber(7)
  set requestedAt($2.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasRequestedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearRequestedAt() => $_clearField(7);
  @$pb.TagNumber(7)
  $2.Timestamp ensureRequestedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get waitTimeSeconds => $_getIZ(7);
  @$pb.TagNumber(8)
  set waitTimeSeconds($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasWaitTimeSeconds() => $_has(7);
  @$pb.TagNumber(8)
  void clearWaitTimeSeconds() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get lastMessage => $_getSZ(8);
  @$pb.TagNumber(9)
  set lastMessage($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasLastMessage() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastMessage() => $_clearField(9);
}

class SupportQueueStatusResponse extends $pb.GeneratedMessage {
  factory SupportQueueStatusResponse({
    $core.int? pendingTransfers,
    $core.int? activeSupportSessions,
    $core.int? availableOperators,
    $core.double? averageWaitTimeSeconds,
  }) {
    final result = create();
    if (pendingTransfers != null) result.pendingTransfers = pendingTransfers;
    if (activeSupportSessions != null)
      result.activeSupportSessions = activeSupportSessions;
    if (availableOperators != null)
      result.availableOperators = availableOperators;
    if (averageWaitTimeSeconds != null)
      result.averageWaitTimeSeconds = averageWaitTimeSeconds;
    return result;
  }

  SupportQueueStatusResponse._();

  factory SupportQueueStatusResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportQueueStatusResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportQueueStatusResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'pendingTransfers')
    ..aI(2, _omitFieldNames ? '' : 'activeSupportSessions')
    ..aI(3, _omitFieldNames ? '' : 'availableOperators')
    ..aD(4, _omitFieldNames ? '' : 'averageWaitTimeSeconds',
        fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportQueueStatusResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportQueueStatusResponse copyWith(
          void Function(SupportQueueStatusResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SupportQueueStatusResponse))
          as SupportQueueStatusResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportQueueStatusResponse create() => SupportQueueStatusResponse._();
  @$core.override
  SupportQueueStatusResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportQueueStatusResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportQueueStatusResponse>(create);
  static SupportQueueStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pendingTransfers => $_getIZ(0);
  @$pb.TagNumber(1)
  set pendingTransfers($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPendingTransfers() => $_has(0);
  @$pb.TagNumber(1)
  void clearPendingTransfers() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get activeSupportSessions => $_getIZ(1);
  @$pb.TagNumber(2)
  set activeSupportSessions($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasActiveSupportSessions() => $_has(1);
  @$pb.TagNumber(2)
  void clearActiveSupportSessions() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get availableOperators => $_getIZ(2);
  @$pb.TagNumber(3)
  set availableOperators($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAvailableOperators() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvailableOperators() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get averageWaitTimeSeconds => $_getN(3);
  @$pb.TagNumber(4)
  set averageWaitTimeSeconds($core.double value) => $_setFloat(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAverageWaitTimeSeconds() => $_has(3);
  @$pb.TagNumber(4)
  void clearAverageWaitTimeSeconds() => $_clearField(4);
}

class SupportChatMessage extends $pb.GeneratedMessage {
  factory SupportChatMessage({
    $core.String? messageId,
    $core.String? role,
    $core.String? content,
    $2.Timestamp? timestamp,
    $core.String? modelUsed,
    $core.int? tokensUsed,
  }) {
    final result = create();
    if (messageId != null) result.messageId = messageId;
    if (role != null) result.role = role;
    if (content != null) result.content = content;
    if (timestamp != null) result.timestamp = timestamp;
    if (modelUsed != null) result.modelUsed = modelUsed;
    if (tokensUsed != null) result.tokensUsed = tokensUsed;
    return result;
  }

  SupportChatMessage._();

  factory SupportChatMessage.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupportChatMessage.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupportChatMessage',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'messageId')
    ..aOS(2, _omitFieldNames ? '' : 'role')
    ..aOS(3, _omitFieldNames ? '' : 'content')
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $2.Timestamp.create)
    ..aOS(5, _omitFieldNames ? '' : 'modelUsed')
    ..aI(6, _omitFieldNames ? '' : 'tokensUsed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportChatMessage clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupportChatMessage copyWith(void Function(SupportChatMessage) updates) =>
      super.copyWith((message) => updates(message as SupportChatMessage))
          as SupportChatMessage;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupportChatMessage create() => SupportChatMessage._();
  @$core.override
  SupportChatMessage createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SupportChatMessage getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupportChatMessage>(create);
  static SupportChatMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get messageId => $_getSZ(0);
  @$pb.TagNumber(1)
  set messageId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMessageId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get role => $_getSZ(1);
  @$pb.TagNumber(2)
  set role($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRole() => $_has(1);
  @$pb.TagNumber(2)
  void clearRole() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get content => $_getSZ(2);
  @$pb.TagNumber(3)
  set content($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get timestamp => $_getN(3);
  @$pb.TagNumber(4)
  set timestamp($2.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureTimestamp() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get modelUsed => $_getSZ(4);
  @$pb.TagNumber(5)
  set modelUsed($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasModelUsed() => $_has(4);
  @$pb.TagNumber(5)
  void clearModelUsed() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get tokensUsed => $_getIZ(5);
  @$pb.TagNumber(6)
  set tokensUsed($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTokensUsed() => $_has(5);
  @$pb.TagNumber(6)
  void clearTokensUsed() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
