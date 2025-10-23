import 'dart:io';
import 'package:dio/dio.dart';

class MyDioException {
  final int? statusCode;
  final  String message;

  MyDioException({required this.statusCode, required this.message});
}

MyDioException handleDioError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.cancel:
      return MyDioException(
        message: "Request to API server was cancelled",
        statusCode: 499,
      );
    case DioExceptionType.connectionTimeout:
      return MyDioException(
        message: "Connection timeout with API server",
        statusCode: 408,
      );
    case DioExceptionType.receiveTimeout:
      return MyDioException(
          message: "Receive timeout in connection with API server",
          statusCode: 408);
    case DioExceptionType.sendTimeout:
      return MyDioException(
          message: "Send timeout in connection with API server",
          statusCode: 504);
    case DioExceptionType.badCertificate:
      return MyDioException(
        statusCode: 495,
        message: "SSL certificate error",
      );
    case DioExceptionType.connectionError:
      return MyDioException(
        statusCode: 503,
        message: "Connection error",
      );
    case DioExceptionType.unknown:
      return MyDioException(
        message: "Bad Request",
        statusCode: 400,
      );
    case DioExceptionType.badResponse:
      return _parseDioErrorResponse(dioError);
  }
}

MyDioException _parseDioErrorResponse(DioException dioError) {
  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;

  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data["statusCode"];
    }
    status = dioError.response?.data["status"];
    serverMessage = dioError.response?.data["message"];
  } catch (e) {
    serverMessage = "Something went wrong. Please try again later.";
  }
  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return MyDioException(
          message: "Service Temporarily Unavailable", statusCode: statusCode);
    case HttpStatus.notFound:
      return MyDioException(
          message: serverMessage ?? "", statusCode: statusCode);
    default:
      return MyDioException(
          statusCode: statusCode, message: serverMessage ?? "");
  }
}