import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:sadovod/data/service/auth_service.dart';
import 'package:sadovod/model/profile.dart';

class ProfileManager {
  ProfileManager(this.authService);

  final EntityStateNotifier<Profile?> _profileState = EntityStateNotifier();

  EntityStateNotifier<Profile?> get profileState => _profileState;

  final AuthService authService;

  Future<void> getUser() async {
    _profileState.loading(_profileState.value?.data);
    try {
      final response = await authService.getUser();
      _profileState.content(response);
    } catch (e) {
      _profileState.error();
      debugPrint(e.toString());
    }
  }

  Future<void> clearProfile() async {
    _profileState.loading(_profileState.value?.data);
    try {
      _profileState.content(null);
    } catch (e) {
      _profileState.error();
      debugPrint(e.toString());
    }
  }
}
