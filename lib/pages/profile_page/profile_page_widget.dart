import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
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
        actions: [
          StreamBuilder<bool>(
            stream: wm.isLoggedIn,
            builder: (context, snapshot) {
              if (snapshot.data == true) {
                return IconButton(
                    onPressed: wm.logout, icon: const Icon(Icons.logout));
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: StreamBuilder<bool>(
          stream: wm.isLoggedIn,
          initialData: null,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data == false) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Text(
                          'Здравствуйте!\nВойдите в свой аккаунт, пожалуйста.',
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: wm.navigateToAuth,
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text("Войти / Зарегистрироваться"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return ListView(
                children: [],
              );
            }
          },
        ),
      ),
    );
  }
}
