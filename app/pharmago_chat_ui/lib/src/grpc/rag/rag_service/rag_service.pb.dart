//
//  Generated code. Do not modify.
//  source: rag/rag_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'package:protobuf_google/protobuf_google.dart' as $1;
import 'rag_service.pbenum.dart';

export 'rag_service.pbenum.dart';

class RagAddDocumentRequest extends $pb.GeneratedMessage {
  factory RagAddDocumentRequest({
    $core.String? title,
    $core.String? content,
    $core.String? documentType,
    $core.String? type,
    $core.Map<$core.String, $core.String>? metadata,
    $core.Iterable<$core.String>? tags,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (content != null) {
      $result.content = content;
    }
    if (documentType != null) {
      $result.documentType = documentType;
    }
    if (type != null) {
      $result.type = type;
    }
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    return $result;
  }
  RagAddDocumentRequest._() : super();
  factory RagAddDocumentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagAddDocumentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagAddDocumentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOS(3, _omitFieldNames ? '' : 'documentType')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'metadata', entryClassName: 'RagAddDocumentRequest.MetadataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('chat'))
    ..pPS(6, _omitFieldNames ? '' : 'tags')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagAddDocumentRequest clone() => RagAddDocumentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagAddDocumentRequest copyWith(void Function(RagAddDocumentRequest) updates) => super.copyWith((message) => updates(message as RagAddDocumentRequest)) as RagAddDocumentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagAddDocumentRequest create() => RagAddDocumentRequest._();
  RagAddDocumentRequest createEmptyInstance() => create();
  static $pb.PbList<RagAddDocumentRequest> createRepeated() => $pb.PbList<RagAddDocumentRequest>();
  @$core.pragma('dart2js:noInline')
  static RagAddDocumentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagAddDocumentRequest>(create);
  static RagAddDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get documentType => $_getSZ(2);
  @$pb.TagNumber(3)
  set documentType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDocumentType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDocumentType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get metadata => $_getMap(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get tags => $_getList(5);
}

class RagAddDocumentResponse extends $pb.GeneratedMessage {
  factory RagAddDocumentResponse({
    $core.String? documentId,
    $core.int? chunksCreated,
    $1.Timestamp? createdAt,
  }) {
    final $result = create();
    if (documentId != null) {
      $result.documentId = documentId;
    }
    if (chunksCreated != null) {
      $result.chunksCreated = chunksCreated;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  RagAddDocumentResponse._() : super();
  factory RagAddDocumentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagAddDocumentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagAddDocumentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'chunksCreated', $pb.PbFieldType.O3)
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagAddDocumentResponse clone() => RagAddDocumentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagAddDocumentResponse copyWith(void Function(RagAddDocumentResponse) updates) => super.copyWith((message) => updates(message as RagAddDocumentResponse)) as RagAddDocumentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagAddDocumentResponse create() => RagAddDocumentResponse._();
  RagAddDocumentResponse createEmptyInstance() => create();
  static $pb.PbList<RagAddDocumentResponse> createRepeated() => $pb.PbList<RagAddDocumentResponse>();
  @$core.pragma('dart2js:noInline')
  static RagAddDocumentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagAddDocumentResponse>(create);
  static RagAddDocumentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get chunksCreated => $_getIZ(1);
  @$pb.TagNumber(2)
  set chunksCreated($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunksCreated() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunksCreated() => clearField(2);

  @$pb.TagNumber(3)
  $1.Timestamp get createdAt => $_getN(2);
  @$pb.TagNumber(3)
  set createdAt($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreatedAt() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureCreatedAt() => $_ensure(2);
}

class RagAddDocumentsBatchRequest extends $pb.GeneratedMessage {
  factory RagAddDocumentsBatchRequest({
    $core.Iterable<RagAddDocumentRequest>? documents,
  }) {
    final $result = create();
    if (documents != null) {
      $result.documents.addAll(documents);
    }
    return $result;
  }
  RagAddDocumentsBatchRequest._() : super();
  factory RagAddDocumentsBatchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagAddDocumentsBatchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagAddDocumentsBatchRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<RagAddDocumentRequest>(1, _omitFieldNames ? '' : 'documents', $pb.PbFieldType.PM, subBuilder: RagAddDocumentRequest.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagAddDocumentsBatchRequest clone() => RagAddDocumentsBatchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagAddDocumentsBatchRequest copyWith(void Function(RagAddDocumentsBatchRequest) updates) => super.copyWith((message) => updates(message as RagAddDocumentsBatchRequest)) as RagAddDocumentsBatchRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagAddDocumentsBatchRequest create() => RagAddDocumentsBatchRequest._();
  RagAddDocumentsBatchRequest createEmptyInstance() => create();
  static $pb.PbList<RagAddDocumentsBatchRequest> createRepeated() => $pb.PbList<RagAddDocumentsBatchRequest>();
  @$core.pragma('dart2js:noInline')
  static RagAddDocumentsBatchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagAddDocumentsBatchRequest>(create);
  static RagAddDocumentsBatchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RagAddDocumentRequest> get documents => $_getList(0);
}

class RagAddDocumentsBatchResponse extends $pb.GeneratedMessage {
  factory RagAddDocumentsBatchResponse({
    $core.Iterable<RagAddDocumentResponse>? results,
    $core.int? successCount,
    $core.int? failureCount,
    $core.Iterable<$core.String>? errors,
  }) {
    final $result = create();
    if (results != null) {
      $result.results.addAll(results);
    }
    if (successCount != null) {
      $result.successCount = successCount;
    }
    if (failureCount != null) {
      $result.failureCount = failureCount;
    }
    if (errors != null) {
      $result.errors.addAll(errors);
    }
    return $result;
  }
  RagAddDocumentsBatchResponse._() : super();
  factory RagAddDocumentsBatchResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagAddDocumentsBatchResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagAddDocumentsBatchResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<RagAddDocumentResponse>(1, _omitFieldNames ? '' : 'results', $pb.PbFieldType.PM, subBuilder: RagAddDocumentResponse.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'successCount', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'failureCount', $pb.PbFieldType.O3)
    ..pPS(4, _omitFieldNames ? '' : 'errors')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagAddDocumentsBatchResponse clone() => RagAddDocumentsBatchResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagAddDocumentsBatchResponse copyWith(void Function(RagAddDocumentsBatchResponse) updates) => super.copyWith((message) => updates(message as RagAddDocumentsBatchResponse)) as RagAddDocumentsBatchResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagAddDocumentsBatchResponse create() => RagAddDocumentsBatchResponse._();
  RagAddDocumentsBatchResponse createEmptyInstance() => create();
  static $pb.PbList<RagAddDocumentsBatchResponse> createRepeated() => $pb.PbList<RagAddDocumentsBatchResponse>();
  @$core.pragma('dart2js:noInline')
  static RagAddDocumentsBatchResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagAddDocumentsBatchResponse>(create);
  static RagAddDocumentsBatchResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RagAddDocumentResponse> get results => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get successCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set successCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccessCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get failureCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set failureCount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFailureCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearFailureCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get errors => $_getList(3);
}

class RagDeleteDocumentRequest extends $pb.GeneratedMessage {
  factory RagDeleteDocumentRequest({
    $core.String? documentId,
  }) {
    final $result = create();
    if (documentId != null) {
      $result.documentId = documentId;
    }
    return $result;
  }
  RagDeleteDocumentRequest._() : super();
  factory RagDeleteDocumentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagDeleteDocumentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagDeleteDocumentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagDeleteDocumentRequest clone() => RagDeleteDocumentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagDeleteDocumentRequest copyWith(void Function(RagDeleteDocumentRequest) updates) => super.copyWith((message) => updates(message as RagDeleteDocumentRequest)) as RagDeleteDocumentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentRequest create() => RagDeleteDocumentRequest._();
  RagDeleteDocumentRequest createEmptyInstance() => create();
  static $pb.PbList<RagDeleteDocumentRequest> createRepeated() => $pb.PbList<RagDeleteDocumentRequest>();
  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagDeleteDocumentRequest>(create);
  static RagDeleteDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => clearField(1);
}

class RagDeleteDocumentResponse extends $pb.GeneratedMessage {
  factory RagDeleteDocumentResponse({
    $core.bool? success,
    $core.int? chunksDeleted,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (chunksDeleted != null) {
      $result.chunksDeleted = chunksDeleted;
    }
    return $result;
  }
  RagDeleteDocumentResponse._() : super();
  factory RagDeleteDocumentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagDeleteDocumentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagDeleteDocumentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'chunksDeleted', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagDeleteDocumentResponse clone() => RagDeleteDocumentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagDeleteDocumentResponse copyWith(void Function(RagDeleteDocumentResponse) updates) => super.copyWith((message) => updates(message as RagDeleteDocumentResponse)) as RagDeleteDocumentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentResponse create() => RagDeleteDocumentResponse._();
  RagDeleteDocumentResponse createEmptyInstance() => create();
  static $pb.PbList<RagDeleteDocumentResponse> createRepeated() => $pb.PbList<RagDeleteDocumentResponse>();
  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagDeleteDocumentResponse>(create);
  static RagDeleteDocumentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get chunksDeleted => $_getIZ(1);
  @$pb.TagNumber(2)
  set chunksDeleted($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunksDeleted() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunksDeleted() => clearField(2);
}

class RagDeleteDocumentsBatchRequest extends $pb.GeneratedMessage {
  factory RagDeleteDocumentsBatchRequest({
    $core.Iterable<$core.String>? documentIds,
  }) {
    final $result = create();
    if (documentIds != null) {
      $result.documentIds.addAll(documentIds);
    }
    return $result;
  }
  RagDeleteDocumentsBatchRequest._() : super();
  factory RagDeleteDocumentsBatchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagDeleteDocumentsBatchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagDeleteDocumentsBatchRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'documentIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagDeleteDocumentsBatchRequest clone() => RagDeleteDocumentsBatchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagDeleteDocumentsBatchRequest copyWith(void Function(RagDeleteDocumentsBatchRequest) updates) => super.copyWith((message) => updates(message as RagDeleteDocumentsBatchRequest)) as RagDeleteDocumentsBatchRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentsBatchRequest create() => RagDeleteDocumentsBatchRequest._();
  RagDeleteDocumentsBatchRequest createEmptyInstance() => create();
  static $pb.PbList<RagDeleteDocumentsBatchRequest> createRepeated() => $pb.PbList<RagDeleteDocumentsBatchRequest>();
  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentsBatchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagDeleteDocumentsBatchRequest>(create);
  static RagDeleteDocumentsBatchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get documentIds => $_getList(0);
}

class RagDeleteDocumentsBatchResponse extends $pb.GeneratedMessage {
  factory RagDeleteDocumentsBatchResponse({
    $core.int? successCount,
    $core.int? failureCount,
    $core.Iterable<$core.String>? errors,
  }) {
    final $result = create();
    if (successCount != null) {
      $result.successCount = successCount;
    }
    if (failureCount != null) {
      $result.failureCount = failureCount;
    }
    if (errors != null) {
      $result.errors.addAll(errors);
    }
    return $result;
  }
  RagDeleteDocumentsBatchResponse._() : super();
  factory RagDeleteDocumentsBatchResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagDeleteDocumentsBatchResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagDeleteDocumentsBatchResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'successCount', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'failureCount', $pb.PbFieldType.O3)
    ..pPS(3, _omitFieldNames ? '' : 'errors')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagDeleteDocumentsBatchResponse clone() => RagDeleteDocumentsBatchResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagDeleteDocumentsBatchResponse copyWith(void Function(RagDeleteDocumentsBatchResponse) updates) => super.copyWith((message) => updates(message as RagDeleteDocumentsBatchResponse)) as RagDeleteDocumentsBatchResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentsBatchResponse create() => RagDeleteDocumentsBatchResponse._();
  RagDeleteDocumentsBatchResponse createEmptyInstance() => create();
  static $pb.PbList<RagDeleteDocumentsBatchResponse> createRepeated() => $pb.PbList<RagDeleteDocumentsBatchResponse>();
  @$core.pragma('dart2js:noInline')
  static RagDeleteDocumentsBatchResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagDeleteDocumentsBatchResponse>(create);
  static RagDeleteDocumentsBatchResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get successCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set successCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccessCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccessCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get failureCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set failureCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFailureCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearFailureCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get errors => $_getList(2);
}

class RagListDocumentsRequest extends $pb.GeneratedMessage {
  factory RagListDocumentsRequest({
    $core.int? limit,
    $core.int? offset,
    $core.String? documentTypeFilter,
    $core.String? typeFilter,
    $core.Iterable<$core.String>? tagFilter,
  }) {
    final $result = create();
    if (limit != null) {
      $result.limit = limit;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    if (documentTypeFilter != null) {
      $result.documentTypeFilter = documentTypeFilter;
    }
    if (typeFilter != null) {
      $result.typeFilter = typeFilter;
    }
    if (tagFilter != null) {
      $result.tagFilter.addAll(tagFilter);
    }
    return $result;
  }
  RagListDocumentsRequest._() : super();
  factory RagListDocumentsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagListDocumentsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagListDocumentsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'documentTypeFilter')
    ..aOS(4, _omitFieldNames ? '' : 'typeFilter')
    ..pPS(5, _omitFieldNames ? '' : 'tagFilter')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagListDocumentsRequest clone() => RagListDocumentsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagListDocumentsRequest copyWith(void Function(RagListDocumentsRequest) updates) => super.copyWith((message) => updates(message as RagListDocumentsRequest)) as RagListDocumentsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagListDocumentsRequest create() => RagListDocumentsRequest._();
  RagListDocumentsRequest createEmptyInstance() => create();
  static $pb.PbList<RagListDocumentsRequest> createRepeated() => $pb.PbList<RagListDocumentsRequest>();
  @$core.pragma('dart2js:noInline')
  static RagListDocumentsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagListDocumentsRequest>(create);
  static RagListDocumentsRequest? _defaultInstance;

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
  $core.String get documentTypeFilter => $_getSZ(2);
  @$pb.TagNumber(3)
  set documentTypeFilter($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDocumentTypeFilter() => $_has(2);
  @$pb.TagNumber(3)
  void clearDocumentTypeFilter() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get typeFilter => $_getSZ(3);
  @$pb.TagNumber(4)
  set typeFilter($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTypeFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearTypeFilter() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get tagFilter => $_getList(4);
}

class RagListDocumentsResponse extends $pb.GeneratedMessage {
  factory RagListDocumentsResponse({
    $core.Iterable<RagDocumentInfo>? documents,
    $core.int? totalCount,
  }) {
    final $result = create();
    if (documents != null) {
      $result.documents.addAll(documents);
    }
    if (totalCount != null) {
      $result.totalCount = totalCount;
    }
    return $result;
  }
  RagListDocumentsResponse._() : super();
  factory RagListDocumentsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagListDocumentsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagListDocumentsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<RagDocumentInfo>(1, _omitFieldNames ? '' : 'documents', $pb.PbFieldType.PM, subBuilder: RagDocumentInfo.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagListDocumentsResponse clone() => RagListDocumentsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagListDocumentsResponse copyWith(void Function(RagListDocumentsResponse) updates) => super.copyWith((message) => updates(message as RagListDocumentsResponse)) as RagListDocumentsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagListDocumentsResponse create() => RagListDocumentsResponse._();
  RagListDocumentsResponse createEmptyInstance() => create();
  static $pb.PbList<RagListDocumentsResponse> createRepeated() => $pb.PbList<RagListDocumentsResponse>();
  @$core.pragma('dart2js:noInline')
  static RagListDocumentsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagListDocumentsResponse>(create);
  static RagListDocumentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RagDocumentInfo> get documents => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => clearField(2);
}

class RagGetDocumentRequest extends $pb.GeneratedMessage {
  factory RagGetDocumentRequest({
    $core.String? documentId,
  }) {
    final $result = create();
    if (documentId != null) {
      $result.documentId = documentId;
    }
    return $result;
  }
  RagGetDocumentRequest._() : super();
  factory RagGetDocumentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagGetDocumentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagGetDocumentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagGetDocumentRequest clone() => RagGetDocumentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagGetDocumentRequest copyWith(void Function(RagGetDocumentRequest) updates) => super.copyWith((message) => updates(message as RagGetDocumentRequest)) as RagGetDocumentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagGetDocumentRequest create() => RagGetDocumentRequest._();
  RagGetDocumentRequest createEmptyInstance() => create();
  static $pb.PbList<RagGetDocumentRequest> createRepeated() => $pb.PbList<RagGetDocumentRequest>();
  @$core.pragma('dart2js:noInline')
  static RagGetDocumentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagGetDocumentRequest>(create);
  static RagGetDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => clearField(1);
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
    $core.Map<$core.String, $core.String>? metadata,
    $core.Iterable<$core.String>? tags,
    $core.int? contentLength,
  }) {
    final $result = create();
    if (documentId != null) {
      $result.documentId = documentId;
    }
    if (title != null) {
      $result.title = title;
    }
    if (documentType != null) {
      $result.documentType = documentType;
    }
    if (type != null) {
      $result.type = type;
    }
    if (chunkCount != null) {
      $result.chunkCount = chunkCount;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    if (contentLength != null) {
      $result.contentLength = contentLength;
    }
    return $result;
  }
  RagDocumentInfo._() : super();
  factory RagDocumentInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagDocumentInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagDocumentInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'documentType')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'chunkCount', $pb.PbFieldType.O3)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'createdAt', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'updatedAt', subBuilder: $1.Timestamp.create)
    ..m<$core.String, $core.String>(8, _omitFieldNames ? '' : 'metadata', entryClassName: 'RagDocumentInfo.MetadataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('chat'))
    ..pPS(9, _omitFieldNames ? '' : 'tags')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'contentLength', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagDocumentInfo clone() => RagDocumentInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagDocumentInfo copyWith(void Function(RagDocumentInfo) updates) => super.copyWith((message) => updates(message as RagDocumentInfo)) as RagDocumentInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDocumentInfo create() => RagDocumentInfo._();
  RagDocumentInfo createEmptyInstance() => create();
  static $pb.PbList<RagDocumentInfo> createRepeated() => $pb.PbList<RagDocumentInfo>();
  @$core.pragma('dart2js:noInline')
  static RagDocumentInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagDocumentInfo>(create);
  static RagDocumentInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get documentType => $_getSZ(2);
  @$pb.TagNumber(3)
  set documentType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDocumentType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDocumentType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get chunkCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set chunkCount($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChunkCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearChunkCount() => clearField(5);

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

  @$pb.TagNumber(8)
  $core.Map<$core.String, $core.String> get metadata => $_getMap(7);

  @$pb.TagNumber(9)
  $core.List<$core.String> get tags => $_getList(8);

  @$pb.TagNumber(10)
  $core.int get contentLength => $_getIZ(9);
  @$pb.TagNumber(10)
  set contentLength($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasContentLength() => $_has(9);
  @$pb.TagNumber(10)
  void clearContentLength() => clearField(10);
}

class RagSearchDocumentsRequest extends $pb.GeneratedMessage {
  factory RagSearchDocumentsRequest({
    $core.String? query,
    $core.int? limit,
    $core.double? similarityThreshold,
    $core.String? typeFilter,
    $core.Iterable<$core.String>? tagFilter,
  }) {
    final $result = create();
    if (query != null) {
      $result.query = query;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (similarityThreshold != null) {
      $result.similarityThreshold = similarityThreshold;
    }
    if (typeFilter != null) {
      $result.typeFilter = typeFilter;
    }
    if (tagFilter != null) {
      $result.tagFilter.addAll(tagFilter);
    }
    return $result;
  }
  RagSearchDocumentsRequest._() : super();
  factory RagSearchDocumentsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagSearchDocumentsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagSearchDocumentsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'similarityThreshold', $pb.PbFieldType.OF)
    ..aOS(4, _omitFieldNames ? '' : 'typeFilter')
    ..pPS(5, _omitFieldNames ? '' : 'tagFilter')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagSearchDocumentsRequest clone() => RagSearchDocumentsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagSearchDocumentsRequest copyWith(void Function(RagSearchDocumentsRequest) updates) => super.copyWith((message) => updates(message as RagSearchDocumentsRequest)) as RagSearchDocumentsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagSearchDocumentsRequest create() => RagSearchDocumentsRequest._();
  RagSearchDocumentsRequest createEmptyInstance() => create();
  static $pb.PbList<RagSearchDocumentsRequest> createRepeated() => $pb.PbList<RagSearchDocumentsRequest>();
  @$core.pragma('dart2js:noInline')
  static RagSearchDocumentsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagSearchDocumentsRequest>(create);
  static RagSearchDocumentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get similarityThreshold => $_getN(2);
  @$pb.TagNumber(3)
  set similarityThreshold($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSimilarityThreshold() => $_has(2);
  @$pb.TagNumber(3)
  void clearSimilarityThreshold() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get typeFilter => $_getSZ(3);
  @$pb.TagNumber(4)
  set typeFilter($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTypeFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearTypeFilter() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get tagFilter => $_getList(4);
}

class RagSearchDocumentsResponse extends $pb.GeneratedMessage {
  factory RagSearchDocumentsResponse({
    $core.Iterable<RagSearchResult>? results,
  }) {
    final $result = create();
    if (results != null) {
      $result.results.addAll(results);
    }
    return $result;
  }
  RagSearchDocumentsResponse._() : super();
  factory RagSearchDocumentsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagSearchDocumentsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagSearchDocumentsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<RagSearchResult>(1, _omitFieldNames ? '' : 'results', $pb.PbFieldType.PM, subBuilder: RagSearchResult.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagSearchDocumentsResponse clone() => RagSearchDocumentsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagSearchDocumentsResponse copyWith(void Function(RagSearchDocumentsResponse) updates) => super.copyWith((message) => updates(message as RagSearchDocumentsResponse)) as RagSearchDocumentsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagSearchDocumentsResponse create() => RagSearchDocumentsResponse._();
  RagSearchDocumentsResponse createEmptyInstance() => create();
  static $pb.PbList<RagSearchDocumentsResponse> createRepeated() => $pb.PbList<RagSearchDocumentsResponse>();
  @$core.pragma('dart2js:noInline')
  static RagSearchDocumentsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagSearchDocumentsResponse>(create);
  static RagSearchDocumentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RagSearchResult> get results => $_getList(0);
}

class RagSearchResult extends $pb.GeneratedMessage {
  factory RagSearchResult({
    $core.String? documentId,
    $core.String? chunkId,
    $core.String? title,
    $core.String? content,
    $core.String? type,
    $core.double? similarityScore,
    $core.Map<$core.String, $core.String>? metadata,
    $core.Iterable<$core.String>? tags,
  }) {
    final $result = create();
    if (documentId != null) {
      $result.documentId = documentId;
    }
    if (chunkId != null) {
      $result.chunkId = chunkId;
    }
    if (title != null) {
      $result.title = title;
    }
    if (content != null) {
      $result.content = content;
    }
    if (type != null) {
      $result.type = type;
    }
    if (similarityScore != null) {
      $result.similarityScore = similarityScore;
    }
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    return $result;
  }
  RagSearchResult._() : super();
  factory RagSearchResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagSearchResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagSearchResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'chunkId')
    ..aOS(3, _omitFieldNames ? '' : 'title')
    ..aOS(4, _omitFieldNames ? '' : 'content')
    ..aOS(5, _omitFieldNames ? '' : 'type')
    ..a<$core.double>(6, _omitFieldNames ? '' : 'similarityScore', $pb.PbFieldType.OF)
    ..m<$core.String, $core.String>(7, _omitFieldNames ? '' : 'metadata', entryClassName: 'RagSearchResult.MetadataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('chat'))
    ..pPS(8, _omitFieldNames ? '' : 'tags')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagSearchResult clone() => RagSearchResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagSearchResult copyWith(void Function(RagSearchResult) updates) => super.copyWith((message) => updates(message as RagSearchResult)) as RagSearchResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagSearchResult create() => RagSearchResult._();
  RagSearchResult createEmptyInstance() => create();
  static $pb.PbList<RagSearchResult> createRepeated() => $pb.PbList<RagSearchResult>();
  @$core.pragma('dart2js:noInline')
  static RagSearchResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagSearchResult>(create);
  static RagSearchResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get chunkId => $_getSZ(1);
  @$pb.TagNumber(2)
  set chunkId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunkId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunkId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(3)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(3)
  void clearTitle() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get content => $_getSZ(3);
  @$pb.TagNumber(4)
  set content($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContent() => $_has(3);
  @$pb.TagNumber(4)
  void clearContent() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get similarityScore => $_getN(5);
  @$pb.TagNumber(6)
  set similarityScore($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSimilarityScore() => $_has(5);
  @$pb.TagNumber(6)
  void clearSimilarityScore() => clearField(6);

  @$pb.TagNumber(7)
  $core.Map<$core.String, $core.String> get metadata => $_getMap(6);

  @$pb.TagNumber(8)
  $core.List<$core.String> get tags => $_getList(7);
}

class RagAddEmbeddingDocumentRequest extends $pb.GeneratedMessage {
  factory RagAddEmbeddingDocumentRequest({
    $core.String? content,
    $core.Map<$core.String, $core.String>? metadata,
  }) {
    final $result = create();
    if (content != null) {
      $result.content = content;
    }
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    return $result;
  }
  RagAddEmbeddingDocumentRequest._() : super();
  factory RagAddEmbeddingDocumentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagAddEmbeddingDocumentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagAddEmbeddingDocumentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'metadata', entryClassName: 'RagAddEmbeddingDocumentRequest.MetadataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('chat'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagAddEmbeddingDocumentRequest clone() => RagAddEmbeddingDocumentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagAddEmbeddingDocumentRequest copyWith(void Function(RagAddEmbeddingDocumentRequest) updates) => super.copyWith((message) => updates(message as RagAddEmbeddingDocumentRequest)) as RagAddEmbeddingDocumentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagAddEmbeddingDocumentRequest create() => RagAddEmbeddingDocumentRequest._();
  RagAddEmbeddingDocumentRequest createEmptyInstance() => create();
  static $pb.PbList<RagAddEmbeddingDocumentRequest> createRepeated() => $pb.PbList<RagAddEmbeddingDocumentRequest>();
  @$core.pragma('dart2js:noInline')
  static RagAddEmbeddingDocumentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagAddEmbeddingDocumentRequest>(create);
  static RagAddEmbeddingDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.String, $core.String> get metadata => $_getMap(1);
}

class RagAddEmbeddingDocumentResponse extends $pb.GeneratedMessage {
  factory RagAddEmbeddingDocumentResponse({
    $fixnum.Int64? documentId,
  }) {
    final $result = create();
    if (documentId != null) {
      $result.documentId = documentId;
    }
    return $result;
  }
  RagAddEmbeddingDocumentResponse._() : super();
  factory RagAddEmbeddingDocumentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagAddEmbeddingDocumentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagAddEmbeddingDocumentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'documentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagAddEmbeddingDocumentResponse clone() => RagAddEmbeddingDocumentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagAddEmbeddingDocumentResponse copyWith(void Function(RagAddEmbeddingDocumentResponse) updates) => super.copyWith((message) => updates(message as RagAddEmbeddingDocumentResponse)) as RagAddEmbeddingDocumentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagAddEmbeddingDocumentResponse create() => RagAddEmbeddingDocumentResponse._();
  RagAddEmbeddingDocumentResponse createEmptyInstance() => create();
  static $pb.PbList<RagAddEmbeddingDocumentResponse> createRepeated() => $pb.PbList<RagAddEmbeddingDocumentResponse>();
  @$core.pragma('dart2js:noInline')
  static RagAddEmbeddingDocumentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagAddEmbeddingDocumentResponse>(create);
  static RagAddEmbeddingDocumentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get documentId => $_getI64(0);
  @$pb.TagNumber(1)
  set documentId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => clearField(1);
}

class RagDeleteEmbeddingDocumentRequest extends $pb.GeneratedMessage {
  factory RagDeleteEmbeddingDocumentRequest({
    $fixnum.Int64? documentId,
  }) {
    final $result = create();
    if (documentId != null) {
      $result.documentId = documentId;
    }
    return $result;
  }
  RagDeleteEmbeddingDocumentRequest._() : super();
  factory RagDeleteEmbeddingDocumentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagDeleteEmbeddingDocumentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagDeleteEmbeddingDocumentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'documentId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagDeleteEmbeddingDocumentRequest clone() => RagDeleteEmbeddingDocumentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagDeleteEmbeddingDocumentRequest copyWith(void Function(RagDeleteEmbeddingDocumentRequest) updates) => super.copyWith((message) => updates(message as RagDeleteEmbeddingDocumentRequest)) as RagDeleteEmbeddingDocumentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDeleteEmbeddingDocumentRequest create() => RagDeleteEmbeddingDocumentRequest._();
  RagDeleteEmbeddingDocumentRequest createEmptyInstance() => create();
  static $pb.PbList<RagDeleteEmbeddingDocumentRequest> createRepeated() => $pb.PbList<RagDeleteEmbeddingDocumentRequest>();
  @$core.pragma('dart2js:noInline')
  static RagDeleteEmbeddingDocumentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagDeleteEmbeddingDocumentRequest>(create);
  static RagDeleteEmbeddingDocumentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get documentId => $_getI64(0);
  @$pb.TagNumber(1)
  set documentId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => clearField(1);
}

class RagDeleteEmbeddingDocumentResponse extends $pb.GeneratedMessage {
  factory RagDeleteEmbeddingDocumentResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  RagDeleteEmbeddingDocumentResponse._() : super();
  factory RagDeleteEmbeddingDocumentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagDeleteEmbeddingDocumentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagDeleteEmbeddingDocumentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagDeleteEmbeddingDocumentResponse clone() => RagDeleteEmbeddingDocumentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagDeleteEmbeddingDocumentResponse copyWith(void Function(RagDeleteEmbeddingDocumentResponse) updates) => super.copyWith((message) => updates(message as RagDeleteEmbeddingDocumentResponse)) as RagDeleteEmbeddingDocumentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagDeleteEmbeddingDocumentResponse create() => RagDeleteEmbeddingDocumentResponse._();
  RagDeleteEmbeddingDocumentResponse createEmptyInstance() => create();
  static $pb.PbList<RagDeleteEmbeddingDocumentResponse> createRepeated() => $pb.PbList<RagDeleteEmbeddingDocumentResponse>();
  @$core.pragma('dart2js:noInline')
  static RagDeleteEmbeddingDocumentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagDeleteEmbeddingDocumentResponse>(create);
  static RagDeleteEmbeddingDocumentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class RagSearchEmbeddingDocumentsRequest extends $pb.GeneratedMessage {
  factory RagSearchEmbeddingDocumentsRequest({
    $core.String? query,
    $core.int? limit,
    $core.Map<$core.String, $core.String>? filter,
  }) {
    final $result = create();
    if (query != null) {
      $result.query = query;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (filter != null) {
      $result.filter.addAll(filter);
    }
    return $result;
  }
  RagSearchEmbeddingDocumentsRequest._() : super();
  factory RagSearchEmbeddingDocumentsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagSearchEmbeddingDocumentsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagSearchEmbeddingDocumentsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..m<$core.String, $core.String>(3, _omitFieldNames ? '' : 'filter', entryClassName: 'RagSearchEmbeddingDocumentsRequest.FilterEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('chat'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagSearchEmbeddingDocumentsRequest clone() => RagSearchEmbeddingDocumentsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagSearchEmbeddingDocumentsRequest copyWith(void Function(RagSearchEmbeddingDocumentsRequest) updates) => super.copyWith((message) => updates(message as RagSearchEmbeddingDocumentsRequest)) as RagSearchEmbeddingDocumentsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagSearchEmbeddingDocumentsRequest create() => RagSearchEmbeddingDocumentsRequest._();
  RagSearchEmbeddingDocumentsRequest createEmptyInstance() => create();
  static $pb.PbList<RagSearchEmbeddingDocumentsRequest> createRepeated() => $pb.PbList<RagSearchEmbeddingDocumentsRequest>();
  @$core.pragma('dart2js:noInline')
  static RagSearchEmbeddingDocumentsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagSearchEmbeddingDocumentsRequest>(create);
  static RagSearchEmbeddingDocumentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.String> get filter => $_getMap(2);
}

class RagSearchEmbeddingDocumentsResponse extends $pb.GeneratedMessage {
  factory RagSearchEmbeddingDocumentsResponse({
    $core.Iterable<RagEmbeddingSearchResult>? results,
  }) {
    final $result = create();
    if (results != null) {
      $result.results.addAll(results);
    }
    return $result;
  }
  RagSearchEmbeddingDocumentsResponse._() : super();
  factory RagSearchEmbeddingDocumentsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagSearchEmbeddingDocumentsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagSearchEmbeddingDocumentsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<RagEmbeddingSearchResult>(1, _omitFieldNames ? '' : 'results', $pb.PbFieldType.PM, subBuilder: RagEmbeddingSearchResult.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagSearchEmbeddingDocumentsResponse clone() => RagSearchEmbeddingDocumentsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagSearchEmbeddingDocumentsResponse copyWith(void Function(RagSearchEmbeddingDocumentsResponse) updates) => super.copyWith((message) => updates(message as RagSearchEmbeddingDocumentsResponse)) as RagSearchEmbeddingDocumentsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagSearchEmbeddingDocumentsResponse create() => RagSearchEmbeddingDocumentsResponse._();
  RagSearchEmbeddingDocumentsResponse createEmptyInstance() => create();
  static $pb.PbList<RagSearchEmbeddingDocumentsResponse> createRepeated() => $pb.PbList<RagSearchEmbeddingDocumentsResponse>();
  @$core.pragma('dart2js:noInline')
  static RagSearchEmbeddingDocumentsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagSearchEmbeddingDocumentsResponse>(create);
  static RagSearchEmbeddingDocumentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RagEmbeddingSearchResult> get results => $_getList(0);
}

class RagEmbeddingSearchResult extends $pb.GeneratedMessage {
  factory RagEmbeddingSearchResult({
    $fixnum.Int64? id,
    $core.String? content,
    $core.Map<$core.String, $core.String>? metadata,
    $core.double? similarityScore,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (content != null) {
      $result.content = content;
    }
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    if (similarityScore != null) {
      $result.similarityScore = similarityScore;
    }
    return $result;
  }
  RagEmbeddingSearchResult._() : super();
  factory RagEmbeddingSearchResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagEmbeddingSearchResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagEmbeddingSearchResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..m<$core.String, $core.String>(3, _omitFieldNames ? '' : 'metadata', entryClassName: 'RagEmbeddingSearchResult.MetadataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('chat'))
    ..a<$core.double>(4, _omitFieldNames ? '' : 'similarityScore', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagEmbeddingSearchResult clone() => RagEmbeddingSearchResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagEmbeddingSearchResult copyWith(void Function(RagEmbeddingSearchResult) updates) => super.copyWith((message) => updates(message as RagEmbeddingSearchResult)) as RagEmbeddingSearchResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagEmbeddingSearchResult create() => RagEmbeddingSearchResult._();
  RagEmbeddingSearchResult createEmptyInstance() => create();
  static $pb.PbList<RagEmbeddingSearchResult> createRepeated() => $pb.PbList<RagEmbeddingSearchResult>();
  @$core.pragma('dart2js:noInline')
  static RagEmbeddingSearchResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagEmbeddingSearchResult>(create);
  static RagEmbeddingSearchResult? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.String> get metadata => $_getMap(2);

  @$pb.TagNumber(4)
  $core.double get similarityScore => $_getN(3);
  @$pb.TagNumber(4)
  set similarityScore($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSimilarityScore() => $_has(3);
  @$pb.TagNumber(4)
  void clearSimilarityScore() => clearField(4);
}

/// File to be uploaded in batch
class RagUploadFile extends $pb.GeneratedMessage {
  factory RagUploadFile({
    $core.String? fileName,
    $core.String? content,
    $core.String? documentType,
    $core.String? type,
    $core.Map<$core.String, $core.String>? metadata,
    $core.Iterable<$core.String>? tags,
  }) {
    final $result = create();
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (content != null) {
      $result.content = content;
    }
    if (documentType != null) {
      $result.documentType = documentType;
    }
    if (type != null) {
      $result.type = type;
    }
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    return $result;
  }
  RagUploadFile._() : super();
  factory RagUploadFile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagUploadFile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagUploadFile', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileName')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..aOS(3, _omitFieldNames ? '' : 'documentType')
    ..aOS(4, _omitFieldNames ? '' : 'type')
    ..m<$core.String, $core.String>(5, _omitFieldNames ? '' : 'metadata', entryClassName: 'RagUploadFile.MetadataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('chat'))
    ..pPS(6, _omitFieldNames ? '' : 'tags')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagUploadFile clone() => RagUploadFile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagUploadFile copyWith(void Function(RagUploadFile) updates) => super.copyWith((message) => updates(message as RagUploadFile)) as RagUploadFile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagUploadFile create() => RagUploadFile._();
  RagUploadFile createEmptyInstance() => create();
  static $pb.PbList<RagUploadFile> createRepeated() => $pb.PbList<RagUploadFile>();
  @$core.pragma('dart2js:noInline')
  static RagUploadFile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagUploadFile>(create);
  static RagUploadFile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get documentType => $_getSZ(2);
  @$pb.TagNumber(3)
  set documentType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDocumentType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDocumentType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get type => $_getSZ(3);
  @$pb.TagNumber(4)
  set type($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasType() => $_has(3);
  @$pb.TagNumber(4)
  void clearType() => clearField(4);

  @$pb.TagNumber(5)
  $core.Map<$core.String, $core.String> get metadata => $_getMap(4);

  @$pb.TagNumber(6)
  $core.List<$core.String> get tags => $_getList(5);
}

/// Request to upload multiple files
class RagUploadFilesBatchRequest extends $pb.GeneratedMessage {
  factory RagUploadFilesBatchRequest({
    $core.Iterable<RagUploadFile>? files,
  }) {
    final $result = create();
    if (files != null) {
      $result.files.addAll(files);
    }
    return $result;
  }
  RagUploadFilesBatchRequest._() : super();
  factory RagUploadFilesBatchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagUploadFilesBatchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagUploadFilesBatchRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..pc<RagUploadFile>(1, _omitFieldNames ? '' : 'files', $pb.PbFieldType.PM, subBuilder: RagUploadFile.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagUploadFilesBatchRequest clone() => RagUploadFilesBatchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagUploadFilesBatchRequest copyWith(void Function(RagUploadFilesBatchRequest) updates) => super.copyWith((message) => updates(message as RagUploadFilesBatchRequest)) as RagUploadFilesBatchRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagUploadFilesBatchRequest create() => RagUploadFilesBatchRequest._();
  RagUploadFilesBatchRequest createEmptyInstance() => create();
  static $pb.PbList<RagUploadFilesBatchRequest> createRepeated() => $pb.PbList<RagUploadFilesBatchRequest>();
  @$core.pragma('dart2js:noInline')
  static RagUploadFilesBatchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagUploadFilesBatchRequest>(create);
  static RagUploadFilesBatchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RagUploadFile> get files => $_getList(0);
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
    final $result = create();
    if (fileName != null) {
      $result.fileName = fileName;
    }
    if (fileIndex != null) {
      $result.fileIndex = fileIndex;
    }
    if (totalFiles != null) {
      $result.totalFiles = totalFiles;
    }
    if (status != null) {
      $result.status = status;
    }
    if (message != null) {
      $result.message = message;
    }
    if (documentId != null) {
      $result.documentId = documentId;
    }
    if (error != null) {
      $result.error = error;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    return $result;
  }
  RagUploadFileProgress._() : super();
  factory RagUploadFileProgress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RagUploadFileProgress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RagUploadFileProgress', package: const $pb.PackageName(_omitMessageNames ? '' : 'chat'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fileName')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'fileIndex', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'totalFiles', $pb.PbFieldType.O3)
    ..e<RagUploadStatus>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: RagUploadStatus.UPLOAD_STATUS_UNKNOWN, valueOf: RagUploadStatus.valueOf, enumValues: RagUploadStatus.values)
    ..aOS(5, _omitFieldNames ? '' : 'message')
    ..aInt64(6, _omitFieldNames ? '' : 'documentId')
    ..aOS(7, _omitFieldNames ? '' : 'error')
    ..aOM<$1.Timestamp>(8, _omitFieldNames ? '' : 'timestamp', subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RagUploadFileProgress clone() => RagUploadFileProgress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RagUploadFileProgress copyWith(void Function(RagUploadFileProgress) updates) => super.copyWith((message) => updates(message as RagUploadFileProgress)) as RagUploadFileProgress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RagUploadFileProgress create() => RagUploadFileProgress._();
  RagUploadFileProgress createEmptyInstance() => create();
  static $pb.PbList<RagUploadFileProgress> createRepeated() => $pb.PbList<RagUploadFileProgress>();
  @$core.pragma('dart2js:noInline')
  static RagUploadFileProgress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RagUploadFileProgress>(create);
  static RagUploadFileProgress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fileName => $_getSZ(0);
  @$pb.TagNumber(1)
  set fileName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFileName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFileName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get fileIndex => $_getIZ(1);
  @$pb.TagNumber(2)
  set fileIndex($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalFiles => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalFiles($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTotalFiles() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalFiles() => clearField(3);

  @$pb.TagNumber(4)
  RagUploadStatus get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(RagUploadStatus v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get message => $_getSZ(4);
  @$pb.TagNumber(5)
  set message($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessage() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get documentId => $_getI64(5);
  @$pb.TagNumber(6)
  set documentId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDocumentId() => $_has(5);
  @$pb.TagNumber(6)
  void clearDocumentId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get error => $_getSZ(6);
  @$pb.TagNumber(7)
  set error($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasError() => $_has(6);
  @$pb.TagNumber(7)
  void clearError() => clearField(7);

  @$pb.TagNumber(8)
  $1.Timestamp get timestamp => $_getN(7);
  @$pb.TagNumber(8)
  set timestamp($1.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasTimestamp() => $_has(7);
  @$pb.TagNumber(8)
  void clearTimestamp() => clearField(8);
  @$pb.TagNumber(8)
  $1.Timestamp ensureTimestamp() => $_ensure(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
