import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:sadovod/data/manager/profile_manager.dart';
import 'package:sadovod/data/token_ropository.dart';

class ProfilePageModel extends ElementaryModel {
  ProfilePageModel(
      ErrorHandler errorHandler, this.tokenRepository, this.profileManager)
      : super(errorHandler: errorHandler);

  final TokenRepository tokenRepository;
  final ProfileManager profileManager;

  ValueNotifier<bool> isLoggedIn() {
    return tokenRepository.isLoggedIn;
  }

  Future<void> logout() async {
    return await tokenRepository.deleteTokens();
  }

  Future<void> getUser() async {
    if (tokenRepository.isLoggedIn.value) {
      await profileManager.getUser();
    }
  }
}
