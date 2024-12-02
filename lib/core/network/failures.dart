import 'package:dio/dio.dart';
import 'package:e_commerce_test/generated/l10n.dart';
import 'package:flutter/material.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    if (dioException.response?.statusCode == 401) {
      return ServerFailure(S.current.unauthorizedNeedSignInAgain);
    }
    if (dioException.response?.statusCode == 404) {
      return ServerFailure(S.current.exceptionMessage);
    }
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(S.current.networkExceptionMessage);

      case DioExceptionType.sendTimeout:
        return ServerFailure(S.current.networkExceptionMessage);

      case DioExceptionType.receiveTimeout:
        return ServerFailure(S.current.networkExceptionMessage);

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response?.statusCode, dioException.response?.data);

      case DioExceptionType.cancel:
        return ServerFailure(S.current.exceptionMessage);

      case DioExceptionType.connectionError:
        return ServerFailure(S.current.networkExceptionMessage);

      case DioExceptionType.unknown:
        if (dioException.message != null) {
          if (dioException.message?.contains('SocketException') ?? false) {
            return ServerFailure(S.current.networkExceptionMessage);
          }
        }
        return ServerFailure(S.current.exceptionMessage);
      default:
        return ServerFailure(S.current.exceptionMessage);
    }
  }

  factory ServerFailure.fromResponse(dynamic statusCode, dynamic response) {
    if (statusCode == 401) {
      return ServerFailure(S.current.unauthorizedNeedSignInAgain);
    }
    if (statusCode == 404) {
      return ServerFailure(S.current.exceptionMessage);
    }
    return ServerFailure(S.current.exceptionMessage);
  }
}
