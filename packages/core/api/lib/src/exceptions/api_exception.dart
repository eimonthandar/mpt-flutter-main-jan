import 'package:api/api.dart';
import 'package:domain/domain.dart';

abstract class ApiException implements Exception {
  const ApiException(this.message);

  final String message;

  @override
  String toString() {
    return "$runtimeType: $message";
  }
}

extension ApiExceptionExtension on ApiException {
  DomainException toDomainException() {
    if (this is NetworkApiException) {
      return NetworkDomainException(message);
    } else if (this is UnauthorizedApiException) {
      return UnauthorizedDomainException(message);
    } else if (this is ServerApiException) {
      return ServerDomainException(message);
    } else if (this is ClientApiException) {
      return ClientDomainException(message);
    } else {
      return UnknownDomainException(message);
    }
  }
}
