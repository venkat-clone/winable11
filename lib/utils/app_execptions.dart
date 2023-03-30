

import 'package:flutter/foundation.dart';

class AppException implements Exception {

  final _message ;
  final _prefix ;
  AppException([this._message , this._prefix]){
    print(_message);
  }
  getMessage()=>_message;

  String toString(){
    if(kDebugMode){
      print("App Execution Occurred:$_message \n $_prefix");
    }
    return '$_prefix:$_message' ;
  }

}


class FetchDataException extends AppException {

  FetchDataException([String? message]) : super(message, 'Error During Communication');
}


class BadRequestException extends AppException {

  BadRequestException([String? message]) : super(message, 'Invalid request');
}


class UnauthorisedException extends AppException {

  UnauthorisedException([String? message]) : super(message, 'Unauthorised request');
}


class InvalidInputException extends AppException {

  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}

class InvalidResponseException extends AppException{

  InvalidResponseException([String? message]):super(message,'Invalid Response');
}

class FileNotUploadedException extends AppException{
  FileNotUploadedException([String? message]) :super(message,'Not Uploaded');
}

