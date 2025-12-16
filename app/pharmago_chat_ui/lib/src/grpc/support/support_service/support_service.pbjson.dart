//
//  Generated code. Do not modify.
//  source: support/support_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use supportRequestTransferRequestDescriptor instead')
const SupportRequestTransferRequest$json = {
  '1': 'SupportRequestTransferRequest',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'priority', '3': 3, '4': 1, '5': 5, '10': 'priority'},
  ],
};

/// Descriptor for `SupportRequestTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportRequestTransferRequestDescriptor = $convert.base64Decode(
    'Ch1TdXBwb3J0UmVxdWVzdFRyYW5zZmVyUmVxdWVzdBIdCgpzZXNzaW9uX2lkGAEgASgJUglzZX'
    'NzaW9uSWQSFgoGcmVhc29uGAIgASgJUgZyZWFzb24SGgoIcHJpb3JpdHkYAyABKAVSCHByaW9y'
    'aXR5');

@$core.Deprecated('Use supportRequestTransferResponseDescriptor instead')
const SupportRequestTransferResponse$json = {
  '1': 'SupportRequestTransferResponse',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {'1': 'queue_position', '3': 2, '4': 1, '5': 5, '10': 'queuePosition'},
    {'1': 'estimated_wait', '3': 3, '4': 1, '5': 9, '10': 'estimatedWait'},
    {'1': 'requested_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'requestedAt'},
  ],
};

/// Descriptor for `SupportRequestTransferResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportRequestTransferResponseDescriptor = $convert.base64Decode(
    'Ch5TdXBwb3J0UmVxdWVzdFRyYW5zZmVyUmVzcG9uc2USHwoLdHJhbnNmZXJfaWQYASABKAlSCn'
    'RyYW5zZmVySWQSJQoOcXVldWVfcG9zaXRpb24YAiABKAVSDXF1ZXVlUG9zaXRpb24SJQoOZXN0'
    'aW1hdGVkX3dhaXQYAyABKAlSDWVzdGltYXRlZFdhaXQSPQoMcmVxdWVzdGVkX2F0GAQgASgLMh'
    'ouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFILcmVxdWVzdGVkQXQ=');

@$core.Deprecated('Use supportAcceptTransferRequestDescriptor instead')
const SupportAcceptTransferRequest$json = {
  '1': 'SupportAcceptTransferRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {'1': 'operator_id', '3': 2, '4': 1, '5': 9, '10': 'operatorId'},
    {'1': 'operator_name', '3': 3, '4': 1, '5': 9, '10': 'operatorName'},
  ],
};

/// Descriptor for `SupportAcceptTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportAcceptTransferRequestDescriptor = $convert.base64Decode(
    'ChxTdXBwb3J0QWNjZXB0VHJhbnNmZXJSZXF1ZXN0Eh8KC3RyYW5zZmVyX2lkGAEgASgJUgp0cm'
    'Fuc2ZlcklkEh8KC29wZXJhdG9yX2lkGAIgASgJUgpvcGVyYXRvcklkEiMKDW9wZXJhdG9yX25h'
    'bWUYAyABKAlSDG9wZXJhdG9yTmFtZQ==');

@$core.Deprecated('Use supportAcceptTransferResponseDescriptor instead')
const SupportAcceptTransferResponse$json = {
  '1': 'SupportAcceptTransferResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'user_name', '3': 3, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'user_email', '3': 4, '4': 1, '5': 9, '10': 'userEmail'},
    {'1': 'history', '3': 5, '4': 3, '5': 11, '6': '.chat.SupportChatMessage', '10': 'history'},
    {'1': 'accepted_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'acceptedAt'},
  ],
};

/// Descriptor for `SupportAcceptTransferResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportAcceptTransferResponseDescriptor = $convert.base64Decode(
    'Ch1TdXBwb3J0QWNjZXB0VHJhbnNmZXJSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZX'
    'NzEh0KCnNlc3Npb25faWQYAiABKAlSCXNlc3Npb25JZBIbCgl1c2VyX25hbWUYAyABKAlSCHVz'
    'ZXJOYW1lEh0KCnVzZXJfZW1haWwYBCABKAlSCXVzZXJFbWFpbBIyCgdoaXN0b3J5GAUgAygLMh'
    'guY2hhdC5TdXBwb3J0Q2hhdE1lc3NhZ2VSB2hpc3RvcnkSOwoLYWNjZXB0ZWRfYXQYBiABKAsy'
    'Gi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgphY2NlcHRlZEF0');

@$core.Deprecated('Use supportEndSupportSessionRequestDescriptor instead')
const SupportEndSupportSessionRequest$json = {
  '1': 'SupportEndSupportSessionRequest',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'operator_id', '3': 2, '4': 1, '5': 9, '10': 'operatorId'},
    {'1': 'resolution', '3': 3, '4': 1, '5': 9, '10': 'resolution'},
    {'1': 'notes', '3': 4, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `SupportEndSupportSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportEndSupportSessionRequestDescriptor = $convert.base64Decode(
    'Ch9TdXBwb3J0RW5kU3VwcG9ydFNlc3Npb25SZXF1ZXN0Eh0KCnNlc3Npb25faWQYASABKAlSCX'
    'Nlc3Npb25JZBIfCgtvcGVyYXRvcl9pZBgCIAEoCVIKb3BlcmF0b3JJZBIeCgpyZXNvbHV0aW9u'
    'GAMgASgJUgpyZXNvbHV0aW9uEhQKBW5vdGVzGAQgASgJUgVub3Rlcw==');

@$core.Deprecated('Use supportEndSupportSessionResponseDescriptor instead')
const SupportEndSupportSessionResponse$json = {
  '1': 'SupportEndSupportSessionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'ended_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endedAt'},
    {'1': 'support_duration_seconds', '3': 3, '4': 1, '5': 5, '10': 'supportDurationSeconds'},
  ],
};

/// Descriptor for `SupportEndSupportSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportEndSupportSessionResponseDescriptor = $convert.base64Decode(
    'CiBTdXBwb3J0RW5kU3VwcG9ydFNlc3Npb25SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdW'
    'NjZXNzEjUKCGVuZGVkX2F0GAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZW5k'
    'ZWRBdBI4ChhzdXBwb3J0X2R1cmF0aW9uX3NlY29uZHMYAyABKAVSFnN1cHBvcnREdXJhdGlvbl'
    'NlY29uZHM=');

@$core.Deprecated('Use supportSendSupportMessageRequestDescriptor instead')
const SupportSendSupportMessageRequest$json = {
  '1': 'SupportSendSupportMessageRequest',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'sender_id', '3': 2, '4': 1, '5': 9, '10': 'senderId'},
    {'1': 'sender_type', '3': 3, '4': 1, '5': 9, '10': 'senderType'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `SupportSendSupportMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportSendSupportMessageRequestDescriptor = $convert.base64Decode(
    'CiBTdXBwb3J0U2VuZFN1cHBvcnRNZXNzYWdlUmVxdWVzdBIdCgpzZXNzaW9uX2lkGAEgASgJUg'
    'lzZXNzaW9uSWQSGwoJc2VuZGVyX2lkGAIgASgJUghzZW5kZXJJZBIfCgtzZW5kZXJfdHlwZRgD'
    'IAEoCVIKc2VuZGVyVHlwZRIYCgdtZXNzYWdlGAQgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use supportSendSupportMessageResponseDescriptor instead')
const SupportSendSupportMessageResponse$json = {
  '1': 'SupportSendSupportMessageResponse',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'timestamp', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
    {'1': 'delivered', '3': 3, '4': 1, '5': 8, '10': 'delivered'},
  ],
};

/// Descriptor for `SupportSendSupportMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportSendSupportMessageResponseDescriptor = $convert.base64Decode(
    'CiFTdXBwb3J0U2VuZFN1cHBvcnRNZXNzYWdlUmVzcG9uc2USHQoKbWVzc2FnZV9pZBgBIAEoCV'
    'IJbWVzc2FnZUlkEjgKCXRpbWVzdGFtcBgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3Rh'
    'bXBSCXRpbWVzdGFtcBIcCglkZWxpdmVyZWQYAyABKAhSCWRlbGl2ZXJlZA==');

@$core.Deprecated('Use supportStreamSupportMessagesRequestDescriptor instead')
const SupportStreamSupportMessagesRequest$json = {
  '1': 'SupportStreamSupportMessagesRequest',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'subscriber_id', '3': 2, '4': 1, '5': 9, '10': 'subscriberId'},
  ],
};

/// Descriptor for `SupportStreamSupportMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportStreamSupportMessagesRequestDescriptor = $convert.base64Decode(
    'CiNTdXBwb3J0U3RyZWFtU3VwcG9ydE1lc3NhZ2VzUmVxdWVzdBIdCgpzZXNzaW9uX2lkGAEgAS'
    'gJUglzZXNzaW9uSWQSIwoNc3Vic2NyaWJlcl9pZBgCIAEoCVIMc3Vic2NyaWJlcklk');

@$core.Deprecated('Use supportMessageDescriptor instead')
const SupportMessage$json = {
  '1': 'SupportMessage',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'sender_id', '3': 3, '4': 1, '5': 9, '10': 'senderId'},
    {'1': 'sender_type', '3': 4, '4': 1, '5': 9, '10': 'senderType'},
    {'1': 'sender_name', '3': 5, '4': 1, '5': 9, '10': 'senderName'},
    {'1': 'content', '3': 6, '4': 1, '5': 9, '10': 'content'},
    {'1': 'timestamp', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
    {'1': 'message_type', '3': 8, '4': 1, '5': 9, '10': 'messageType'},
  ],
};

/// Descriptor for `SupportMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportMessageDescriptor = $convert.base64Decode(
    'Cg5TdXBwb3J0TWVzc2FnZRIdCgptZXNzYWdlX2lkGAEgASgJUgltZXNzYWdlSWQSHQoKc2Vzc2'
    'lvbl9pZBgCIAEoCVIJc2Vzc2lvbklkEhsKCXNlbmRlcl9pZBgDIAEoCVIIc2VuZGVySWQSHwoL'
    'c2VuZGVyX3R5cGUYBCABKAlSCnNlbmRlclR5cGUSHwoLc2VuZGVyX25hbWUYBSABKAlSCnNlbm'
    'Rlck5hbWUSGAoHY29udGVudBgGIAEoCVIHY29udGVudBI4Cgl0aW1lc3RhbXAYByABKAsyGi5n'
    'b29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl0aW1lc3RhbXASIQoMbWVzc2FnZV90eXBlGAggAS'
    'gJUgttZXNzYWdlVHlwZQ==');

@$core.Deprecated('Use supportListPendingTransfersRequestDescriptor instead')
const SupportListPendingTransfersRequest$json = {
  '1': 'SupportListPendingTransfersRequest',
  '2': [
    {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 2, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `SupportListPendingTransfersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportListPendingTransfersRequestDescriptor = $convert.base64Decode(
    'CiJTdXBwb3J0TGlzdFBlbmRpbmdUcmFuc2ZlcnNSZXF1ZXN0EhQKBWxpbWl0GAEgASgFUgVsaW'
    '1pdBIWCgZvZmZzZXQYAiABKAVSBm9mZnNldA==');

@$core.Deprecated('Use supportListPendingTransfersResponseDescriptor instead')
const SupportListPendingTransfersResponse$json = {
  '1': 'SupportListPendingTransfersResponse',
  '2': [
    {'1': 'transfers', '3': 1, '4': 3, '5': 11, '6': '.chat.SupportTransferRequest', '10': 'transfers'},
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
  ],
};

/// Descriptor for `SupportListPendingTransfersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportListPendingTransfersResponseDescriptor = $convert.base64Decode(
    'CiNTdXBwb3J0TGlzdFBlbmRpbmdUcmFuc2ZlcnNSZXNwb25zZRI6Cgl0cmFuc2ZlcnMYASADKA'
    'syHC5jaGF0LlN1cHBvcnRUcmFuc2ZlclJlcXVlc3RSCXRyYW5zZmVycxIfCgt0b3RhbF9jb3Vu'
    'dBgCIAEoBVIKdG90YWxDb3VudA==');

@$core.Deprecated('Use supportTransferRequestDescriptor instead')
const SupportTransferRequest$json = {
  '1': 'SupportTransferRequest',
  '2': [
    {'1': 'transfer_id', '3': 1, '4': 1, '5': 9, '10': 'transferId'},
    {'1': 'session_id', '3': 2, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'user_name', '3': 3, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'user_email', '3': 4, '4': 1, '5': 9, '10': 'userEmail'},
    {'1': 'reason', '3': 5, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'priority', '3': 6, '4': 1, '5': 5, '10': 'priority'},
    {'1': 'requested_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'requestedAt'},
    {'1': 'wait_time_seconds', '3': 8, '4': 1, '5': 5, '10': 'waitTimeSeconds'},
    {'1': 'last_message', '3': 9, '4': 1, '5': 9, '10': 'lastMessage'},
  ],
};

/// Descriptor for `SupportTransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportTransferRequestDescriptor = $convert.base64Decode(
    'ChZTdXBwb3J0VHJhbnNmZXJSZXF1ZXN0Eh8KC3RyYW5zZmVyX2lkGAEgASgJUgp0cmFuc2Zlck'
    'lkEh0KCnNlc3Npb25faWQYAiABKAlSCXNlc3Npb25JZBIbCgl1c2VyX25hbWUYAyABKAlSCHVz'
    'ZXJOYW1lEh0KCnVzZXJfZW1haWwYBCABKAlSCXVzZXJFbWFpbBIWCgZyZWFzb24YBSABKAlSBn'
    'JlYXNvbhIaCghwcmlvcml0eRgGIAEoBVIIcHJpb3JpdHkSPQoMcmVxdWVzdGVkX2F0GAcgASgL'
    'MhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFILcmVxdWVzdGVkQXQSKgoRd2FpdF90aW1lX3'
    'NlY29uZHMYCCABKAVSD3dhaXRUaW1lU2Vjb25kcxIhCgxsYXN0X21lc3NhZ2UYCSABKAlSC2xh'
    'c3RNZXNzYWdl');

@$core.Deprecated('Use supportQueueStatusResponseDescriptor instead')
const SupportQueueStatusResponse$json = {
  '1': 'SupportQueueStatusResponse',
  '2': [
    {'1': 'pending_transfers', '3': 1, '4': 1, '5': 5, '10': 'pendingTransfers'},
    {'1': 'active_support_sessions', '3': 2, '4': 1, '5': 5, '10': 'activeSupportSessions'},
    {'1': 'available_operators', '3': 3, '4': 1, '5': 5, '10': 'availableOperators'},
    {'1': 'average_wait_time_seconds', '3': 4, '4': 1, '5': 2, '10': 'averageWaitTimeSeconds'},
  ],
};

/// Descriptor for `SupportQueueStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportQueueStatusResponseDescriptor = $convert.base64Decode(
    'ChpTdXBwb3J0UXVldWVTdGF0dXNSZXNwb25zZRIrChFwZW5kaW5nX3RyYW5zZmVycxgBIAEoBV'
    'IQcGVuZGluZ1RyYW5zZmVycxI2ChdhY3RpdmVfc3VwcG9ydF9zZXNzaW9ucxgCIAEoBVIVYWN0'
    'aXZlU3VwcG9ydFNlc3Npb25zEi8KE2F2YWlsYWJsZV9vcGVyYXRvcnMYAyABKAVSEmF2YWlsYW'
    'JsZU9wZXJhdG9ycxI5ChlhdmVyYWdlX3dhaXRfdGltZV9zZWNvbmRzGAQgASgCUhZhdmVyYWdl'
    'V2FpdFRpbWVTZWNvbmRz');

@$core.Deprecated('Use supportChatMessageDescriptor instead')
const SupportChatMessage$json = {
  '1': 'SupportChatMessage',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'role', '3': 2, '4': 1, '5': 9, '10': 'role'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    {'1': 'timestamp', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
    {'1': 'model_used', '3': 5, '4': 1, '5': 9, '10': 'modelUsed'},
    {'1': 'tokens_used', '3': 6, '4': 1, '5': 5, '10': 'tokensUsed'},
  ],
};

/// Descriptor for `SupportChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supportChatMessageDescriptor = $convert.base64Decode(
    'ChJTdXBwb3J0Q2hhdE1lc3NhZ2USHQoKbWVzc2FnZV9pZBgBIAEoCVIJbWVzc2FnZUlkEhIKBH'
    'JvbGUYAiABKAlSBHJvbGUSGAoHY29udGVudBgDIAEoCVIHY29udGVudBI4Cgl0aW1lc3RhbXAY'
    'BCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl0aW1lc3RhbXASHQoKbW9kZWxfdX'
    'NlZBgFIAEoCVIJbW9kZWxVc2VkEh8KC3Rva2Vuc191c2VkGAYgASgFUgp0b2tlbnNVc2Vk');

