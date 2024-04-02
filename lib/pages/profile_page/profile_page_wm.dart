import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sadovod/data/app_components.dart';
import 'package:sadovod/navigation/app_router.dart';
import 'package:sadovod/pages/profile_page/profile_page_model.dart';
import 'profile_page_widget.dart';

abstract class IProfilePageWidgetModel extends IWidgetModel {
  ThemeData get theme;

  ValueNotifier<bool> get isLoggedIn;

  void navigateToAuth();

  void logout();
}

ProfilePageWidgetModel defaultProfilePageWidgetModelFactory(
    BuildContext context) {
  return ProfilePageWidgetModel(
      ProfilePageModel(context.read(), AppComponents().tokenRepository, AppComponents().profileManager));
}

class ProfilePageWidgetModel
    extends WidgetModel<ProfilePageWidget, ProfilePageModel>
    implements IProfilePageWidgetModel {
  ProfilePageWidgetModel(ProfilePageModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.getUser();
  }

  @override
  ValueNotifier<bool> get isLoggedIn {
    return model.isLoggedIn();
  }

  @override
  ThemeData get theme => Theme.of(context);

  @override
  void navigateToAuth() {
    context.router.navigate(AuthRouteWidget());
  }

  @override
  Future<void> logout() {
    return model.logout();
  }

}
