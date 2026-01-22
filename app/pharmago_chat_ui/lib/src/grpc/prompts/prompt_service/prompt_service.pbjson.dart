// This is a generated file - do not edit.
//
// Generated from prompts/prompt_service.proto.

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

@$core.Deprecated('Use createPromptRequestDescriptor instead')
const CreatePromptRequest$json = {
  '1': 'CreatePromptRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    {'1': 'prompt', '3': 3, '4': 1, '5': 9, '10': 'prompt'},
    {'1': 'welcome_message', '3': 4, '4': 1, '5': 9, '10': 'welcomeMessage'},
  ],
};

/// Descriptor for `CreatePromptRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPromptRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVQcm9tcHRSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWUSEgoEdHlwZRgCIAEoCV'
    'IEdHlwZRIWCgZwcm9tcHQYAyABKAlSBnByb21wdBInCg93ZWxjb21lX21lc3NhZ2UYBCABKAlS'
    'DndlbGNvbWVNZXNzYWdl');

@$core.Deprecated('Use createPromptResponseDescriptor instead')
const CreatePromptResponse$json = {
  '1': 'CreatePromptResponse',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {
      '1': 'created_at',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
  ],
};

/// Descriptor for `CreatePromptResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPromptResponseDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVQcm9tcHRSZXNwb25zZRIOCgJpZBgBIAEoCVICaWQSOQoKY3JlYXRlZF9hdBgCIA'
    'EoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdA==');

@$core.Deprecated('Use updatePromptRequestDescriptor instead')
const UpdatePromptRequest$json = {
  '1': 'UpdatePromptRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {'1': 'prompt', '3': 4, '4': 1, '5': 9, '10': 'prompt'},
    {'1': 'welcome_message', '3': 5, '4': 1, '5': 9, '10': 'welcomeMessage'},
  ],
};

/// Descriptor for `UpdatePromptRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePromptRequestDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVQcm9tcHRSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW'
    '1lEhIKBHR5cGUYAyABKAlSBHR5cGUSFgoGcHJvbXB0GAQgASgJUgZwcm9tcHQSJwoPd2VsY29t'
    'ZV9tZXNzYWdlGAUgASgJUg53ZWxjb21lTWVzc2FnZQ==');

@$core.Deprecated('Use updatePromptResponseDescriptor instead')
const UpdatePromptResponse$json = {
  '1': 'UpdatePromptResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'updated_at',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
  ],
};

/// Descriptor for `UpdatePromptResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePromptResponseDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVQcm9tcHRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEjkKCnVwZG'
    'F0ZWRfYXQYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use deletePromptRequestDescriptor instead')
const DeletePromptRequest$json = {
  '1': 'DeletePromptRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `DeletePromptRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePromptRequestDescriptor = $convert
    .base64Decode('ChNEZWxldGVQcm9tcHRSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');

@$core.Deprecated('Use deletePromptResponseDescriptor instead')
const DeletePromptResponse$json = {
  '1': 'DeletePromptResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeletePromptResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePromptResponseDescriptor =
    $convert.base64Decode(
        'ChREZWxldGVQcm9tcHRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use getPromptRequestDescriptor instead')
const GetPromptRequest$json = {
  '1': 'GetPromptRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetPromptRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPromptRequestDescriptor =
    $convert.base64Decode('ChBHZXRQcm9tcHRSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');

@$core.Deprecated('Use listPromptsRequestDescriptor instead')
const ListPromptsRequest$json = {
  '1': 'ListPromptsRequest',
  '2': [
    {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 2, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `ListPromptsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPromptsRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0UHJvbXB0c1JlcXVlc3QSFAoFbGltaXQYASABKAVSBWxpbWl0EhYKBm9mZnNldBgCIA'
    'EoBVIGb2Zmc2V0');

@$core.Deprecated('Use getPromptsByTypeRequestDescriptor instead')
const GetPromptsByTypeRequest$json = {
  '1': 'GetPromptsByTypeRequest',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 9, '10': 'type'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `GetPromptsByTypeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPromptsByTypeRequestDescriptor =
    $convert.base64Decode(
        'ChdHZXRQcm9tcHRzQnlUeXBlUmVxdWVzdBISCgR0eXBlGAEgASgJUgR0eXBlEhQKBWxpbWl0GA'
        'IgASgFUgVsaW1pdBIWCgZvZmZzZXQYAyABKAVSBm9mZnNldA==');

@$core.Deprecated('Use listPromptsResponseDescriptor instead')
const ListPromptsResponse$json = {
  '1': 'ListPromptsResponse',
  '2': [
    {
      '1': 'prompts',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.chat.PromptInfo',
      '10': 'prompts'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
  ],
};

/// Descriptor for `ListPromptsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPromptsResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0UHJvbXB0c1Jlc3BvbnNlEioKB3Byb21wdHMYASADKAsyEC5jaGF0LlByb21wdEluZm'
    '9SB3Byb21wdHMSHwoLdG90YWxfY291bnQYAiABKAVSCnRvdGFsQ291bnQ=');

@$core.Deprecated('Use promptInfoDescriptor instead')
const PromptInfo$json = {
  '1': 'PromptInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {'1': 'prompt', '3': 4, '4': 1, '5': 9, '10': 'prompt'},
    {'1': 'welcome_message', '3': 5, '4': 1, '5': 9, '10': 'welcomeMessage'},
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
  ],
};

/// Descriptor for `PromptInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List promptInfoDescriptor = $convert.base64Decode(
    'CgpQcm9tcHRJbmZvEg4KAmlkGAEgASgJUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhIKBHR5cG'
    'UYAyABKAlSBHR5cGUSFgoGcHJvbXB0GAQgASgJUgZwcm9tcHQSJwoPd2VsY29tZV9tZXNzYWdl'
    'GAUgASgJUg53ZWxjb21lTWVzc2FnZRI5CgpjcmVhdGVkX2F0GAYgASgLMhouZ29vZ2xlLnByb3'
    'RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYByABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');
