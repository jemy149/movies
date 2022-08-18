import 'package:movies/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({
    required this.errorMessageModel,
  });
}



class LocaleException implements Exception {
  final String message;

  LocaleException({
    required this.message,
  });
}
