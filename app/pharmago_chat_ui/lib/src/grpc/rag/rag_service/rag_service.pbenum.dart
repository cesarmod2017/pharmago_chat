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

import 'package:protobuf/protobuf.dart' as $pb;

/// Progress status for file upload
class RagUploadStatus extends $pb.ProtobufEnum {
  static const RagUploadStatus UPLOAD_STATUS_UNKNOWN =
      RagUploadStatus._(0, _omitEnumNames ? '' : 'UPLOAD_STATUS_UNKNOWN');
  static const RagUploadStatus UPLOAD_STATUS_RECEIVED =
      RagUploadStatus._(1, _omitEnumNames ? '' : 'UPLOAD_STATUS_RECEIVED');
  static const RagUploadStatus UPLOAD_STATUS_PROCESSING =
      RagUploadStatus._(2, _omitEnumNames ? '' : 'UPLOAD_STATUS_PROCESSING');
  static const RagUploadStatus UPLOAD_STATUS_COMPLETED =
      RagUploadStatus._(3, _omitEnumNames ? '' : 'UPLOAD_STATUS_COMPLETED');
  static const RagUploadStatus UPLOAD_STATUS_FAILED =
      RagUploadStatus._(4, _omitEnumNames ? '' : 'UPLOAD_STATUS_FAILED');

  static const $core.List<RagUploadStatus> values = <RagUploadStatus>[
    UPLOAD_STATUS_UNKNOWN,
    UPLOAD_STATUS_RECEIVED,
    UPLOAD_STATUS_PROCESSING,
    UPLOAD_STATUS_COMPLETED,
    UPLOAD_STATUS_FAILED,
  ];

  static final $core.List<RagUploadStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static RagUploadStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const RagUploadStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
