import 'package:flutter/cupertino.dart';

class RequestUtils {
  static final RequestUtils _instance = RequestUtils._internal();

  factory RequestUtils() => _instance;

  RequestUtils._internal();

  Future<T> executeRequest<T>(Future<T> Function() function) async {
    try {
      return await function.call();
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrint(stacktrace.toString());
      rethrow;
    }
  }
}