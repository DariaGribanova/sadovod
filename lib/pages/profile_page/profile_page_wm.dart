import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sadovod/navigation/app_router.dart';
import 'package:sadovod/pages/profile_page/profile_page_model.dart';
import 'profile_page_widget.dart';

abstract class IProfilePageWidgetModel extends IWidgetModel {

  ThemeData get theme;

  bool get isLoggedIn;

  BehaviorSubject<bool> get loadController;

  void navigateToAuth();

}

ProfilePageWidgetModel defaultProfilePageWidgetModelFactory(BuildContext context) {
  return ProfilePageWidgetModel(ProfilePageModel(context.read(), context.read()));
}

class ProfilePageWidgetModel extends WidgetModel<ProfilePageWidget, ProfilePageModel>
    implements IProfilePageWidgetModel {
  ProfilePageWidgetModel(ProfilePageModel model) : super(model);

  BehaviorSubject<bool> loadController = BehaviorSubject<bool>.seeded(false);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    loadController.add(true);
  }

  @override
  bool get isLoggedIn {
    return model.isLoggedIn();
  }

  @override
  bool get load {
    return loadController.value;
  }

  @override
  ThemeData get theme => Theme.of(context);

  @override
  void navigateToAuth() {
    context.router.navigate(AuthRouteWidget());
  }

}
