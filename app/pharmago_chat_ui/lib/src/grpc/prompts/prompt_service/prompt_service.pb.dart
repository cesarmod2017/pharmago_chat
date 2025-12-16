//
//  Generated code. Do not modify.
//  source: prompts/prompt_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'package:protobuf_google/protobuf_google.dart' as $1;

class CreatePromptRequest extends $pb.GeneratedMessage {
  factory CreatePromptRequest({
    $core.String? name,
    $core.String? type,
    $core.String? prompt,
    $core.String? welcomeMessage,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (type != null) {
      $result.type = type;
    }
    if (prompt != null) {
      $result.prompt = prompt;
    }
    if (welcomeMessage != null) {
      $result.welcomeMessage = welcomeMessage;
    }
    return $result;
  }
  CreatePromptRequest._() : super();
  factory CreatePromptRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePromptRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePromptRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'type')
    ..aOS(3, _omitFieldNames ? '' : 'prompt')
    ..aOS(4, _omitFieldNames ? '' : 'welcomeMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePromptRequest clone() => CreatePromptRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePromptRequest copyWith(void Function(CreatePromptRequest) updates) => super.copyWith((message) => updates(message as CreatePromptRequest)) as CreatePromptRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePromptRequest create() => CreatePromptRequest._();
  CreatePromptRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePromptRequest> createRepeated() => $pb.PbList<CreatePromptRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePromptRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePromptRequest>(create);
  static CreatePromptRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get prompt => $_getSZ(2);
  @$pb.TagNumber(3)
  set prompt($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPrompt() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrompt() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get welcomeMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set welcomeMessage($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWelcomeMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearWelcomeMessage() => clearField(4);
}

class CreatePromptResponse extends $pb.GeneratedMessage {
  factory CreatePromptResponse({
    $core.String? id,
    $1.Timestamp? createdAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  CreatePromptResponse._() : super();
  factory CreatePromptResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePromptResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePromptResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePromptResponse clone() => CreatePromptResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePromptResponse copyWith(void Function(CreatePromptResponse) updates) => super.copyWith((message) => updates(message as CreatePromptResponse)) as CreatePromptResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePromptResponse create() => CreatePromptResponse._();
  CreatePromptResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePromptResponse> createRepeated() => $pb.PbList<CreatePromptResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePromptResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePromptResponse>(create);
  static CreatePromptResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

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
}

class UpdatePromptRequest extends $pb.GeneratedMessage {
  factory UpdatePromptRequest({
    $core.String? id,
    $core.String? name,
    $core.String? type,
    $core.String? prompt,
    $core.String? welcomeMessage,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (type != null) {
      $result.type = type;
    }
    if (prompt != null) {
      $result.prompt = prompt;
    }
    if (welcomeMessage != null) {
      $result.welcomeMessage = welcomeMessage;
    }
    return $result;
  }
  UpdatePromptRequest._() : super();
  factory UpdatePromptRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePromptRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePromptRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..aOS(4, _omitFieldNames ? '' : 'prompt')
    ..aOS(5, _omitFieldNames ? '' : 'welcomeMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePromptRequest clone() => UpdatePromptRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePromptRequest copyWith(void Function(UpdatePromptRequest) updates) => super.copyWith((message) => updates(message as UpdatePromptRequest)) as UpdatePromptRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePromptRequest create() => UpdatePromptRequest._();
  UpdatePromptRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePromptRequest> createRepeated() => $pb.PbList<UpdatePromptRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePromptRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePromptRequest>(create);
  static UpdatePromptRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get prompt => $_getSZ(3);
  @$pb.TagNumber(4)
  set prompt($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrompt() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrompt() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get welcomeMessage => $_getSZ(4);
  @$pb.TagNumber(5)
  set welcomeMessage($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWelcomeMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearWelcomeMessage() => clearField(5);
}

class UpdatePromptResponse extends $pb.GeneratedMessage {
  factory UpdatePromptResponse({
    $core.bool? success,
    $1.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  UpdatePromptResponse._() : super();
  factory UpdatePromptResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePromptResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePromptResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'updatedAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePromptResponse clone() => UpdatePromptResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePromptResponse copyWith(void Function(UpdatePromptResponse) updates) => super.copyWith((message) => updates(message as UpdatePromptResponse)) as UpdatePromptResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePromptResponse create() => UpdatePromptResponse._();
  UpdatePromptResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePromptResponse> createRepeated() => $pb.PbList<UpdatePromptResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePromptResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePromptResponse>(create);
  static UpdatePromptResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $1.Timestamp get updatedAt => $_getN(1);
  @$pb.TagNumber(2)
  set updatedAt($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpdatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdatedAt() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureUpdatedAt() => $_ensure(1);
}

class DeletePromptRequest extends $pb.GeneratedMessage {
  factory DeletePromptRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  DeletePromptRequest._() : super();
  factory DeletePromptRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePromptRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePromptRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePromptRequest clone() => DeletePromptRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePromptRequest copyWith(void Function(DeletePromptRequest) updates) => super.copyWith((message) => updates(message as DeletePromptRequest)) as DeletePromptRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePromptRequest create() => DeletePromptRequest._();
  DeletePromptRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePromptRequest> createRepeated() => $pb.PbList<DeletePromptRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePromptRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePromptRequest>(create);
  static DeletePromptRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class DeletePromptResponse extends $pb.GeneratedMessage {
  factory DeletePromptResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeletePromptResponse._() : super();
  factory DeletePromptResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePromptResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePromptResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePromptResponse clone() => DeletePromptResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePromptResponse copyWith(void Function(DeletePromptResponse) updates) => super.copyWith((message) => updates(message as DeletePromptResponse)) as DeletePromptResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePromptResponse create() => DeletePromptResponse._();
  DeletePromptResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePromptResponse> createRepeated() => $pb.PbList<DeletePromptResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePromptResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePromptResponse>(create);
  static DeletePromptResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class GetPromptRequest extends $pb.GeneratedMessage {
  factory GetPromptRequest({
    $core.String? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetPromptRequest._() : super();
  factory GetPromptRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPromptRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPromptRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPromptRequest clone() => GetPromptRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPromptRequest copyWith(void Function(GetPromptRequest) updates) => super.copyWith((message) => updates(message as GetPromptRequest)) as GetPromptRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPromptRequest create() => GetPromptRequest._();
  GetPromptRequest createEmptyInstance() => create();
  static $pb.PbList<GetPromptRequest> createRepeated() => $pb.PbList<GetPromptRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPromptRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPromptRequest>(create);
  static GetPromptRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class ListPromptsRequest extends $pb.GeneratedMessage {
  factory ListPromptsRequest({
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  ListPromptsRequest._() : super();
  factory ListPromptsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPromptsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPromptsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPromptsRequest clone() => ListPromptsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPromptsRequest copyWith(void Function(ListPromptsRequest) updates) => super.copyWith((message) => updates(message as ListPromptsRequest)) as ListPromptsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPromptsRequest create() => ListPromptsRequest._();
  ListPromptsRequest createEmptyInstance() => create();
  static $pb.PbList<ListPromptsRequest> createRepeated() => $pb.PbList<ListPromptsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListPromptsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPromptsRequest>(create);
  static ListPromptsRequest? _defaultInstance;

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
}

class GetPromptsByTypeRequest extends $pb.GeneratedMessage {
  factory GetPromptsByTypeRequest({
    $core.String? type,
    $core.int? limit,
    $core.int? offset,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  GetPromptsByTypeRequest._() : super();
  factory GetPromptsByTypeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPromptsByTypeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPromptsByTypeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'type')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPromptsByTypeRequest clone() => GetPromptsByTypeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPromptsByTypeRequest copyWith(void Function(GetPromptsByTypeRequest) updates) => super.copyWith((message) => updates(message as GetPromptsByTypeRequest)) as GetPromptsByTypeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPromptsByTypeRequest create() => GetPromptsByTypeRequest._();
  GetPromptsByTypeRequest createEmptyInstance() => create();
  static $pb.PbList<GetPromptsByTypeRequest> createRepeated() => $pb.PbList<GetPromptsByTypeRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPromptsByTypeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPromptsByTypeRequest>(create);
  static GetPromptsByTypeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get type => $_getSZ(0);
  @$pb.TagNumber(1)
  set type($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

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

class ListPromptsResponse extends $pb.GeneratedMessage {
  factory ListPromptsResponse({
    $core.Iterable<PromptInfo>? prompts,
    $core.int? totalCount,
  }) {
    final $result = create();
    if (prompts != null) {
      $result.prompts.addAll(prompts);
    }
    if (totalCount != null) {
      $result.totalCount = totalCount;
    }
    return $result;
  }
  ListPromptsResponse._() : super();
  factory ListPromptsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPromptsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPromptsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<PromptInfo>(1, _omitFieldNames ? '' : 'prompts', $pb.PbFieldType.PM, subBuilder: PromptInfo.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPromptsResponse clone() => ListPromptsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPromptsResponse copyWith(void Function(ListPromptsResponse) updates) => super.copyWith((message) => updates(message as ListPromptsResponse)) as ListPromptsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPromptsResponse create() => ListPromptsResponse._();
  ListPromptsResponse createEmptyInstance() => create();
  static $pb.PbList<ListPromptsResponse> createRepeated() => $pb.PbList<ListPromptsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPromptsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPromptsResponse>(create);
  static ListPromptsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PromptInfo> get prompts => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => clearField(2);
}

class PromptInfo extends $pb.GeneratedMessage {
  factory PromptInfo({
    $core.String? id,
    $core.String? name,
    $core.String? type,
    $core.String? prompt,
    $core.String? welcomeMessage,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (type != null) {
      $result.type = type;
    }
    if (prompt != null) {
      $result.prompt = prompt;
    }
    if (welcomeMessage != null) {
      $result.welcomeMessage = welcomeMessage;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  PromptInfo._() : super();
  factory PromptInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PromptInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PromptInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..aOS(4, _omitFieldNames ? '' : 'prompt')
    ..aOS(5, _omitFieldNames ? '' : 'welcomeMessage')
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'updatedAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PromptInfo clone() => PromptInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PromptInfo copyWith(void Function(PromptInfo) updates) => super.copyWith((message) => updates(message as PromptInfo)) as PromptInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PromptInfo create() => PromptInfo._();
  PromptInfo createEmptyInstance() => create();
  static $pb.PbList<PromptInfo> createRepeated() => $pb.PbList<PromptInfo>();
  @$core.pragma('dart2js:noInline')
  static PromptInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PromptInfo>(create);
  static PromptInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get prompt => $_getSZ(3);
  @$pb.TagNumber(4)
  set prompt($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrompt() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrompt() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get welcomeMessage => $_getSZ(4);
  @$pb.TagNumber(5)
  set welcomeMessage($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWelcomeMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearWelcomeMessage() => clearField(5);

  @$pb.TagNumber(6)
  $1.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($1.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureCreatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $1.Timestamp get updatedAt => $_getN(6);
  @$pb.TagNumber(7)
  set updatedAt($1.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureUpdatedAt() => $_ensure(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
