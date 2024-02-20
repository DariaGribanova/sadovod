import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:sadovod/pages/auth_page/auth_page_wm.dart';

@RoutePage()
class AuthPageWidget extends ElementaryWidget<IAuthPageWidgetModel> {
  const AuthPageWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultAuthPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IAuthPageWidgetModel wm) {
    final theme = wm.theme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Вход'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: wm.navigatePop,
        ),
        elevation: 0,
      ),
      body: Container(
        color: theme.colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Text(
                "Введите уникальное имя пользователя",
                style: theme.textTheme.bodyLarge
                    ?.copyWith(color: theme.colorScheme.secondary),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextField(
                  style: theme.textTheme.titleLarge,
                  controller: wm.usernameController,
                ),
              ),
              Text(
                "Введите пароль",
                style: theme.textTheme.bodyLarge
                    ?.copyWith(color: theme.colorScheme.secondary),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextField(
                  style: theme.textTheme.titleLarge,
                  controller: wm.password,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: OutlinedButton(
                  onPressed: () async {},
                  child: const Center(
                      child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('Авторизоваться'),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Нет аккаунта?",
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: theme.colorScheme.secondary),
                  ),
                  TextButton(
                    onPressed: wm.navigateRegistration,
                    child: Text(
                      "Зарегистрироваться!",
                      style: theme.textTheme.titleLarge
                          ?.copyWith(color: theme.colorScheme.secondary),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
