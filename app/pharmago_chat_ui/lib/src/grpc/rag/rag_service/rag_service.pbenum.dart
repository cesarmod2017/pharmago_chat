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

import 'package:protobuf/protobuf.dart' as $pb;

/// Progress status for file upload
class RagUploadStatus extends $pb.ProtobufEnum {
  static const RagUploadStatus UPLOAD_STATUS_UNKNOWN = RagUploadStatus._(0, _omitEnumNames ? '' : 'UPLOAD_STATUS_UNKNOWN');
  static const RagUploadStatus UPLOAD_STATUS_RECEIVED = RagUploadStatus._(1, _omitEnumNames ? '' : 'UPLOAD_STATUS_RECEIVED');
  static const RagUploadStatus UPLOAD_STATUS_PROCESSING = RagUploadStatus._(2, _omitEnumNames ? '' : 'UPLOAD_STATUS_PROCESSING');
  static const RagUploadStatus UPLOAD_STATUS_COMPLETED = RagUploadStatus._(3, _omitEnumNames ? '' : 'UPLOAD_STATUS_COMPLETED');
  static const RagUploadStatus UPLOAD_STATUS_FAILED = RagUploadStatus._(4, _omitEnumNames ? '' : 'UPLOAD_STATUS_FAILED');

  static const $core.List<RagUploadStatus> values = <RagUploadStatus> [
    UPLOAD_STATUS_UNKNOWN,
    UPLOAD_STATUS_RECEIVED,
    UPLOAD_STATUS_PROCESSING,
    UPLOAD_STATUS_COMPLETED,
    UPLOAD_STATUS_FAILED,
  ];

  static final $core.Map<$core.int, RagUploadStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RagUploadStatus? valueOf($core.int value) => _byValue[value];

  const RagUploadStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
