import 'package:decimal/decimal.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:sadovod/data/token_ropository.dart';


class ProfilePageModel extends ElementaryModel {
  ProfilePageModel(ErrorHandler errorHandler, this.tokenRepository)
      : super(errorHandler: errorHandler);

  final TokenRepository tokenRepository;

  bool isLoggedIn() {
    return tokenRepository.auth;
  }

}
