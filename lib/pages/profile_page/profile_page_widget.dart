import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:sadovod/pages/profile_page/profile_page_wm.dart';

@RoutePage()
class ProfilePageWidget extends ElementaryWidget<IProfilePageWidgetModel> {
  const ProfilePageWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultProfilePageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IProfilePageWidgetModel wm) {
    final theme = wm.theme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Профиль"),
        centerTitle: true,
      ),
      body: SafeArea(child: Container())
    );
  }
}

