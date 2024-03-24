import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:sadovod/data/app_components.dart';
import 'package:sadovod/navigation/app_router.dart';
import 'package:sadovod/pages/auth_page/auth_page_model.dart';
import 'auth_page_widget.dart';
import 'package:auto_route/auto_route.dart';

abstract class IAuthPageWidgetModel extends IWidgetModel {
  ThemeData get theme;

  void navigatePop();

  void navigateRegistration();

  void toggleObscure();

  void auth();

  TextEditingController get usernameController;

  TextEditingController get passwordController;

  ValueListenable<bool> get isObscured;
}

AuthPageWidgetModel defaultAuthPageWidgetModelFactory(BuildContext context) {
  return AuthPageWidgetModel(AuthPageModel(context.read(),
      AppComponents().tokenRepository, AppComponents().authService));
}

class AuthPageWidgetModel extends WidgetModel<AuthPageWidget, AuthPageModel>
    implements IAuthPageWidgetModel {
  AuthPageWidgetModel(AuthPageModel model) : super(model);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _isObscuredNotifier = ValueNotifier<bool>(true);

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    _isObscuredNotifier.dispose();
    super.dispose();
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  ThemeData get theme => Theme.of(context);

  @override
  void navigatePop() {
    context.router.popUntilRoot();
  }

  @override
  void navigateRegistration() {
    context.router.navigate(RegistrationRouteWidget());
  }

  @override
  void auth() {
    model.auth().then((value) => context.router.popUntilRoot());
  }

  @override
  void toggleObscure() {
    _isObscuredNotifier.value = !_isObscuredNotifier.value;
  }

  @override
  ValueListenable<bool> get isObscured => _isObscuredNotifier;

  ValueListenable<bool> get isObscuredNotifier => _isObscuredNotifier;
}
