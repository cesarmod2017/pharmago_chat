// This is a generated file - do not edit.
//
// Generated from rag/rag_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use ragUploadStatusDescriptor instead')
const RagUploadStatus$json = {
  '1': 'RagUploadStatus',
  '2': [
    {'1': 'UPLOAD_STATUS_UNKNOWN', '2': 0},
    {'1': 'UPLOAD_STATUS_RECEIVED', '2': 1},
    {'1': 'UPLOAD_STATUS_PROCESSING', '2': 2},
    {'1': 'UPLOAD_STATUS_COMPLETED', '2': 3},
    {'1': 'UPLOAD_STATUS_FAILED', '2': 4},
  ],
};

/// Descriptor for `RagUploadStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List ragUploadStatusDescriptor = $convert.base64Decode(
    'Cg9SYWdVcGxvYWRTdGF0dXMSGQoVVVBMT0FEX1NUQVRVU19VTktOT1dOEAASGgoWVVBMT0FEX1'
    'NUQVRVU19SRUNFSVZFRBABEhwKGFVQTE9BRF9TVEFUVVNfUFJPQ0VTU0lORxACEhsKF1VQTE9B'
    'RF9TVEFUVVNfQ09NUExFVEVEEAMSGAoUVVBMT0FEX1NUQVRVU19GQUlMRUQQBA==');

@$core.Deprecated('Use ragAddDocumentRequestDescriptor instead')
const RagAddDocumentRequest$json = {
  '1': 'RagAddDocumentRequest',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    {'1': 'document_type', '3': 3, '4': 1, '5': 9, '10': 'documentType'},
    {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
    {
      '1': 'metadata',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.chat.RagAddDocumentRequest.MetadataEntry',
      '10': 'metadata'
    },
    {'1': 'tags', '3': 6, '4': 3, '5': 9, '10': 'tags'},
  ],
  '3': [RagAddDocumentRequest_MetadataEntry$json],
};

@$core.Deprecated('Use ragAddDocumentRequestDescriptor instead')
const RagAddDocumentRequest_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RagAddDocumentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragAddDocumentRequestDescriptor = $convert.base64Decode(
    'ChVSYWdBZGREb2N1bWVudFJlcXVlc3QSFAoFdGl0bGUYASABKAlSBXRpdGxlEhgKB2NvbnRlbn'
    'QYAiABKAlSB2NvbnRlbnQSIwoNZG9jdW1lbnRfdHlwZRgDIAEoCVIMZG9jdW1lbnRUeXBlEhIK'
    'BHR5cGUYBCABKAlSBHR5cGUSRQoIbWV0YWRhdGEYBSADKAsyKS5jaGF0LlJhZ0FkZERvY3VtZW'
    '50UmVxdWVzdC5NZXRhZGF0YUVudHJ5UghtZXRhZGF0YRISCgR0YWdzGAYgAygJUgR0YWdzGjsK'
    'DU1ldGFkYXRhRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOg'
    'I4AQ==');

@$core.Deprecated('Use ragAddDocumentResponseDescriptor instead')
const RagAddDocumentResponse$json = {
  '1': 'RagAddDocumentResponse',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '10': 'documentId'},
    {'1': 'chunks_created', '3': 2, '4': 1, '5': 5, '10': 'chunksCreated'},
    {
      '1': 'created_at',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
  ],
};

/// Descriptor for `RagAddDocumentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragAddDocumentResponseDescriptor = $convert.base64Decode(
    'ChZSYWdBZGREb2N1bWVudFJlc3BvbnNlEh8KC2RvY3VtZW50X2lkGAEgASgJUgpkb2N1bWVudE'
    'lkEiUKDmNodW5rc19jcmVhdGVkGAIgASgFUg1jaHVua3NDcmVhdGVkEjkKCmNyZWF0ZWRfYXQY'
    'AyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQ=');

@$core.Deprecated('Use ragAddDocumentsBatchRequestDescriptor instead')
const RagAddDocumentsBatchRequest$json = {
  '1': 'RagAddDocumentsBatchRequest',
  '2': [
    {
      '1': 'documents',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.chat.RagAddDocumentRequest',
      '10': 'documents'
    },
  ],
};

/// Descriptor for `RagAddDocumentsBatchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragAddDocumentsBatchRequestDescriptor =
    $convert.base64Decode(
        'ChtSYWdBZGREb2N1bWVudHNCYXRjaFJlcXVlc3QSOQoJZG9jdW1lbnRzGAEgAygLMhsuY2hhdC'
        '5SYWdBZGREb2N1bWVudFJlcXVlc3RSCWRvY3VtZW50cw==');

@$core.Deprecated('Use ragAddDocumentsBatchResponseDescriptor instead')
const RagAddDocumentsBatchResponse$json = {
  '1': 'RagAddDocumentsBatchResponse',
  '2': [
    {
      '1': 'results',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.chat.RagAddDocumentResponse',
      '10': 'results'
    },
    {'1': 'success_count', '3': 2, '4': 1, '5': 5, '10': 'successCount'},
    {'1': 'failure_count', '3': 3, '4': 1, '5': 5, '10': 'failureCount'},
    {'1': 'errors', '3': 4, '4': 3, '5': 9, '10': 'errors'},
  ],
};

/// Descriptor for `RagAddDocumentsBatchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragAddDocumentsBatchResponseDescriptor = $convert.base64Decode(
    'ChxSYWdBZGREb2N1bWVudHNCYXRjaFJlc3BvbnNlEjYKB3Jlc3VsdHMYASADKAsyHC5jaGF0Ll'
    'JhZ0FkZERvY3VtZW50UmVzcG9uc2VSB3Jlc3VsdHMSIwoNc3VjY2Vzc19jb3VudBgCIAEoBVIM'
    'c3VjY2Vzc0NvdW50EiMKDWZhaWx1cmVfY291bnQYAyABKAVSDGZhaWx1cmVDb3VudBIWCgZlcn'
    'JvcnMYBCADKAlSBmVycm9ycw==');

@$core.Deprecated('Use ragDeleteDocumentRequestDescriptor instead')
const RagDeleteDocumentRequest$json = {
  '1': 'RagDeleteDocumentRequest',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '10': 'documentId'},
  ],
};

/// Descriptor for `RagDeleteDocumentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragDeleteDocumentRequestDescriptor =
    $convert.base64Decode(
        'ChhSYWdEZWxldGVEb2N1bWVudFJlcXVlc3QSHwoLZG9jdW1lbnRfaWQYASABKAlSCmRvY3VtZW'
        '50SWQ=');

@$core.Deprecated('Use ragDeleteDocumentResponseDescriptor instead')
const RagDeleteDocumentResponse$json = {
  '1': 'RagDeleteDocumentResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'chunks_deleted', '3': 2, '4': 1, '5': 5, '10': 'chunksDeleted'},
  ],
};

/// Descriptor for `RagDeleteDocumentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragDeleteDocumentResponseDescriptor =
    $convert.base64Decode(
        'ChlSYWdEZWxldGVEb2N1bWVudFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSJQ'
        'oOY2h1bmtzX2RlbGV0ZWQYAiABKAVSDWNodW5rc0RlbGV0ZWQ=');

@$core.Deprecated('Use ragDeleteDocumentsBatchRequestDescriptor instead')
const RagDeleteDocumentsBatchRequest$json = {
  '1': 'RagDeleteDocumentsBatchRequest',
  '2': [
    {'1': 'document_ids', '3': 1, '4': 3, '5': 9, '10': 'documentIds'},
  ],
};

/// Descriptor for `RagDeleteDocumentsBatchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragDeleteDocumentsBatchRequestDescriptor =
    $convert.base64Decode(
        'Ch5SYWdEZWxldGVEb2N1bWVudHNCYXRjaFJlcXVlc3QSIQoMZG9jdW1lbnRfaWRzGAEgAygJUg'
        'tkb2N1bWVudElkcw==');

@$core.Deprecated('Use ragDeleteDocumentsBatchResponseDescriptor instead')
const RagDeleteDocumentsBatchResponse$json = {
  '1': 'RagDeleteDocumentsBatchResponse',
  '2': [
    {'1': 'success_count', '3': 1, '4': 1, '5': 5, '10': 'successCount'},
    {'1': 'failure_count', '3': 2, '4': 1, '5': 5, '10': 'failureCount'},
    {'1': 'errors', '3': 3, '4': 3, '5': 9, '10': 'errors'},
  ],
};

/// Descriptor for `RagDeleteDocumentsBatchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragDeleteDocumentsBatchResponseDescriptor =
    $convert.base64Decode(
        'Ch9SYWdEZWxldGVEb2N1bWVudHNCYXRjaFJlc3BvbnNlEiMKDXN1Y2Nlc3NfY291bnQYASABKA'
        'VSDHN1Y2Nlc3NDb3VudBIjCg1mYWlsdXJlX2NvdW50GAIgASgFUgxmYWlsdXJlQ291bnQSFgoG'
        'ZXJyb3JzGAMgAygJUgZlcnJvcnM=');

@$core.Deprecated('Use ragListDocumentsRequestDescriptor instead')
const RagListDocumentsRequest$json = {
  '1': 'RagListDocumentsRequest',
  '2': [
    {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 2, '4': 1, '5': 5, '10': 'offset'},
    {
      '1': 'document_type_filter',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'documentTypeFilter'
    },
    {'1': 'type_filter', '3': 4, '4': 1, '5': 9, '10': 'typeFilter'},
    {'1': 'tag_filter', '3': 5, '4': 3, '5': 9, '10': 'tagFilter'},
  ],
};

/// Descriptor for `RagListDocumentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragListDocumentsRequestDescriptor = $convert.base64Decode(
    'ChdSYWdMaXN0RG9jdW1lbnRzUmVxdWVzdBIUCgVsaW1pdBgBIAEoBVIFbGltaXQSFgoGb2Zmc2'
    'V0GAIgASgFUgZvZmZzZXQSMAoUZG9jdW1lbnRfdHlwZV9maWx0ZXIYAyABKAlSEmRvY3VtZW50'
    'VHlwZUZpbHRlchIfCgt0eXBlX2ZpbHRlchgEIAEoCVIKdHlwZUZpbHRlchIdCgp0YWdfZmlsdG'
    'VyGAUgAygJUgl0YWdGaWx0ZXI=');

@$core.Deprecated('Use ragListDocumentsResponseDescriptor instead')
const RagListDocumentsResponse$json = {
  '1': 'RagListDocumentsResponse',
  '2': [
    {
      '1': 'documents',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.chat.RagDocumentInfo',
      '10': 'documents'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
  ],
};

/// Descriptor for `RagListDocumentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragListDocumentsResponseDescriptor = $convert.base64Decode(
    'ChhSYWdMaXN0RG9jdW1lbnRzUmVzcG9uc2USMwoJZG9jdW1lbnRzGAEgAygLMhUuY2hhdC5SYW'
    'dEb2N1bWVudEluZm9SCWRvY3VtZW50cxIfCgt0b3RhbF9jb3VudBgCIAEoBVIKdG90YWxDb3Vu'
    'dA==');

@$core.Deprecated('Use ragGetDocumentRequestDescriptor instead')
const RagGetDocumentRequest$json = {
  '1': 'RagGetDocumentRequest',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '10': 'documentId'},
  ],
};

/// Descriptor for `RagGetDocumentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragGetDocumentRequestDescriptor = $convert.base64Decode(
    'ChVSYWdHZXREb2N1bWVudFJlcXVlc3QSHwoLZG9jdW1lbnRfaWQYASABKAlSCmRvY3VtZW50SW'
    'Q=');

@$core.Deprecated('Use ragDocumentInfoDescriptor instead')
const RagDocumentInfo$json = {
  '1': 'RagDocumentInfo',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '10': 'documentId'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'document_type', '3': 3, '4': 1, '5': 9, '10': 'documentType'},
    {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
    {'1': 'chunk_count', '3': 5, '4': 1, '5': 5, '10': 'chunkCount'},
    {
      '1': 'created_at',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
    {
      '1': 'metadata',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.chat.RagDocumentInfo.MetadataEntry',
      '10': 'metadata'
    },
    {'1': 'tags', '3': 9, '4': 3, '5': 9, '10': 'tags'},
    {'1': 'content_length', '3': 10, '4': 1, '5': 5, '10': 'contentLength'},
  ],
  '3': [RagDocumentInfo_MetadataEntry$json],
};

@$core.Deprecated('Use ragDocumentInfoDescriptor instead')
const RagDocumentInfo_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RagDocumentInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragDocumentInfoDescriptor = $convert.base64Decode(
    'Cg9SYWdEb2N1bWVudEluZm8SHwoLZG9jdW1lbnRfaWQYASABKAlSCmRvY3VtZW50SWQSFAoFdG'
    'l0bGUYAiABKAlSBXRpdGxlEiMKDWRvY3VtZW50X3R5cGUYAyABKAlSDGRvY3VtZW50VHlwZRIS'
    'CgR0eXBlGAQgASgJUgR0eXBlEh8KC2NodW5rX2NvdW50GAUgASgFUgpjaHVua0NvdW50EjkKCm'
    'NyZWF0ZWRfYXQYBiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQS'
    'OQoKdXBkYXRlZF9hdBgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZW'
    'RBdBI/CghtZXRhZGF0YRgIIAMoCzIjLmNoYXQuUmFnRG9jdW1lbnRJbmZvLk1ldGFkYXRhRW50'
    'cnlSCG1ldGFkYXRhEhIKBHRhZ3MYCSADKAlSBHRhZ3MSJQoOY29udGVudF9sZW5ndGgYCiABKA'
    'VSDWNvbnRlbnRMZW5ndGgaOwoNTWV0YWRhdGFFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2'
    'YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use ragSearchDocumentsRequestDescriptor instead')
const RagSearchDocumentsRequest$json = {
  '1': 'RagSearchDocumentsRequest',
  '2': [
    {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    {
      '1': 'similarity_threshold',
      '3': 3,
      '4': 1,
      '5': 2,
      '10': 'similarityThreshold'
    },
    {'1': 'type_filter', '3': 4, '4': 1, '5': 9, '10': 'typeFilter'},
    {'1': 'tag_filter', '3': 5, '4': 3, '5': 9, '10': 'tagFilter'},
  ],
};

/// Descriptor for `RagSearchDocumentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragSearchDocumentsRequestDescriptor = $convert.base64Decode(
    'ChlSYWdTZWFyY2hEb2N1bWVudHNSZXF1ZXN0EhQKBXF1ZXJ5GAEgASgJUgVxdWVyeRIUCgVsaW'
    '1pdBgCIAEoBVIFbGltaXQSMQoUc2ltaWxhcml0eV90aHJlc2hvbGQYAyABKAJSE3NpbWlsYXJp'
    'dHlUaHJlc2hvbGQSHwoLdHlwZV9maWx0ZXIYBCABKAlSCnR5cGVGaWx0ZXISHQoKdGFnX2ZpbH'
    'RlchgFIAMoCVIJdGFnRmlsdGVy');

@$core.Deprecated('Use ragSearchDocumentsResponseDescriptor instead')
const RagSearchDocumentsResponse$json = {
  '1': 'RagSearchDocumentsResponse',
  '2': [
    {
      '1': 'results',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.chat.RagSearchResult',
      '10': 'results'
    },
  ],
};

/// Descriptor for `RagSearchDocumentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragSearchDocumentsResponseDescriptor =
    $convert.base64Decode(
        'ChpSYWdTZWFyY2hEb2N1bWVudHNSZXNwb25zZRIvCgdyZXN1bHRzGAEgAygLMhUuY2hhdC5SYW'
        'dTZWFyY2hSZXN1bHRSB3Jlc3VsdHM=');

@$core.Deprecated('Use ragSearchResultDescriptor instead')
const RagSearchResult$json = {
  '1': 'RagSearchResult',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '10': 'documentId'},
    {'1': 'chunk_id', '3': 2, '4': 1, '5': 9, '10': 'chunkId'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    {'1': 'type', '3': 5, '4': 1, '5': 9, '10': 'type'},
    {'1': 'similarity_score', '3': 6, '4': 1, '5': 2, '10': 'similarityScore'},
    {
      '1': 'metadata',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.chat.RagSearchResult.MetadataEntry',
      '10': 'metadata'
    },
    {'1': 'tags', '3': 8, '4': 3, '5': 9, '10': 'tags'},
  ],
  '3': [RagSearchResult_MetadataEntry$json],
};

@$core.Deprecated('Use ragSearchResultDescriptor instead')
const RagSearchResult_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RagSearchResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragSearchResultDescriptor = $convert.base64Decode(
    'Cg9SYWdTZWFyY2hSZXN1bHQSHwoLZG9jdW1lbnRfaWQYASABKAlSCmRvY3VtZW50SWQSGQoIY2'
    'h1bmtfaWQYAiABKAlSB2NodW5rSWQSFAoFdGl0bGUYAyABKAlSBXRpdGxlEhgKB2NvbnRlbnQY'
    'BCABKAlSB2NvbnRlbnQSEgoEdHlwZRgFIAEoCVIEdHlwZRIpChBzaW1pbGFyaXR5X3Njb3JlGA'
    'YgASgCUg9zaW1pbGFyaXR5U2NvcmUSPwoIbWV0YWRhdGEYByADKAsyIy5jaGF0LlJhZ1NlYXJj'
    'aFJlc3VsdC5NZXRhZGF0YUVudHJ5UghtZXRhZGF0YRISCgR0YWdzGAggAygJUgR0YWdzGjsKDU'
    '1ldGFkYXRhRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4'
    'AQ==');

@$core.Deprecated('Use ragAddEmbeddingDocumentRequestDescriptor instead')
const RagAddEmbeddingDocumentRequest$json = {
  '1': 'RagAddEmbeddingDocumentRequest',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
    {
      '1': 'metadata',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.chat.RagAddEmbeddingDocumentRequest.MetadataEntry',
      '10': 'metadata'
    },
  ],
  '3': [RagAddEmbeddingDocumentRequest_MetadataEntry$json],
};

@$core.Deprecated('Use ragAddEmbeddingDocumentRequestDescriptor instead')
const RagAddEmbeddingDocumentRequest_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RagAddEmbeddingDocumentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragAddEmbeddingDocumentRequestDescriptor =
    $convert.base64Decode(
        'Ch5SYWdBZGRFbWJlZGRpbmdEb2N1bWVudFJlcXVlc3QSGAoHY29udGVudBgBIAEoCVIHY29udG'
        'VudBJOCghtZXRhZGF0YRgCIAMoCzIyLmNoYXQuUmFnQWRkRW1iZWRkaW5nRG9jdW1lbnRSZXF1'
        'ZXN0Lk1ldGFkYXRhRW50cnlSCG1ldGFkYXRhGjsKDU1ldGFkYXRhRW50cnkSEAoDa2V5GAEgAS'
        'gJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use ragAddEmbeddingDocumentResponseDescriptor instead')
const RagAddEmbeddingDocumentResponse$json = {
  '1': 'RagAddEmbeddingDocumentResponse',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 3, '10': 'documentId'},
  ],
};

/// Descriptor for `RagAddEmbeddingDocumentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragAddEmbeddingDocumentResponseDescriptor =
    $convert.base64Decode(
        'Ch9SYWdBZGRFbWJlZGRpbmdEb2N1bWVudFJlc3BvbnNlEh8KC2RvY3VtZW50X2lkGAEgASgDUg'
        'pkb2N1bWVudElk');

@$core.Deprecated('Use ragDeleteEmbeddingDocumentRequestDescriptor instead')
const RagDeleteEmbeddingDocumentRequest$json = {
  '1': 'RagDeleteEmbeddingDocumentRequest',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 3, '10': 'documentId'},
  ],
};

/// Descriptor for `RagDeleteEmbeddingDocumentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragDeleteEmbeddingDocumentRequestDescriptor =
    $convert.base64Decode(
        'CiFSYWdEZWxldGVFbWJlZGRpbmdEb2N1bWVudFJlcXVlc3QSHwoLZG9jdW1lbnRfaWQYASABKA'
        'NSCmRvY3VtZW50SWQ=');

@$core.Deprecated('Use ragDeleteEmbeddingDocumentResponseDescriptor instead')
const RagDeleteEmbeddingDocumentResponse$json = {
  '1': 'RagDeleteEmbeddingDocumentResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `RagDeleteEmbeddingDocumentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragDeleteEmbeddingDocumentResponseDescriptor =
    $convert.base64Decode(
        'CiJSYWdEZWxldGVFbWJlZGRpbmdEb2N1bWVudFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3'
        'N1Y2Nlc3M=');

@$core.Deprecated('Use ragSearchEmbeddingDocumentsRequestDescriptor instead')
const RagSearchEmbeddingDocumentsRequest$json = {
  '1': 'RagSearchEmbeddingDocumentsRequest',
  '2': [
    {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    {
      '1': 'filter',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.chat.RagSearchEmbeddingDocumentsRequest.FilterEntry',
      '10': 'filter'
    },
  ],
  '3': [RagSearchEmbeddingDocumentsRequest_FilterEntry$json],
};

@$core.Deprecated('Use ragSearchEmbeddingDocumentsRequestDescriptor instead')
const RagSearchEmbeddingDocumentsRequest_FilterEntry$json = {
  '1': 'FilterEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RagSearchEmbeddingDocumentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragSearchEmbeddingDocumentsRequestDescriptor =
    $convert.base64Decode(
        'CiJSYWdTZWFyY2hFbWJlZGRpbmdEb2N1bWVudHNSZXF1ZXN0EhQKBXF1ZXJ5GAEgASgJUgVxdW'
        'VyeRIUCgVsaW1pdBgCIAEoBVIFbGltaXQSTAoGZmlsdGVyGAMgAygLMjQuY2hhdC5SYWdTZWFy'
        'Y2hFbWJlZGRpbmdEb2N1bWVudHNSZXF1ZXN0LkZpbHRlckVudHJ5UgZmaWx0ZXIaOQoLRmlsdG'
        'VyRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use ragSearchEmbeddingDocumentsResponseDescriptor instead')
const RagSearchEmbeddingDocumentsResponse$json = {
  '1': 'RagSearchEmbeddingDocumentsResponse',
  '2': [
    {
      '1': 'results',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.chat.RagEmbeddingSearchResult',
      '10': 'results'
    },
  ],
};

/// Descriptor for `RagSearchEmbeddingDocumentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragSearchEmbeddingDocumentsResponseDescriptor =
    $convert.base64Decode(
        'CiNSYWdTZWFyY2hFbWJlZGRpbmdEb2N1bWVudHNSZXNwb25zZRI4CgdyZXN1bHRzGAEgAygLMh'
        '4uY2hhdC5SYWdFbWJlZGRpbmdTZWFyY2hSZXN1bHRSB3Jlc3VsdHM=');

@$core.Deprecated('Use ragEmbeddingSearchResultDescriptor instead')
const RagEmbeddingSearchResult$json = {
  '1': 'RagEmbeddingSearchResult',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    {
      '1': 'metadata',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.chat.RagEmbeddingSearchResult.MetadataEntry',
      '10': 'metadata'
    },
    {'1': 'similarity_score', '3': 4, '4': 1, '5': 2, '10': 'similarityScore'},
  ],
  '3': [RagEmbeddingSearchResult_MetadataEntry$json],
};

@$core.Deprecated('Use ragEmbeddingSearchResultDescriptor instead')
const RagEmbeddingSearchResult_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RagEmbeddingSearchResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragEmbeddingSearchResultDescriptor = $convert.base64Decode(
    'ChhSYWdFbWJlZGRpbmdTZWFyY2hSZXN1bHQSDgoCaWQYASABKANSAmlkEhgKB2NvbnRlbnQYAi'
    'ABKAlSB2NvbnRlbnQSSAoIbWV0YWRhdGEYAyADKAsyLC5jaGF0LlJhZ0VtYmVkZGluZ1NlYXJj'
    'aFJlc3VsdC5NZXRhZGF0YUVudHJ5UghtZXRhZGF0YRIpChBzaW1pbGFyaXR5X3Njb3JlGAQgAS'
    'gCUg9zaW1pbGFyaXR5U2NvcmUaOwoNTWV0YWRhdGFFbnRyeRIQCgNrZXkYASABKAlSA2tleRIU'
    'CgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use ragUploadFileDescriptor instead')
const RagUploadFile$json = {
  '1': 'RagUploadFile',
  '2': [
    {'1': 'file_name', '3': 1, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    {'1': 'document_type', '3': 3, '4': 1, '5': 9, '10': 'documentType'},
    {'1': 'type', '3': 4, '4': 1, '5': 9, '10': 'type'},
    {
      '1': 'metadata',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.chat.RagUploadFile.MetadataEntry',
      '10': 'metadata'
    },
    {'1': 'tags', '3': 6, '4': 3, '5': 9, '10': 'tags'},
  ],
  '3': [RagUploadFile_MetadataEntry$json],
};

@$core.Deprecated('Use ragUploadFileDescriptor instead')
const RagUploadFile_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `RagUploadFile`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragUploadFileDescriptor = $convert.base64Decode(
    'Cg1SYWdVcGxvYWRGaWxlEhsKCWZpbGVfbmFtZRgBIAEoCVIIZmlsZU5hbWUSGAoHY29udGVudB'
    'gCIAEoCVIHY29udGVudBIjCg1kb2N1bWVudF90eXBlGAMgASgJUgxkb2N1bWVudFR5cGUSEgoE'
    'dHlwZRgEIAEoCVIEdHlwZRI9CghtZXRhZGF0YRgFIAMoCzIhLmNoYXQuUmFnVXBsb2FkRmlsZS'
    '5NZXRhZGF0YUVudHJ5UghtZXRhZGF0YRISCgR0YWdzGAYgAygJUgR0YWdzGjsKDU1ldGFkYXRh'
    'RW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use ragUploadFilesBatchRequestDescriptor instead')
const RagUploadFilesBatchRequest$json = {
  '1': 'RagUploadFilesBatchRequest',
  '2': [
    {
      '1': 'files',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.chat.RagUploadFile',
      '10': 'files'
    },
  ],
};

/// Descriptor for `RagUploadFilesBatchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragUploadFilesBatchRequestDescriptor =
    $convert.base64Decode(
        'ChpSYWdVcGxvYWRGaWxlc0JhdGNoUmVxdWVzdBIpCgVmaWxlcxgBIAMoCzITLmNoYXQuUmFnVX'
        'Bsb2FkRmlsZVIFZmlsZXM=');

@$core.Deprecated('Use ragUploadFileProgressDescriptor instead')
const RagUploadFileProgress$json = {
  '1': 'RagUploadFileProgress',
  '2': [
    {'1': 'file_name', '3': 1, '4': 1, '5': 9, '10': 'fileName'},
    {'1': 'file_index', '3': 2, '4': 1, '5': 5, '10': 'fileIndex'},
    {'1': 'total_files', '3': 3, '4': 1, '5': 5, '10': 'totalFiles'},
    {
      '1': 'status',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.chat.RagUploadStatus',
      '10': 'status'
    },
    {'1': 'message', '3': 5, '4': 1, '5': 9, '10': 'message'},
    {'1': 'document_id', '3': 6, '4': 1, '5': 3, '10': 'documentId'},
    {'1': 'error', '3': 7, '4': 1, '5': 9, '10': 'error'},
    {
      '1': 'timestamp',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
  ],
};

/// Descriptor for `RagUploadFileProgress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ragUploadFileProgressDescriptor = $convert.base64Decode(
    'ChVSYWdVcGxvYWRGaWxlUHJvZ3Jlc3MSGwoJZmlsZV9uYW1lGAEgASgJUghmaWxlTmFtZRIdCg'
    'pmaWxlX2luZGV4GAIgASgFUglmaWxlSW5kZXgSHwoLdG90YWxfZmlsZXMYAyABKAVSCnRvdGFs'
    'RmlsZXMSLQoGc3RhdHVzGAQgASgOMhUuY2hhdC5SYWdVcGxvYWRTdGF0dXNSBnN0YXR1cxIYCg'
    'dtZXNzYWdlGAUgASgJUgdtZXNzYWdlEh8KC2RvY3VtZW50X2lkGAYgASgDUgpkb2N1bWVudElk'
    'EhQKBWVycm9yGAcgASgJUgVlcnJvchI4Cgl0aW1lc3RhbXAYCCABKAsyGi5nb29nbGUucHJvdG'
    '9idWYuVGltZXN0YW1wUgl0aW1lc3RhbXA=');
