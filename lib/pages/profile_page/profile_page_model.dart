import 'package:decimal/decimal.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/src/subjects/behavior_subject.dart';
import 'package:sadovod/data/token_ropository.dart';


class ProfilePageModel extends ElementaryModel {
  ProfilePageModel(ErrorHandler errorHandler, this.tokenRepository)
      : super(errorHandler: errorHandler);

  final TokenRepository tokenRepository;

  BehaviorSubject<bool> isLoggedIn() {
    return tokenRepository.isLoggedIn;
  }

  Future<void> logout() async {
    return await tokenRepository.deleteTokens();
  }

}
