import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sadovod/pages/profile_page/profile_page_model.dart';
import 'profile_page_widget.dart';

abstract class IProfilePageWidgetModel extends IWidgetModel {

  ThemeData get theme;

}

ProfilePageWidgetModel defaultProfilePageWidgetModelFactory(BuildContext context) {
  return ProfilePageWidgetModel(ProfilePageModel(context.read(), context.read()));
}

class ProfilePageWidgetModel extends WidgetModel<ProfilePageWidget, ProfilePageModel>
    implements IProfilePageWidgetModel {
  ProfilePageWidgetModel(ProfilePageModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
  }

  bool isLoggedIn() {
    return model.isLoggedIn();
  }


  @override
  ThemeData get theme => Theme.of(context);

}
