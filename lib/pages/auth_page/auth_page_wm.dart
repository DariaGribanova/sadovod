import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sadovod/navigation/app_router.dart';
import 'package:sadovod/pages/auth_page/auth_page_model.dart';
import 'auth_page_widget.dart';
import 'package:auto_route/auto_route.dart';

abstract class IAuthPageWidgetModel extends IWidgetModel {
  ThemeData get theme;

  void navigatePop();

  void navigateRegistration();

  TextEditingController get usernameController;

  TextEditingController get password;
}

AuthPageWidgetModel defaultAuthPageWidgetModelFactory(BuildContext context) {
  return AuthPageWidgetModel(AuthPageModel(context.read(), context.read()));
}

class AuthPageWidgetModel extends WidgetModel<AuthPageWidget, AuthPageModel>
    implements IAuthPageWidgetModel {
  AuthPageWidgetModel(AuthPageModel model) : super(model);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    password.dispose();
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
    Navigator.of(context).pop();
  }

  @override
  void navigateRegistration() {
    context.router.navigate(RegistrationRouteWidget());
  }
}
