//
//  Generated code. Do not modify.
//  source: rag/rag_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'rag_service.pb.dart' as $0;

export 'rag_service.pb.dart';

@$pb.GrpcServiceName('chat.RAGService')
class RAGServiceClient extends $grpc.Client {
  static final _$addDocument = $grpc.ClientMethod<$0.RagAddDocumentRequest, $0.RagAddDocumentResponse>(
      '/chat.RAGService/AddDocument',
      ($0.RagAddDocumentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RagAddDocumentResponse.fromBuffer(value));
  static final _$addDocumentsBatch = $grpc.ClientMethod<$0.RagAddDocumentsBatchRequest, $0.RagAddDocumentsBatchResponse>(
      '/chat.RAGService/AddDocumentsBatch',
      ($0.RagAddDocumentsBatchRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RagAddDocumentsBatchResponse.fromBuffer(value));
  static final _$uploadFilesBatch = $grpc.ClientMethod<$0.RagUploadFilesBatchRequest, $0.RagUploadFileProgress>(
      '/chat.RAGService/UploadFilesBatch',
      ($0.RagUploadFilesBatchRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RagUploadFileProgress.fromBuffer(value));
  static final _$deleteDocument = $grpc.ClientMethod<$0.RagDeleteDocumentRequest, $0.RagDeleteDocumentResponse>(
      '/chat.RAGService/DeleteDocument',
      ($0.RagDeleteDocumentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RagDeleteDocumentResponse.fromBuffer(value));
  static final _$deleteDocumentsBatch = $grpc.ClientMethod<$0.RagDeleteDocumentsBatchRequest, $0.RagDeleteDocumentsBatchResponse>(
      '/chat.RAGService/DeleteDocumentsBatch',
      ($0.RagDeleteDocumentsBatchRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RagDeleteDocumentsBatchResponse.fromBuffer(value));
  static final _$listDocuments = $grpc.ClientMethod<$0.RagListDocumentsRequest, $0.RagListDocumentsResponse>(
      '/chat.RAGService/ListDocuments',
      ($0.RagListDocumentsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RagListDocumentsResponse.fromBuffer(value));
  static final _$getDocument = $grpc.ClientMethod<$0.RagGetDocumentRequest, $0.RagDocumentInfo>(
      '/chat.RAGService/GetDocument',
      ($0.RagGetDocumentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RagDocumentInfo.fromBuffer(value));
  static final _$searchDocuments = $grpc.ClientMethod<$0.RagSearchDocumentsRequest, $0.RagSearchDocumentsResponse>(
      '/chat.RAGService/SearchDocuments',
      ($0.RagSearchDocumentsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RagSearchDocumentsResponse.fromBuffer(value));
  static final _$addEmbeddingDocument = $grpc.ClientMethod<$0.RagAddEmbeddingDocumentRequest, $0.RagAddEmbeddingDocumentResponse>(
      '/chat.RAGService/AddEmbeddingDocument',
      ($0.RagAddEmbeddingDocumentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RagAddEmbeddingDocumentResponse.fromBuffer(value));
  static final _$deleteEmbeddingDocument = $grpc.ClientMethod<$0.RagDeleteEmbeddingDocumentRequest, $0.RagDeleteEmbeddingDocumentResponse>(
      '/chat.RAGService/DeleteEmbeddingDocument',
      ($0.RagDeleteEmbeddingDocumentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RagDeleteEmbeddingDocumentResponse.fromBuffer(value));
  static final _$searchEmbeddingDocuments = $grpc.ClientMethod<$0.RagSearchEmbeddingDocumentsRequest, $0.RagSearchEmbeddingDocumentsResponse>(
      '/chat.RAGService/SearchEmbeddingDocuments',
      ($0.RagSearchEmbeddingDocumentsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RagSearchEmbeddingDocumentsResponse.fromBuffer(value));

  RAGServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.RagAddDocumentResponse> addDocument($0.RagAddDocumentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addDocument, request, options: options);
  }

  $grpc.ResponseFuture<$0.RagAddDocumentsBatchResponse> addDocumentsBatch($0.RagAddDocumentsBatchRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addDocumentsBatch, request, options: options);
  }

  $grpc.ResponseStream<$0.RagUploadFileProgress> uploadFilesBatch($0.RagUploadFilesBatchRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$uploadFilesBatch, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.RagDeleteDocumentResponse> deleteDocument($0.RagDeleteDocumentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteDocument, request, options: options);
  }

  $grpc.ResponseFuture<$0.RagDeleteDocumentsBatchResponse> deleteDocumentsBatch($0.RagDeleteDocumentsBatchRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteDocumentsBatch, request, options: options);
  }

  $grpc.ResponseFuture<$0.RagListDocumentsResponse> listDocuments($0.RagListDocumentsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listDocuments, request, options: options);
  }

  $grpc.ResponseFuture<$0.RagDocumentInfo> getDocument($0.RagGetDocumentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDocument, request, options: options);
  }

  $grpc.ResponseFuture<$0.RagSearchDocumentsResponse> searchDocuments($0.RagSearchDocumentsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$searchDocuments, request, options: options);
  }

  $grpc.ResponseFuture<$0.RagAddEmbeddingDocumentResponse> addEmbeddingDocument($0.RagAddEmbeddingDocumentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addEmbeddingDocument, request, options: options);
  }

  $grpc.ResponseFuture<$0.RagDeleteEmbeddingDocumentResponse> deleteEmbeddingDocument($0.RagDeleteEmbeddingDocumentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteEmbeddingDocument, request, options: options);
  }

  $grpc.ResponseFuture<$0.RagSearchEmbeddingDocumentsResponse> searchEmbeddingDocuments($0.RagSearchEmbeddingDocumentsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$searchEmbeddingDocuments, request, options: options);
  }
}

@$pb.GrpcServiceName('chat.RAGService')
abstract class RAGServiceBase extends $grpc.Service {
  $core.String get $name => 'chat.RAGService';

  RAGServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RagAddDocumentRequest, $0.RagAddDocumentResponse>(
        'AddDocument',
        addDocument_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RagAddDocumentRequest.fromBuffer(value),
        ($0.RagAddDocumentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RagAddDocumentsBatchRequest, $0.RagAddDocumentsBatchResponse>(
        'AddDocumentsBatch',
        addDocumentsBatch_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RagAddDocumentsBatchRequest.fromBuffer(value),
        ($0.RagAddDocumentsBatchResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RagUploadFilesBatchRequest, $0.RagUploadFileProgress>(
        'UploadFilesBatch',
        uploadFilesBatch_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.RagUploadFilesBatchRequest.fromBuffer(value),
        ($0.RagUploadFileProgress value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RagDeleteDocumentRequest, $0.RagDeleteDocumentResponse>(
        'DeleteDocument',
        deleteDocument_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RagDeleteDocumentRequest.fromBuffer(value),
        ($0.RagDeleteDocumentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RagDeleteDocumentsBatchRequest, $0.RagDeleteDocumentsBatchResponse>(
        'DeleteDocumentsBatch',
        deleteDocumentsBatch_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RagDeleteDocumentsBatchRequest.fromBuffer(value),
        ($0.RagDeleteDocumentsBatchResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RagListDocumentsRequest, $0.RagListDocumentsResponse>(
        'ListDocuments',
        listDocuments_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RagListDocumentsRequest.fromBuffer(value),
        ($0.RagListDocumentsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RagGetDocumentRequest, $0.RagDocumentInfo>(
        'GetDocument',
        getDocument_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RagGetDocumentRequest.fromBuffer(value),
        ($0.RagDocumentInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RagSearchDocumentsRequest, $0.RagSearchDocumentsResponse>(
        'SearchDocuments',
        searchDocuments_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RagSearchDocumentsRequest.fromBuffer(value),
        ($0.RagSearchDocumentsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RagAddEmbeddingDocumentRequest, $0.RagAddEmbeddingDocumentResponse>(
        'AddEmbeddingDocument',
        addEmbeddingDocument_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RagAddEmbeddingDocumentRequest.fromBuffer(value),
        ($0.RagAddEmbeddingDocumentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RagDeleteEmbeddingDocumentRequest, $0.RagDeleteEmbeddingDocumentResponse>(
        'DeleteEmbeddingDocument',
        deleteEmbeddingDocument_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RagDeleteEmbeddingDocumentRequest.fromBuffer(value),
        ($0.RagDeleteEmbeddingDocumentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RagSearchEmbeddingDocumentsRequest, $0.RagSearchEmbeddingDocumentsResponse>(
        'SearchEmbeddingDocuments',
        searchEmbeddingDocuments_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RagSearchEmbeddingDocumentsRequest.fromBuffer(value),
        ($0.RagSearchEmbeddingDocumentsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.RagAddDocumentResponse> addDocument_Pre($grpc.ServiceCall call, $async.Future<$0.RagAddDocumentRequest> request) async {
    return addDocument(call, await request);
  }

  $async.Future<$0.RagAddDocumentsBatchResponse> addDocumentsBatch_Pre($grpc.ServiceCall call, $async.Future<$0.RagAddDocumentsBatchRequest> request) async {
    return addDocumentsBatch(call, await request);
  }

  $async.Stream<$0.RagUploadFileProgress> uploadFilesBatch_Pre($grpc.ServiceCall call, $async.Future<$0.RagUploadFilesBatchRequest> request) async* {
    yield* uploadFilesBatch(call, await request);
  }

  $async.Future<$0.RagDeleteDocumentResponse> deleteDocument_Pre($grpc.ServiceCall call, $async.Future<$0.RagDeleteDocumentRequest> request) async {
    return deleteDocument(call, await request);
  }

  $async.Future<$0.RagDeleteDocumentsBatchResponse> deleteDocumentsBatch_Pre($grpc.ServiceCall call, $async.Future<$0.RagDeleteDocumentsBatchRequest> request) async {
    return deleteDocumentsBatch(call, await request);
  }

  $async.Future<$0.RagListDocumentsResponse> listDocuments_Pre($grpc.ServiceCall call, $async.Future<$0.RagListDocumentsRequest> request) async {
    return listDocuments(call, await request);
  }

  $async.Future<$0.RagDocumentInfo> getDocument_Pre($grpc.ServiceCall call, $async.Future<$0.RagGetDocumentRequest> request) async {
    return getDocument(call, await request);
  }

  $async.Future<$0.RagSearchDocumentsResponse> searchDocuments_Pre($grpc.ServiceCall call, $async.Future<$0.RagSearchDocumentsRequest> request) async {
    return searchDocuments(call, await request);
  }

  $async.Future<$0.RagAddEmbeddingDocumentResponse> addEmbeddingDocument_Pre($grpc.ServiceCall call, $async.Future<$0.RagAddEmbeddingDocumentRequest> request) async {
    return addEmbeddingDocument(call, await request);
  }

  $async.Future<$0.RagDeleteEmbeddingDocumentResponse> deleteEmbeddingDocument_Pre($grpc.ServiceCall call, $async.Future<$0.RagDeleteEmbeddingDocumentRequest> request) async {
    return deleteEmbeddingDocument(call, await request);
  }

  $async.Future<$0.RagSearchEmbeddingDocumentsResponse> searchEmbeddingDocuments_Pre($grpc.ServiceCall call, $async.Future<$0.RagSearchEmbeddingDocumentsRequest> request) async {
    return searchEmbeddingDocuments(call, await request);
  }

  $async.Future<$0.RagAddDocumentResponse> addDocument($grpc.ServiceCall call, $0.RagAddDocumentRequest request);
  $async.Future<$0.RagAddDocumentsBatchResponse> addDocumentsBatch($grpc.ServiceCall call, $0.RagAddDocumentsBatchRequest request);
  $async.Stream<$0.RagUploadFileProgress> uploadFilesBatch($grpc.ServiceCall call, $0.RagUploadFilesBatchRequest request);
  $async.Future<$0.RagDeleteDocumentResponse> deleteDocument($grpc.ServiceCall call, $0.RagDeleteDocumentRequest request);
  $async.Future<$0.RagDeleteDocumentsBatchResponse> deleteDocumentsBatch($grpc.ServiceCall call, $0.RagDeleteDocumentsBatchRequest request);
  $async.Future<$0.RagListDocumentsResponse> listDocuments($grpc.ServiceCall call, $0.RagListDocumentsRequest request);
  $async.Future<$0.RagDocumentInfo> getDocument($grpc.ServiceCall call, $0.RagGetDocumentRequest request);
  $async.Future<$0.RagSearchDocumentsResponse> searchDocuments($grpc.ServiceCall call, $0.RagSearchDocumentsRequest request);
  $async.Future<$0.RagAddEmbeddingDocumentResponse> addEmbeddingDocument($grpc.ServiceCall call, $0.RagAddEmbeddingDocumentRequest request);
  $async.Future<$0.RagDeleteEmbeddingDocumentResponse> deleteEmbeddingDocument($grpc.ServiceCall call, $0.RagDeleteEmbeddingDocumentRequest request);
  $async.Future<$0.RagSearchEmbeddingDocumentsResponse> searchEmbeddingDocuments($grpc.ServiceCall call, $0.RagSearchEmbeddingDocumentsRequest request);
}
