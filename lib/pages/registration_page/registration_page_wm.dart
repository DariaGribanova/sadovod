import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sadovod/navigation/app_router.dart';
import 'package:sadovod/pages/registration_page/registration_page_model.dart';
import 'registration_page_widget.dart';

abstract class IRegistrationPageWidgetModel extends IWidgetModel {
  ThemeData get theme;

  void navigatePop();

  void navigateAuth();

  TextEditingController get usernameController;

  TextEditingController get password;

  TextEditingController get name;

  TextEditingController get lastName;
}

RegistrationPageWidgetModel defaultRegistrationPageWidgetModelFactory(
    BuildContext context) {
  return RegistrationPageWidgetModel(
      RegistrationPageModel(context.read(), context.read()));
}

class RegistrationPageWidgetModel
    extends WidgetModel<RegistrationPageWidget, RegistrationPageModel>
    implements IRegistrationPageWidgetModel {
  RegistrationPageWidgetModel(RegistrationPageModel model) : super(model);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController lastName = TextEditingController();

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void dispose() {
    usernameController.dispose();
    password.dispose();
    name.dispose();
    lastName.dispose();
    super.dispose();
  }

  @override
  ThemeData get theme => Theme.of(context);

  @override
  void navigatePop() {
    Navigator.of(context).pop();
  }

  @override
  void navigateAuth() {
    context.router.navigate(AuthRouteWidget());
  }
}
