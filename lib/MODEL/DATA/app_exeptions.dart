class AppException implements Exception {
  final _message;
  final _prefix;
  AppException(this._prefix, this._message);
  String toString(){
    return '$_prefix$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message]): super(message,'Error During communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]): super(message,'Invalid Request');
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]): super(message,'Unauthorized Request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]): super(message,'Invalid user');
}