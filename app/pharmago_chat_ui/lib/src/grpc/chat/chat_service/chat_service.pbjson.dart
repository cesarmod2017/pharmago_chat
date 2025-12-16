//
//  Generated code. Do not modify.
//  source: chat/chat_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chatCreateSessionRequestDescriptor instead')
const ChatCreateSessionRequest$json = {
  '1': 'ChatCreateSessionRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'client', '3': 3, '4': 1, '5': 9, '10': 'client'},
    {'1': 'agent_name', '3': 4, '4': 1, '5': 9, '10': 'agentName'},
    {'1': 'erp_name', '3': 5, '4': 1, '5': 9, '10': 'erpName'},
    {'1': 'language', '3': 6, '4': 1, '5': 9, '10': 'language'},
    {'1': 'type', '3': 7, '4': 1, '5': 9, '10': 'type'},
    {'1': 'metadata', '3': 8, '4': 3, '5': 11, '6': '.chat.ChatCreateSessionRequest.MetadataEntry', '10': 'metadata'},
  ],
  '3': [ChatCreateSessionRequest_MetadataEntry$json],
};

@$core.Deprecated('Use chatCreateSessionRequestDescriptor instead')
const ChatCreateSessionRequest_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ChatCreateSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatCreateSessionRequestDescriptor = $convert.base64Decode(
    'ChhDaGF0Q3JlYXRlU2Vzc2lvblJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVlbWFpbB'
    'gCIAEoCVIFZW1haWwSFgoGY2xpZW50GAMgASgJUgZjbGllbnQSHQoKYWdlbnRfbmFtZRgEIAEo'
    'CVIJYWdlbnROYW1lEhkKCGVycF9uYW1lGAUgASgJUgdlcnBOYW1lEhoKCGxhbmd1YWdlGAYgAS'
    'gJUghsYW5ndWFnZRISCgR0eXBlGAcgASgJUgR0eXBlEkgKCG1ldGFkYXRhGAggAygLMiwuY2hh'
    'dC5DaGF0Q3JlYXRlU2Vzc2lvblJlcXVlc3QuTWV0YWRhdGFFbnRyeVIIbWV0YWRhdGEaOwoNTW'
    'V0YWRhdGFFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use chatCreateSessionResponseDescriptor instead')
const ChatCreateSessionResponse$json = {
  '1': 'ChatCreateSessionResponse',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'created_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'welcome_message', '3': 3, '4': 1, '5': 9, '10': 'welcomeMessage'},
  ],
};

/// Descriptor for `ChatCreateSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatCreateSessionResponseDescriptor = $convert.base64Decode(
    'ChlDaGF0Q3JlYXRlU2Vzc2lvblJlc3BvbnNlEh0KCnNlc3Npb25faWQYASABKAlSCXNlc3Npb2'
    '5JZBI5CgpjcmVhdGVkX2F0GAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3Jl'
    'YXRlZEF0EicKD3dlbGNvbWVfbWVzc2FnZRgDIAEoCVIOd2VsY29tZU1lc3NhZ2U=');

@$core.Deprecated('Use chatSendMessageRequestDescriptor instead')
const ChatSendMessageRequest$json = {
  '1': 'ChatSendMessageRequest',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'use_streaming', '3': 3, '4': 1, '5': 8, '10': 'useStreaming'},
    {'1': 'preferred_model', '3': 4, '4': 1, '5': 9, '10': 'preferredModel'},
  ],
};

/// Descriptor for `ChatSendMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatSendMessageRequestDescriptor = $convert.base64Decode(
    'ChZDaGF0U2VuZE1lc3NhZ2VSZXF1ZXN0Eh0KCnNlc3Npb25faWQYASABKAlSCXNlc3Npb25JZB'
    'IYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdlEiMKDXVzZV9zdHJlYW1pbmcYAyABKAhSDHVzZVN0'
    'cmVhbWluZxInCg9wcmVmZXJyZWRfbW9kZWwYBCABKAlSDnByZWZlcnJlZE1vZGVs');

@$core.Deprecated('Use chatSendMessageResponseDescriptor instead')
const ChatSendMessageResponse$json = {
  '1': 'ChatSendMessageResponse',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'response', '3': 2, '4': 1, '5': 9, '10': 'response'},
    {'1': 'model_used', '3': 3, '4': 1, '5': 9, '10': 'modelUsed'},
    {'1': 'tokens_used', '3': 4, '4': 1, '5': 5, '10': 'tokensUsed'},
    {'1': 'timestamp', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
    {'1': 'sources', '3': 6, '4': 3, '5': 9, '10': 'sources'},
  ],
};

/// Descriptor for `ChatSendMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatSendMessageResponseDescriptor = $convert.base64Decode(
    'ChdDaGF0U2VuZE1lc3NhZ2VSZXNwb25zZRIdCgptZXNzYWdlX2lkGAEgASgJUgltZXNzYWdlSW'
    'QSGgoIcmVzcG9uc2UYAiABKAlSCHJlc3BvbnNlEh0KCm1vZGVsX3VzZWQYAyABKAlSCW1vZGVs'
    'VXNlZBIfCgt0b2tlbnNfdXNlZBgEIAEoBVIKdG9rZW5zVXNlZBI4Cgl0aW1lc3RhbXAYBSABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl0aW1lc3RhbXASGAoHc291cmNlcxgGIAMo'
    'CVIHc291cmNlcw==');

@$core.Deprecated('Use chatMessageChunkDescriptor instead')
const ChatMessageChunk$json = {
  '1': 'ChatMessageChunk',
  '2': [
    {'1': 'chunk_id', '3': 1, '4': 1, '5': 9, '10': 'chunkId'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
    {'1': 'is_final', '3': 3, '4': 1, '5': 8, '10': 'isFinal'},
    {'1': 'model_used', '3': 4, '4': 1, '5': 9, '10': 'modelUsed'},
    {'1': 'tokens_used', '3': 5, '4': 1, '5': 5, '10': 'tokensUsed'},
    {'1': 'sources', '3': 6, '4': 3, '5': 9, '10': 'sources'},
  ],
};

/// Descriptor for `ChatMessageChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageChunkDescriptor = $convert.base64Decode(
    'ChBDaGF0TWVzc2FnZUNodW5rEhkKCGNodW5rX2lkGAEgASgJUgdjaHVua0lkEhgKB2NvbnRlbn'
    'QYAiABKAlSB2NvbnRlbnQSGQoIaXNfZmluYWwYAyABKAhSB2lzRmluYWwSHQoKbW9kZWxfdXNl'
    'ZBgEIAEoCVIJbW9kZWxVc2VkEh8KC3Rva2Vuc191c2VkGAUgASgFUgp0b2tlbnNVc2VkEhgKB3'
    'NvdXJjZXMYBiADKAlSB3NvdXJjZXM=');

@$core.Deprecated('Use chatGetHistoryRequestDescriptor instead')
const ChatGetHistoryRequest$json = {
  '1': 'ChatGetHistoryRequest',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 3, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `ChatGetHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatGetHistoryRequestDescriptor = $convert.base64Decode(
    'ChVDaGF0R2V0SGlzdG9yeVJlcXVlc3QSHQoKc2Vzc2lvbl9pZBgBIAEoCVIJc2Vzc2lvbklkEh'
    'QKBWxpbWl0GAIgASgFUgVsaW1pdBIWCgZvZmZzZXQYAyABKAVSBm9mZnNldA==');

@$core.Deprecated('Use chatGetHistoryResponseDescriptor instead')
const ChatGetHistoryResponse$json = {
  '1': 'ChatGetHistoryResponse',
  '2': [
    {'1': 'messages', '3': 1, '4': 3, '5': 11, '6': '.chat.ChatMessage', '10': 'messages'},
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
  ],
};

/// Descriptor for `ChatGetHistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatGetHistoryResponseDescriptor = $convert.base64Decode(
    'ChZDaGF0R2V0SGlzdG9yeVJlc3BvbnNlEi0KCG1lc3NhZ2VzGAEgAygLMhEuY2hhdC5DaGF0TW'
    'Vzc2FnZVIIbWVzc2FnZXMSHwoLdG90YWxfY291bnQYAiABKAVSCnRvdGFsQ291bnQ=');

@$core.Deprecated('Use chatMessageDescriptor instead')
const ChatMessage$json = {
  '1': 'ChatMessage',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'role', '3': 2, '4': 1, '5': 9, '10': 'role'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    {'1': 'timestamp', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
    {'1': 'model_used', '3': 5, '4': 1, '5': 9, '10': 'modelUsed'},
    {'1': 'tokens_used', '3': 6, '4': 1, '5': 5, '10': 'tokensUsed'},
  ],
};

/// Descriptor for `ChatMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatMessageDescriptor = $convert.base64Decode(
    'CgtDaGF0TWVzc2FnZRIdCgptZXNzYWdlX2lkGAEgASgJUgltZXNzYWdlSWQSEgoEcm9sZRgCIA'
    'EoCVIEcm9sZRIYCgdjb250ZW50GAMgASgJUgdjb250ZW50EjgKCXRpbWVzdGFtcBgEIAEoCzIa'
    'Lmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXRpbWVzdGFtcBIdCgptb2RlbF91c2VkGAUgAS'
    'gJUgltb2RlbFVzZWQSHwoLdG9rZW5zX3VzZWQYBiABKAVSCnRva2Vuc1VzZWQ=');

@$core.Deprecated('Use chatEndSessionRequestDescriptor instead')
const ChatEndSessionRequest$json = {
  '1': 'ChatEndSessionRequest',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
  ],
};

/// Descriptor for `ChatEndSessionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatEndSessionRequestDescriptor = $convert.base64Decode(
    'ChVDaGF0RW5kU2Vzc2lvblJlcXVlc3QSHQoKc2Vzc2lvbl9pZBgBIAEoCVIJc2Vzc2lvbklkEh'
    'YKBnJlYXNvbhgCIAEoCVIGcmVhc29u');

@$core.Deprecated('Use chatEndSessionResponseDescriptor instead')
const ChatEndSessionResponse$json = {
  '1': 'ChatEndSessionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'ended_at', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'endedAt'},
    {'1': 'total_messages', '3': 3, '4': 1, '5': 5, '10': 'totalMessages'},
    {'1': 'total_tokens', '3': 4, '4': 1, '5': 5, '10': 'totalTokens'},
  ],
};

/// Descriptor for `ChatEndSessionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatEndSessionResponseDescriptor = $convert.base64Decode(
    'ChZDaGF0RW5kU2Vzc2lvblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSNQoIZW'
    '5kZWRfYXQYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgdlbmRlZEF0EiUKDnRv'
    'dGFsX21lc3NhZ2VzGAMgASgFUg10b3RhbE1lc3NhZ2VzEiEKDHRvdGFsX3Rva2VucxgEIAEoBV'
    'ILdG90YWxUb2tlbnM=');

@$core.Deprecated('Use chatGetSessionInfoRequestDescriptor instead')
const ChatGetSessionInfoRequest$json = {
  '1': 'ChatGetSessionInfoRequest',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

/// Descriptor for `ChatGetSessionInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatGetSessionInfoRequestDescriptor = $convert.base64Decode(
    'ChlDaGF0R2V0U2Vzc2lvbkluZm9SZXF1ZXN0Eh0KCnNlc3Npb25faWQYASABKAlSCXNlc3Npb2'
    '5JZA==');

@$core.Deprecated('Use chatSessionInfoDescriptor instead')
const ChatSessionInfo$json = {
  '1': 'ChatSessionInfo',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 9, '10': 'sessionId'},
    {'1': 'user_name', '3': 2, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'user_email', '3': 3, '4': 1, '5': 9, '10': 'userEmail'},
    {'1': 'status', '3': 4, '4': 1, '5': 9, '10': 'status'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'last_activity', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastActivity'},
    {'1': 'message_count', '3': 7, '4': 1, '5': 5, '10': 'messageCount'},
    {'1': 'total_tokens', '3': 8, '4': 1, '5': 5, '10': 'totalTokens'},
    {'1': 'current_operator_id', '3': 9, '4': 1, '5': 9, '10': 'currentOperatorId'},
    {'1': 'client', '3': 10, '4': 1, '5': 9, '10': 'client'},
    {'1': 'agent_name', '3': 11, '4': 1, '5': 9, '10': 'agentName'},
    {'1': 'erp_name', '3': 12, '4': 1, '5': 9, '10': 'erpName'},
    {'1': 'language', '3': 13, '4': 1, '5': 9, '10': 'language'},
    {'1': 'type', '3': 14, '4': 1, '5': 9, '10': 'type'},
    {'1': 'metadata', '3': 15, '4': 3, '5': 11, '6': '.chat.ChatSessionInfo.MetadataEntry', '10': 'metadata'},
  ],
  '3': [ChatSessionInfo_MetadataEntry$json],
};

@$core.Deprecated('Use chatSessionInfoDescriptor instead')
const ChatSessionInfo_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `ChatSessionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatSessionInfoDescriptor = $convert.base64Decode(
    'Cg9DaGF0U2Vzc2lvbkluZm8SHQoKc2Vzc2lvbl9pZBgBIAEoCVIJc2Vzc2lvbklkEhsKCXVzZX'
    'JfbmFtZRgCIAEoCVIIdXNlck5hbWUSHQoKdXNlcl9lbWFpbBgDIAEoCVIJdXNlckVtYWlsEhYK'
    'BnN0YXR1cxgEIAEoCVIGc3RhdHVzEjkKCmNyZWF0ZWRfYXQYBSABKAsyGi5nb29nbGUucHJvdG'
    '9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSPwoNbGFzdF9hY3Rpdml0eRgGIAEoCzIaLmdvb2ds'
    'ZS5wcm90b2J1Zi5UaW1lc3RhbXBSDGxhc3RBY3Rpdml0eRIjCg1tZXNzYWdlX2NvdW50GAcgAS'
    'gFUgxtZXNzYWdlQ291bnQSIQoMdG90YWxfdG9rZW5zGAggASgFUgt0b3RhbFRva2VucxIuChNj'
    'dXJyZW50X29wZXJhdG9yX2lkGAkgASgJUhFjdXJyZW50T3BlcmF0b3JJZBIWCgZjbGllbnQYCi'
    'ABKAlSBmNsaWVudBIdCgphZ2VudF9uYW1lGAsgASgJUglhZ2VudE5hbWUSGQoIZXJwX25hbWUY'
    'DCABKAlSB2VycE5hbWUSGgoIbGFuZ3VhZ2UYDSABKAlSCGxhbmd1YWdlEhIKBHR5cGUYDiABKA'
    'lSBHR5cGUSPwoIbWV0YWRhdGEYDyADKAsyIy5jaGF0LkNoYXRTZXNzaW9uSW5mby5NZXRhZGF0'
    'YUVudHJ5UghtZXRhZGF0YRo7Cg1NZXRhZGF0YUVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBX'
    'ZhbHVlGAIgASgJUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use chatListActiveSessionsRequestDescriptor instead')
const ChatListActiveSessionsRequest$json = {
  '1': 'ChatListActiveSessionsRequest',
  '2': [
    {'1': 'limit', '3': 1, '4': 1, '5': 5, '10': 'limit'},
    {'1': 'offset', '3': 2, '4': 1, '5': 5, '10': 'offset'},
    {'1': 'status_filter', '3': 3, '4': 1, '5': 9, '10': 'statusFilter'},
  ],
};

/// Descriptor for `ChatListActiveSessionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatListActiveSessionsRequestDescriptor = $convert.base64Decode(
    'Ch1DaGF0TGlzdEFjdGl2ZVNlc3Npb25zUmVxdWVzdBIUCgVsaW1pdBgBIAEoBVIFbGltaXQSFg'
    'oGb2Zmc2V0GAIgASgFUgZvZmZzZXQSIwoNc3RhdHVzX2ZpbHRlchgDIAEoCVIMc3RhdHVzRmls'
    'dGVy');

@$core.Deprecated('Use chatListActiveSessionsResponseDescriptor instead')
const ChatListActiveSessionsResponse$json = {
  '1': 'ChatListActiveSessionsResponse',
  '2': [
    {'1': 'sessions', '3': 1, '4': 3, '5': 11, '6': '.chat.ChatSessionInfo', '10': 'sessions'},
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
  ],
};

/// Descriptor for `ChatListActiveSessionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatListActiveSessionsResponseDescriptor = $convert.base64Decode(
    'Ch5DaGF0TGlzdEFjdGl2ZVNlc3Npb25zUmVzcG9uc2USMQoIc2Vzc2lvbnMYASADKAsyFS5jaG'
    'F0LkNoYXRTZXNzaW9uSW5mb1IIc2Vzc2lvbnMSHwoLdG90YWxfY291bnQYAiABKAVSCnRvdGFs'
    'Q291bnQ=');

@$core.Deprecated('Use chatGetHistoryByEmailRequestDescriptor instead')
const ChatGetHistoryByEmailRequest$json = {
  '1': 'ChatGetHistoryByEmailRequest',
  '2': [
    {'1': 'user_email', '3': 1, '4': 1, '5': 9, '10': 'userEmail'},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '10': 'limit'},
  ],
};

/// Descriptor for `ChatGetHistoryByEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatGetHistoryByEmailRequestDescriptor = $convert.base64Decode(
    'ChxDaGF0R2V0SGlzdG9yeUJ5RW1haWxSZXF1ZXN0Eh0KCnVzZXJfZW1haWwYASABKAlSCXVzZX'
    'JFbWFpbBIUCgVsaW1pdBgCIAEoBVIFbGltaXQ=');

@$core.Deprecated('Use chatGetHistoryByEmailResponseDescriptor instead')
const ChatGetHistoryByEmailResponse$json = {
  '1': 'ChatGetHistoryByEmailResponse',
  '2': [
    {'1': 'messages', '3': 1, '4': 3, '5': 11, '6': '.chat.ChatHistoryMessage', '10': 'messages'},
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
  ],
};

/// Descriptor for `ChatGetHistoryByEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatGetHistoryByEmailResponseDescriptor = $convert.base64Decode(
    'Ch1DaGF0R2V0SGlzdG9yeUJ5RW1haWxSZXNwb25zZRI0CghtZXNzYWdlcxgBIAMoCzIYLmNoYX'
    'QuQ2hhdEhpc3RvcnlNZXNzYWdlUghtZXNzYWdlcxIfCgt0b3RhbF9jb3VudBgCIAEoBVIKdG90'
    'YWxDb3VudA==');

@$core.Deprecated('Use chatHistoryMessageDescriptor instead')
const ChatHistoryMessage$json = {
  '1': 'ChatHistoryMessage',
  '2': [
    {'1': 'message_id', '3': 1, '4': 1, '5': 9, '10': 'messageId'},
    {'1': 'role', '3': 2, '4': 1, '5': 9, '10': 'role'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
    {'1': 'timestamp', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
    {'1': 'model_used', '3': 5, '4': 1, '5': 9, '10': 'modelUsed'},
    {'1': 'tokens_used', '3': 6, '4': 1, '5': 5, '10': 'tokensUsed'},
    {'1': 'session_id', '3': 7, '4': 1, '5': 9, '10': 'sessionId'},
  ],
};

/// Descriptor for `ChatHistoryMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatHistoryMessageDescriptor = $convert.base64Decode(
    'ChJDaGF0SGlzdG9yeU1lc3NhZ2USHQoKbWVzc2FnZV9pZBgBIAEoCVIJbWVzc2FnZUlkEhIKBH'
    'JvbGUYAiABKAlSBHJvbGUSGAoHY29udGVudBgDIAEoCVIHY29udGVudBI4Cgl0aW1lc3RhbXAY'
    'BCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl0aW1lc3RhbXASHQoKbW9kZWxfdX'
    'NlZBgFIAEoCVIJbW9kZWxVc2VkEh8KC3Rva2Vuc191c2VkGAYgASgFUgp0b2tlbnNVc2VkEh0K'
    'CnNlc3Npb25faWQYByABKAlSCXNlc3Npb25JZA==');

