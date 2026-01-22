// This is a generated file - do not edit.
//
// Generated from rag/rag_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;
import 'package:mod_proto_google/mod_proto_google.dart'
    as $1;

import 'rag_service.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'rag_service.pbenum.dart';

class RagAddDocumentRequest extends $pb.GeneratedMessage {
  factory RagAddDocumentRequest({
    $core.String? title,
    $core.String? content,
    $core.String? documentType,
    $core.String? type,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? metadata,
    $core.Iterable<$core.String>? tags,
  }) {
    final result = create();
    if (title != null) result.title = title;
    if (content != null) result.content = content;
    if (documentType != null) result.documentType = documentType;
    if (type != null) result.type = type;
    if (metadata != null) result.metadata.addEntries(metadata);
    if (tags != null) result.tags.addAll(tags);
    return result;
  }

  RagAddDocumentRequest._();

  factory RagAddDocumentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagAddDocumentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagAddDocumentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOS(3, _omitFieldNames ? '' : 'documentType')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'metadata',
        entryClassName: 'RagAddDocumentRequest.MetadataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('chat'))
    ..pPS(6, _omitFieldNames ? '' : 'tags')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagAddDocumentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagAddDocumentRequest copyWith(
          void Function(RagAddDocumentRequest) updates) =>
      super.copyWith((message) => updates(message as RagAddDocumentRequest))
          as RagAddDocumentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagAddDocumentRequest create() => RagAddDocumentRequest._();
  @$core.override
  RagAddDocumentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagAddDocumentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagAddDocumentRequest>(create);
  static RagAddDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get documentType => $_getSZ(2);
  @$pb.TagNumber(3)
  set documentType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDocumentType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDocumentType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $core.String> get metadata => $_getMap(4);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get tags => $_getList(5);
}

class RagAddDocumentResponse extends $pb.GeneratedMessage {
  factory RagAddDocumentResponse({
    $core.String? documentId,
    $core.int? chunksCreated,
    $1.Timestamp? createdAt,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (chunksCreated != null) result.chunksCreated = chunksCreated;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  RagAddDocumentResponse._();

  factory RagAddDocumentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagAddDocumentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagAddDocumentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aI(2, _omitFieldNames ? '' : 'chunksCreated')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagAddDocumentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagAddDocumentResponse copyWith(
          void Function(RagAddDocumentResponse) updates) =>
      super.copyWith((message) => updates(message as RagAddDocumentResponse))
          as RagAddDocumentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagAddDocumentResponse create() => RagAddDocumentResponse._();
  @$core.override
  RagAddDocumentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagAddDocumentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagAddDocumentResponse>(create);
  static RagAddDocumentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get chunksCreated => $_getIZ(1);
  @$pb.TagNumber(2)
  set chunksCreated($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChunksCreated() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunksCreated() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($1.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureCreatedAt() => $_ensure(2);
}

class RagAddDocumentsBatchRequest extends $pb.GeneratedMessage {
  factory RagAddDocumentsBatchRequest({
    $core.Iterable<RagAddDocumentRequest>? documents,
  }) {
    final result = create();
    if (documents != null) result.documents.addAll(documents);
    return result;
  }

  RagAddDocumentsBatchRequest._();

  factory RagAddDocumentsBatchRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagAddDocumentsBatchRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagAddDocumentsBatchRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..pPM<RagAddDocumentRequest>(1, _omitFieldNames ? '' : 'documents',
        subBuilder: RagAddDocumentRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagAddDocumentsBatchRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagAddDocumentsBatchRequest copyWith(
          void Function(RagAddDocumentsBatchRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RagAddDocumentsBatchRequest))
          as RagAddDocumentsBatchRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagAddDocumentsBatchRequest create() =>
      RagAddDocumentsBatchRequest._();
  @$core.override
  RagAddDocumentsBatchRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagAddDocumentsBatchRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagAddDocumentsBatchRequest>(create);
  static RagAddDocumentsBatchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RagAddDocumentRequest> get documents => $_getList(0);
}

class RagAddDocumentsBatchResponse extends $pb.GeneratedMessage {
  factory RagAddDocumentsBatchResponse({
    $core.Iterable<RagAddDocumentResponse>? results,
    $core.int? successCount,
    $core.int? failureCount,
    $core.Iterable<$core.String>? errors,
  }) {
    final result = create();
    if (results != null) result.results.addAll(results);
    if (successCount != null) result.successCount = successCount;
    if (failureCount != null) result.failureCount = failureCount;
    if (errors != null) result.errors.addAll(errors);
    return result;
  }

  RagAddDocumentsBatchResponse._();

  factory RagAddDocumentsBatchResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagAddDocumentsBatchResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagAddDocumentsBatchResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..pPM<RagAddDocumentResponse>(1, _omitFieldNames ? '' : 'results',
        subBuilder: RagAddDocumentResponse.create)
    ..aI(2, _omitFieldNames ? '' : 'successCount')
    ..aI(3, _omitFieldNames ? '' : 'failureCount')
    ..pPS(4, _omitFieldNames ? '' : 'errors')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagAddDocumentsBatchResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagAddDocumentsBatchResponse copyWith(
          void Function(RagAddDocumentsBatchResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RagAddDocumentsBatchResponse))
          as RagAddDocumentsBatchResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagAddDocumentsBatchResponse create() =>
      RagAddDocumentsBatchResponse._();
  @$core.override
  RagAddDocumentsBatchResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagAddDocumentsBatchResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagAddDocumentsBatchResponse>(create);
  static RagAddDocumentsBatchResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RagAddDocumentResponse> get results => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get successCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set successCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSuccessCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get failureCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set failureCount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFailureCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearFailureCount() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get errors => $_getList(3);
}

class RagDeleteDocumentRequest extends $pb.GeneratedMessage {
  factory RagDeleteDocumentRequest({
    $core.String? documentId,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    return result;
  }

  RagDeleteDocumentRequest._();

  factory RagDeleteDocumentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagDeleteDocumentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagDeleteDocumentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDeleteDocumentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDeleteDocumentRequest copyWith(
          void Function(RagDeleteDocumentRequest) updates) =>
      super.copyWith((message) => updates(message as RagDeleteDocumentRequest))
          as RagDeleteDocumentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentRequest create() => RagDeleteDocumentRequest._();
  @$core.override
  RagDeleteDocumentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagDeleteDocumentRequest>(create);
  static RagDeleteDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);
}

class RagDeleteDocumentResponse extends $pb.GeneratedMessage {
  factory RagDeleteDocumentResponse({
    $core.bool? success,
    $core.int? chunksDeleted,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (chunksDeleted != null) result.chunksDeleted = chunksDeleted;
    return result;
  }

  RagDeleteDocumentResponse._();

  factory RagDeleteDocumentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagDeleteDocumentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagDeleteDocumentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aI(2, _omitFieldNames ? '' : 'chunksDeleted')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDeleteDocumentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDeleteDocumentResponse copyWith(
          void Function(RagDeleteDocumentResponse) updates) =>
      super.copyWith((message) => updates(message as RagDeleteDocumentResponse))
          as RagDeleteDocumentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentResponse create() => RagDeleteDocumentResponse._();
  @$core.override
  RagDeleteDocumentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagDeleteDocumentResponse>(create);
  static RagDeleteDocumentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get chunksDeleted => $_getIZ(1);
  @$pb.TagNumber(2)
  set chunksDeleted($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChunksDeleted() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunksDeleted() => $_clearField(2);
}

class RagDeleteDocumentsBatchRequest extends $pb.GeneratedMessage {
  factory RagDeleteDocumentsBatchRequest({
    $core.Iterable<$core.String>? documentIds,
  }) {
    final result = create();
    if (documentIds != null) result.documentIds.addAll(documentIds);
    return result;
  }

  RagDeleteDocumentsBatchRequest._();

  factory RagDeleteDocumentsBatchRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagDeleteDocumentsBatchRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagDeleteDocumentsBatchRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'documentIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDeleteDocumentsBatchRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDeleteDocumentsBatchRequest copyWith(
          void Function(RagDeleteDocumentsBatchRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RagDeleteDocumentsBatchRequest))
          as RagDeleteDocumentsBatchRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentsBatchRequest create() =>
      RagDeleteDocumentsBatchRequest._();
  @$core.override
  RagDeleteDocumentsBatchRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentsBatchRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagDeleteDocumentsBatchRequest>(create);
  static RagDeleteDocumentsBatchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get documentIds => $_getList(0);
}

class RagDeleteDocumentsBatchResponse extends $pb.GeneratedMessage {
  factory RagDeleteDocumentsBatchResponse({
    $core.int? successCount,
    $core.int? failureCount,
    $core.Iterable<$core.String>? errors,
  }) {
    final result = create();
    if (successCount != null) result.successCount = successCount;
    if (failureCount != null) result.failureCount = failureCount;
    if (errors != null) result.errors.addAll(errors);
    return result;
  }

  RagDeleteDocumentsBatchResponse._();

  factory RagDeleteDocumentsBatchResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagDeleteDocumentsBatchResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagDeleteDocumentsBatchResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'successCount')
    ..aI(2, _omitFieldNames ? '' : 'failureCount')
    ..pPS(3, _omitFieldNames ? '' : 'errors')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDeleteDocumentsBatchResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDeleteDocumentsBatchResponse copyWith(
          void Function(RagDeleteDocumentsBatchResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RagDeleteDocumentsBatchResponse))
          as RagDeleteDocumentsBatchResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentsBatchResponse create() =>
      RagDeleteDocumentsBatchResponse._();
  @$core.override
  RagDeleteDocumentsBatchResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentsBatchResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagDeleteDocumentsBatchResponse>(
          create);
  static RagDeleteDocumentsBatchResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get successCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set successCount($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccessCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccessCount() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get failureCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set failureCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFailureCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearFailureCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get errors => $_getList(2);
}

class RagListDocumentsRequest extends $pb.GeneratedMessage {
  factory RagListDocumentsRequest({
    $core.int? limit,
    $core.int? offset,
    $core.String? documentTypeFilter,
    $core.String? typeFilter,
    $core.Iterable<$core.String>? tagFilter,
  }) {
    final result = create();
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    if (documentTypeFilter != null)
      result.documentTypeFilter = documentTypeFilter;
    if (typeFilter != null) result.typeFilter = typeFilter;
    if (tagFilter != null) result.tagFilter.addAll(tagFilter);
    return result;
  }

  RagListDocumentsRequest._();

  factory RagListDocumentsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagListDocumentsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagListDocumentsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'limit')
    ..aI(2, _omitFieldNames ? '' : 'offset')
    ..aOS(3, _omitFieldNames ? '' : 'documentTypeFilter')
    ..aOS(4, _omitFieldNames ? '' : 'typeFilter')
    ..pPS(5, _omitFieldNames ? '' : 'tagFilter')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagListDocumentsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagListDocumentsRequest copyWith(
          void Function(RagListDocumentsRequest) updates) =>
      super.copyWith((message) => updates(message as RagListDocumentsRequest))
          as RagListDocumentsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagListDocumentsRequest create() => RagListDocumentsRequest._();
  @$core.override
  RagListDocumentsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagListDocumentsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagListDocumentsRequest>(create);
  static RagListDocumentsRequest? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.String get documentTypeFilter => $_getSZ(2);
  @$pb.TagNumber(3)
  set documentTypeFilter($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDocumentTypeFilter() => $_has(2);
  @$pb.TagNumber(3)
  void clearDocumentTypeFilter() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get typeFilter => $_getSZ(3);
  @$pb.TagNumber(4)
  set typeFilter($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTypeFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearTypeFilter() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get tagFilter => $_getList(4);
}

class RagListDocumentsResponse extends $pb.GeneratedMessage {
  factory RagListDocumentsResponse({
    $core.Iterable<RagDocumentInfo>? documents,
    $core.int? totalCount,
  }) {
    final result = create();
    if (documents != null) result.documents.addAll(documents);
    if (totalCount != null) result.totalCount = totalCount;
    return result;
  }

  RagListDocumentsResponse._();

  factory RagListDocumentsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagListDocumentsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagListDocumentsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..pPM<RagDocumentInfo>(1, _omitFieldNames ? '' : 'documents',
        subBuilder: RagDocumentInfo.create)
    ..aI(2, _omitFieldNames ? '' : 'totalCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagListDocumentsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagListDocumentsResponse copyWith(
          void Function(RagListDocumentsResponse) updates) =>
      super.copyWith((message) => updates(message as RagListDocumentsResponse))
          as RagListDocumentsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagListDocumentsResponse create() => RagListDocumentsResponse._();
  @$core.override
  RagListDocumentsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagListDocumentsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagListDocumentsResponse>(create);
  static RagListDocumentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RagDocumentInfo> get documents => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);
}

class RagGetDocumentRequest extends $pb.GeneratedMessage {
  factory RagGetDocumentRequest({
    $core.String? documentId,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    return result;
  }

  RagGetDocumentRequest._();

  factory RagGetDocumentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagGetDocumentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagGetDocumentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagGetDocumentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagGetDocumentRequest copyWith(
          void Function(RagGetDocumentRequest) updates) =>
      super.copyWith((message) => updates(message as RagGetDocumentRequest))
          as RagGetDocumentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagGetDocumentRequest create() => RagGetDocumentRequest._();
  @$core.override
  RagGetDocumentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagGetDocumentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagGetDocumentRequest>(create);
  static RagGetDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);
}

class RagDocumentInfo extends $pb.GeneratedMessage {
  factory RagDocumentInfo({
    $core.String? documentId,
    $core.String? title,
    $core.String? documentType,
    $core.String? type,
    $core.int? chunkCount,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? metadata,
    $core.Iterable<$core.String>? tags,
    $core.int? contentLength,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (title != null) result.title = title;
    if (documentType != null) result.documentType = documentType;
    if (type != null) result.type = type;
    if (chunkCount != null) result.chunkCount = chunkCount;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (metadata != null) result.metadata.addEntries(metadata);
    if (tags != null) result.tags.addAll(tags);
    if (contentLength != null) result.contentLength = contentLength;
    return result;
  }

  RagDocumentInfo._();

  factory RagDocumentInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagDocumentInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagDocumentInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'documentType')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..aI(5, _omitFieldNames ? '' : 'chunkCount')
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $1.Timestamp.create)
    ..m<$core.String, $core.String>(8, _omitFieldNames ? '' : 'metadata',
        entryClassName: 'RagDocumentInfo.MetadataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('chat'))
    ..pPS(9, _omitFieldNames ? '' : 'tags')
    ..aI(10, _omitFieldNames ? '' : 'contentLength')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDocumentInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDocumentInfo copyWith(void Function(RagDocumentInfo) updates) =>
      super.copyWith((message) => updates(message as RagDocumentInfo))
          as RagDocumentInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDocumentInfo create() => RagDocumentInfo._();
  @$core.override
  RagDocumentInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagDocumentInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagDocumentInfo>(create);
  static RagDocumentInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get documentType => $_getSZ(2);
  @$pb.TagNumber(3)
  set documentType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDocumentType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDocumentType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get chunkCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set chunkCount($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasChunkCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearChunkCount() => $_clearField(5);

  @$pb.TagNumber(6)
  $1.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($1.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureCreatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $1.Timestamp get updatedAt => $_getN(6);
  @$pb.TagNumber(7)
  set updatedAt($1.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureUpdatedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $pb.PbMap<$core.String, $core.String> get metadata => $_getMap(7);

  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get tags => $_getList(8);

  @$pb.TagNumber(10)
  $core.int get contentLength => $_getIZ(9);
  @$pb.TagNumber(10)
  set contentLength($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasContentLength() => $_has(9);
  @$pb.TagNumber(10)
  void clearContentLength() => $_clearField(10);
}

class RagSearchDocumentsRequest extends $pb.GeneratedMessage {
  factory RagSearchDocumentsRequest({
    $core.String? query,
    $core.int? limit,
    $core.double? similarityThreshold,
    $core.String? typeFilter,
    $core.Iterable<$core.String>? tagFilter,
  }) {
    final result = create();
    if (query != null) result.query = query;
    if (limit != null) result.limit = limit;
    if (similarityThreshold != null)
      result.similarityThreshold = similarityThreshold;
    if (typeFilter != null) result.typeFilter = typeFilter;
    if (tagFilter != null) result.tagFilter.addAll(tagFilter);
    return result;
  }

  RagSearchDocumentsRequest._();

  factory RagSearchDocumentsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagSearchDocumentsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagSearchDocumentsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..aI(2, _omitFieldNames ? '' : 'limit')
    ..aD(3, _omitFieldNames ? '' : 'similarityThreshold',
        fieldType: $pb.PbFieldType.OF)
    ..aOS(4, _omitFieldNames ? '' : 'typeFilter')
    ..pPS(5, _omitFieldNames ? '' : 'tagFilter')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagSearchDocumentsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagSearchDocumentsRequest copyWith(
          void Function(RagSearchDocumentsRequest) updates) =>
      super.copyWith((message) => updates(message as RagSearchDocumentsRequest))
          as RagSearchDocumentsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagSearchDocumentsRequest create() => RagSearchDocumentsRequest._();
  @$core.override
  RagSearchDocumentsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagSearchDocumentsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagSearchDocumentsRequest>(create);
  static RagSearchDocumentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get similarityThreshold => $_getN(2);
  @$pb.TagNumber(3)
  set similarityThreshold($core.double value) => $_setFloat(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSimilarityThreshold() => $_has(2);
  @$pb.TagNumber(3)
  void clearSimilarityThreshold() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get typeFilter => $_getSZ(3);
  @$pb.TagNumber(4)
  set typeFilter($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTypeFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearTypeFilter() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get tagFilter => $_getList(4);
}

class RagSearchDocumentsResponse extends $pb.GeneratedMessage {
  factory RagSearchDocumentsResponse({
    $core.Iterable<RagSearchResult>? results,
  }) {
    final result = create();
    if (results != null) result.results.addAll(results);
    return result;
  }

  RagSearchDocumentsResponse._();

  factory RagSearchDocumentsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagSearchDocumentsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagSearchDocumentsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..pPM<RagSearchResult>(1, _omitFieldNames ? '' : 'results',
        subBuilder: RagSearchResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagSearchDocumentsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagSearchDocumentsResponse copyWith(
          void Function(RagSearchDocumentsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RagSearchDocumentsResponse))
          as RagSearchDocumentsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagSearchDocumentsResponse create() => RagSearchDocumentsResponse._();
  @$core.override
  RagSearchDocumentsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagSearchDocumentsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagSearchDocumentsResponse>(create);
  static RagSearchDocumentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RagSearchResult> get results => $_getList(0);
}

class RagSearchResult extends $pb.GeneratedMessage {
  factory RagSearchResult({
    $core.String? documentId,
    $core.String? chunkId,
    $core.String? title,
    $core.String? content,
    $core.String? type,
    $core.double? similarityScore,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? metadata,
    $core.Iterable<$core.String>? tags,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (chunkId != null) result.chunkId = chunkId;
    if (title != null) result.title = title;
    if (content != null) result.content = content;
    if (type != null) result.type = type;
    if (similarityScore != null) result.similarityScore = similarityScore;
    if (metadata != null) result.metadata.addEntries(metadata);
    if (tags != null) result.tags.addAll(tags);
    return result;
  }

  RagSearchResult._();

  factory RagSearchResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagSearchResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagSearchResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'chunkId')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..aOS(5, _omitFieldNames ? '' : 'type')
    ..aD(6, _omitFieldNames ? '' : 'similarityScore',
        fieldType: $pb.PbFieldType.OF)
    ..m<$core.String, $core.String>(7, _omitFieldNames ? '' : 'metadata',
        entryClassName: 'RagSearchResult.MetadataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('chat'))
    ..pPS(8, _omitFieldNames ? '' : 'tags')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagSearchResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagSearchResult copyWith(void Function(RagSearchResult) updates) =>
      super.copyWith((message) => updates(message as RagSearchResult))
          as RagSearchResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagSearchResult create() => RagSearchResult._();
  @$core.override
  RagSearchResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagSearchResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagSearchResult>(create);
  static RagSearchResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get chunkId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chunkId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasChunkId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunkId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get similarityScore => $_getN(5);
  @$pb.TagNumber(6)
  set similarityScore($core.double value) => $_setFloat(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSimilarityScore() => $_has(5);
  @$pb.TagNumber(6)
  void clearSimilarityScore() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbMap<$core.String, $core.String> get metadata => $_getMap(6);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get tags => $_getList(7);
}

class RagAddEmbeddingDocumentRequest extends $pb.GeneratedMessage {
  factory RagAddEmbeddingDocumentRequest({
    $core.String? content,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? metadata,
  }) {
    final result = create();
    if (content != null) result.content = content;
    if (metadata != null) result.metadata.addEntries(metadata);
    return result;
  }

  RagAddEmbeddingDocumentRequest._();

  factory RagAddEmbeddingDocumentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagAddEmbeddingDocumentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagAddEmbeddingDocumentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'metadata',
        entryClassName: 'RagAddEmbeddingDocumentRequest.MetadataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('chat'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagAddEmbeddingDocumentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagAddEmbeddingDocumentRequest copyWith(
          void Function(RagAddEmbeddingDocumentRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RagAddEmbeddingDocumentRequest))
          as RagAddEmbeddingDocumentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagAddEmbeddingDocumentRequest create() =>
      RagAddEmbeddingDocumentRequest._();
  @$core.override
  RagAddEmbeddingDocumentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagAddEmbeddingDocumentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagAddEmbeddingDocumentRequest>(create);
  static RagAddEmbeddingDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.String> get metadata => $_getMap(1);
}

class RagAddEmbeddingDocumentResponse extends $pb.GeneratedMessage {
  factory RagAddEmbeddingDocumentResponse({
    $fixnum.Int64? documentId,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    return result;
  }

  RagAddEmbeddingDocumentResponse._();

  factory RagAddEmbeddingDocumentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagAddEmbeddingDocumentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagAddEmbeddingDocumentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'documentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagAddEmbeddingDocumentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagAddEmbeddingDocumentResponse copyWith(
          void Function(RagAddEmbeddingDocumentResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RagAddEmbeddingDocumentResponse))
          as RagAddEmbeddingDocumentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagAddEmbeddingDocumentResponse create() =>
      RagAddEmbeddingDocumentResponse._();
  @$core.override
  RagAddEmbeddingDocumentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagAddEmbeddingDocumentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagAddEmbeddingDocumentResponse>(
          create);
  static RagAddEmbeddingDocumentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get documentId => $_getI64(0);
  @$pb.TagNumber(1)
  set documentId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);
}

class RagDeleteEmbeddingDocumentRequest extends $pb.GeneratedMessage {
  factory RagDeleteEmbeddingDocumentRequest({
    $fixnum.Int64? documentId,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    return result;
  }

  RagDeleteEmbeddingDocumentRequest._();

  factory RagDeleteEmbeddingDocumentRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagDeleteEmbeddingDocumentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagDeleteEmbeddingDocumentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'documentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDeleteEmbeddingDocumentRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDeleteEmbeddingDocumentRequest copyWith(
          void Function(RagDeleteEmbeddingDocumentRequest) updates) =>
      super.copyWith((message) =>
              updates(message as RagDeleteEmbeddingDocumentRequest))
          as RagDeleteEmbeddingDocumentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDeleteEmbeddingDocumentRequest create() =>
      RagDeleteEmbeddingDocumentRequest._();
  @$core.override
  RagDeleteEmbeddingDocumentRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagDeleteEmbeddingDocumentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagDeleteEmbeddingDocumentRequest>(
          create);
  static RagDeleteEmbeddingDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get documentId => $_getI64(0);
  @$pb.TagNumber(1)
  set documentId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);
}

class RagDeleteEmbeddingDocumentResponse extends $pb.GeneratedMessage {
  factory RagDeleteEmbeddingDocumentResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  RagDeleteEmbeddingDocumentResponse._();

  factory RagDeleteEmbeddingDocumentResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagDeleteEmbeddingDocumentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagDeleteEmbeddingDocumentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDeleteEmbeddingDocumentResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagDeleteEmbeddingDocumentResponse copyWith(
          void Function(RagDeleteEmbeddingDocumentResponse) updates) =>
      super.copyWith((message) =>
              updates(message as RagDeleteEmbeddingDocumentResponse))
          as RagDeleteEmbeddingDocumentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDeleteEmbeddingDocumentResponse create() =>
      RagDeleteEmbeddingDocumentResponse._();
  @$core.override
  RagDeleteEmbeddingDocumentResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagDeleteEmbeddingDocumentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagDeleteEmbeddingDocumentResponse>(
          create);
  static RagDeleteEmbeddingDocumentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class RagSearchEmbeddingDocumentsRequest extends $pb.GeneratedMessage {
  factory RagSearchEmbeddingDocumentsRequest({
    $core.String? query,
    $core.int? limit,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? filter,
  }) {
    final result = create();
    if (query != null) result.query = query;
    if (limit != null) result.limit = limit;
    if (filter != null) result.filter.addEntries(filter);
    return result;
  }

  RagSearchEmbeddingDocumentsRequest._();

  factory RagSearchEmbeddingDocumentsRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagSearchEmbeddingDocumentsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagSearchEmbeddingDocumentsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..aI(2, _omitFieldNames ? '' : 'limit')
    ..m<$core.String, $core.String>(3, _omitFieldNames ? '' : 'filter',
        entryClassName: 'RagSearchEmbeddingDocumentsRequest.FilterEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('chat'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagSearchEmbeddingDocumentsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagSearchEmbeddingDocumentsRequest copyWith(
          void Function(RagSearchEmbeddingDocumentsRequest) updates) =>
      super.copyWith((message) =>
              updates(message as RagSearchEmbeddingDocumentsRequest))
          as RagSearchEmbeddingDocumentsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagSearchEmbeddingDocumentsRequest create() =>
      RagSearchEmbeddingDocumentsRequest._();
  @$core.override
  RagSearchEmbeddingDocumentsRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagSearchEmbeddingDocumentsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagSearchEmbeddingDocumentsRequest>(
          create);
  static RagSearchEmbeddingDocumentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.String> get filter => $_getMap(2);
}

class RagSearchEmbeddingDocumentsResponse extends $pb.GeneratedMessage {
  factory RagSearchEmbeddingDocumentsResponse({
    $core.Iterable<RagEmbeddingSearchResult>? results,
  }) {
    final result = create();
    if (results != null) result.results.addAll(results);
    return result;
  }

  RagSearchEmbeddingDocumentsResponse._();

  factory RagSearchEmbeddingDocumentsResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagSearchEmbeddingDocumentsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagSearchEmbeddingDocumentsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..pPM<RagEmbeddingSearchResult>(1, _omitFieldNames ? '' : 'results',
        subBuilder: RagEmbeddingSearchResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagSearchEmbeddingDocumentsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagSearchEmbeddingDocumentsResponse copyWith(
          void Function(RagSearchEmbeddingDocumentsResponse) updates) =>
      super.copyWith((message) =>
              updates(message as RagSearchEmbeddingDocumentsResponse))
          as RagSearchEmbeddingDocumentsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagSearchEmbeddingDocumentsResponse create() =>
      RagSearchEmbeddingDocumentsResponse._();
  @$core.override
  RagSearchEmbeddingDocumentsResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagSearchEmbeddingDocumentsResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          RagSearchEmbeddingDocumentsResponse>(create);
  static RagSearchEmbeddingDocumentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RagEmbeddingSearchResult> get results => $_getList(0);
}

class RagEmbeddingSearchResult extends $pb.GeneratedMessage {
  factory RagEmbeddingSearchResult({
    $fixnum.Int64? id,
    $core.String? content,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? metadata,
    $core.double? similarityScore,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (content != null) result.content = content;
    if (metadata != null) result.metadata.addEntries(metadata);
    if (similarityScore != null) result.similarityScore = similarityScore;
    return result;
  }

  RagEmbeddingSearchResult._();

  factory RagEmbeddingSearchResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagEmbeddingSearchResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagEmbeddingSearchResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..m<$core.String, $core.String>(3, _omitFieldNames ? '' : 'metadata',
        entryClassName: 'RagEmbeddingSearchResult.MetadataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('chat'))
    ..aD(4, _omitFieldNames ? '' : 'similarityScore',
        fieldType: $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagEmbeddingSearchResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagEmbeddingSearchResult copyWith(
          void Function(RagEmbeddingSearchResult) updates) =>
      super.copyWith((message) => updates(message as RagEmbeddingSearchResult))
          as RagEmbeddingSearchResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagEmbeddingSearchResult create() => RagEmbeddingSearchResult._();
  @$core.override
  RagEmbeddingSearchResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagEmbeddingSearchResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagEmbeddingSearchResult>(create);
  static RagEmbeddingSearchResult? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbMap<$core.String, $core.String> get metadata => $_getMap(2);

  @$pb.TagNumber(4)
  $core.double get similarityScore => $_getN(3);
  @$pb.TagNumber(4)
  set similarityScore($core.double value) => $_setFloat(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSimilarityScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearSimilarityScore() => $_clearField(4);
}

/// File to be uploaded in batch
class RagUploadFile extends $pb.GeneratedMessage {
  factory RagUploadFile({
    $core.String? fileName,
    $core.String? content,
    $core.String? documentType,
    $core.String? type,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? metadata,
    $core.Iterable<$core.String>? tags,
  }) {
    final result = create();
    if (fileName != null) result.fileName = fileName;
    if (content != null) result.content = content;
    if (documentType != null) result.documentType = documentType;
    if (type != null) result.type = type;
    if (metadata != null) result.metadata.addEntries(metadata);
    if (tags != null) result.tags.addAll(tags);
    return result;
  }

  RagUploadFile._();

  factory RagUploadFile.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagUploadFile.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagUploadFile',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileName')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOS(3, _omitFieldNames ? '' : 'documentType')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'metadata',
        entryClassName: 'RagUploadFile.MetadataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('chat'))
    ..pPS(6, _omitFieldNames ? '' : 'tags')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagUploadFile clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagUploadFile copyWith(void Function(RagUploadFile) updates) =>
      super.copyWith((message) => updates(message as RagUploadFile))
          as RagUploadFile;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagUploadFile create() => RagUploadFile._();
  @$core.override
  RagUploadFile createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagUploadFile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagUploadFile>(create);
  static RagUploadFile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get documentType => $_getSZ(2);
  @$pb.TagNumber(3)
  set documentType($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDocumentType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDocumentType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, $core.String> get metadata => $_getMap(4);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get tags => $_getList(5);
}

/// Request to upload multiple files
class RagUploadFilesBatchRequest extends $pb.GeneratedMessage {
  factory RagUploadFilesBatchRequest({
    $core.Iterable<RagUploadFile>? files,
  }) {
    final result = create();
    if (files != null) result.files.addAll(files);
    return result;
  }

  RagUploadFilesBatchRequest._();

  factory RagUploadFilesBatchRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagUploadFilesBatchRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagUploadFilesBatchRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..pPM<RagUploadFile>(1, _omitFieldNames ? '' : 'files',
        subBuilder: RagUploadFile.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagUploadFilesBatchRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagUploadFilesBatchRequest copyWith(
          void Function(RagUploadFilesBatchRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RagUploadFilesBatchRequest))
          as RagUploadFilesBatchRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagUploadFilesBatchRequest create() => RagUploadFilesBatchRequest._();
  @$core.override
  RagUploadFilesBatchRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagUploadFilesBatchRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagUploadFilesBatchRequest>(create);
  static RagUploadFilesBatchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RagUploadFile> get files => $_getList(0);
}

/// Progress notification for each file (streamed back to client)
class RagUploadFileProgress extends $pb.GeneratedMessage {
  factory RagUploadFileProgress({
    $core.String? fileName,
    $core.int? fileIndex,
    $core.int? totalFiles,
    RagUploadStatus? status,
    $core.String? message,
    $fixnum.Int64? documentId,
    $core.String? error,
    $1.Timestamp? timestamp,
  }) {
    final result = create();
    if (fileName != null) result.fileName = fileName;
    if (fileIndex != null) result.fileIndex = fileIndex;
    if (totalFiles != null) result.totalFiles = totalFiles;
    if (status != null) result.status = status;
    if (message != null) result.message = message;
    if (documentId != null) result.documentId = documentId;
    if (error != null) result.error = error;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  RagUploadFileProgress._();

  factory RagUploadFileProgress.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RagUploadFileProgress.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RagUploadFileProgress',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileName')
    ..aI(2, _omitFieldNames ? '' : 'fileIndex')
    ..aI(3, _omitFieldNames ? '' : 'totalFiles')
    ..aE<RagUploadStatus>(4, _omitFieldNames ? '' : 'status',
        enumValues: RagUploadStatus.values)
    ..aOS(5, _omitFieldNames ? '' : 'message')
    ..aInt64(6, _omitFieldNames ? '' : 'documentId')
    ..aOS(7, _omitFieldNames ? '' : 'error')
    ..aOM<$1.Timestamp>(8, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagUploadFileProgress clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RagUploadFileProgress copyWith(
          void Function(RagUploadFileProgress) updates) =>
      super.copyWith((message) => updates(message as RagUploadFileProgress))
          as RagUploadFileProgress;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagUploadFileProgress create() => RagUploadFileProgress._();
  @$core.override
  RagUploadFileProgress createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RagUploadFileProgress getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RagUploadFileProgress>(create);
  static RagUploadFileProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFileName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get fileIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set fileIndex($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFileIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileIndex() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalFiles => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalFiles($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalFiles() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalFiles() => $_clearField(3);

  @$pb.TagNumber(4)
  RagUploadStatus get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(RagUploadStatus value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get message => $_getSZ(4);
  @$pb.TagNumber(5)
  set message($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessage() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get documentId => $_getI64(5);
  @$pb.TagNumber(6)
  set documentId($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasDocumentId() => $_has(5);
  @$pb.TagNumber(6)
  void clearDocumentId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get error => $_getSZ(6);
  @$pb.TagNumber(7)
  set error($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasError() => $_has(6);
  @$pb.TagNumber(7)
  void clearError() => $_clearField(7);

  @$pb.TagNumber(8)
  $1.Timestamp get timestamp => $_getN(7);
  @$pb.TagNumber(8)
  set timestamp($1.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasTimestamp() => $_has(7);
  @$pb.TagNumber(8)
  void clearTimestamp() => $_clearField(8);
  @$pb.TagNumber(8)
  $1.Timestamp ensureTimestamp() => $_ensure(7);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
