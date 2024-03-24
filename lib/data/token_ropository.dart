import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenRepository extends ChangeNotifier {
  TokenRepository({
    bool useCaching = true,
  }) : _useCaching = useCaching;

  bool get auth => _refreshToken != null;

  BehaviorSubject<bool> isLoggedIn = BehaviorSubject<bool>.seeded(false);

  String? get accessToken => _accessToken;

  String? get refreshToken => _refreshToken;

  String? _accessToken;

  String? _refreshToken;

  final bool _useCaching;

  Future<void> initTokens() async {
    if (_useCaching) {
      final storage = await SharedPreferences.getInstance();
      _accessToken = storage.getString('accessToken');
      _refreshToken = storage.getString('refreshToken');
      if (_accessToken != null && _refreshToken != null){
        isLoggedIn.add(true);
      }
    }
    notifyListeners();
  }

  Future<void> deleteTokens() async {
    _accessToken = null;
    _refreshToken = null;
    notifyListeners();
    final storage = await SharedPreferences.getInstance();
    await storage.remove('accessToken');
    await storage.remove('refreshToken');
    isLoggedIn.add(false);
  }

  void saveTokens({
    required String accessToken,
    required String refreshToken,
  }) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    notifyListeners();
    if (_useCaching) {
      _persistTokens();
    }
    if (_accessToken != null && _refreshToken != null){
      isLoggedIn.add(true);
    }
  }

  Future<void> _persistTokens() async {
    final storage = await SharedPreferences.getInstance();
    await storage.setString('accessToken', _accessToken!);
    await storage.setString('refreshToken', _refreshToken!);
  }
}