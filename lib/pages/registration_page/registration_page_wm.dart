import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sadovod/data/app_components.dart';
import 'package:sadovod/navigation/app_router.dart';
import 'package:sadovod/pages/registration_page/registration_page_model.dart';
import 'registration_page_widget.dart';

abstract class IRegistrationPageWidgetModel extends IWidgetModel {
  ThemeData get theme;

  void navigatePop();

  void navigateAuth();

  void auth();

  TextEditingController get usernameController;

  TextEditingController get passwordController;

  TextEditingController get nameController;

  TextEditingController get lastNameController;

  void toggleObscure();

  ValueListenable<bool> get isObscured;
}

RegistrationPageWidgetModel defaultRegistrationPageWidgetModelFactory(
    BuildContext context) {
  return RegistrationPageWidgetModel(
      RegistrationPageModel(context.read(), AppComponents().tokenRepository));
}

class RegistrationPageWidgetModel
    extends WidgetModel<RegistrationPageWidget, RegistrationPageModel>
    implements IRegistrationPageWidgetModel {
  RegistrationPageWidgetModel(RegistrationPageModel model) : super(model);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final _isObscuredNotifier = ValueNotifier<bool>(true);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    nameController.dispose();
    lastNameController.dispose();
    _isObscuredNotifier.dispose();
    super.dispose();
  }

  @override
  ThemeData get theme => Theme.of(context);

  @override
  void navigatePop() {
    context.router.popUntilRoot();
  }

  @override
  void navigateAuth() {
    context.router.navigate(AuthRouteWidget());
  }

  @override
  void auth() {
  }

  @override
  void toggleObscure() {
    _isObscuredNotifier.value = !_isObscuredNotifier.value;
  }

  @override
  ValueListenable<bool> get isObscured => _isObscuredNotifier;

  ValueListenable<bool> get isObscuredNotifier => _isObscuredNotifier;
}
