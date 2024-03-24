import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:sadovod/pages/registration_page/registration_page_wm.dart';

@RoutePage()
class RegistrationPageWidget extends ElementaryWidget<IRegistrationPageWidgetModel> {
  const RegistrationPageWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultRegistrationPageWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IRegistrationPageWidgetModel wm) {
    final theme = wm.theme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Регистрация'),
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
                "Уникальное имя пользователя",
                style: theme.textTheme.bodyLarge
                    ?.copyWith(color: theme.colorScheme.secondary),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextField(
                  style: theme.textTheme.bodyLarge,
                  controller: wm.usernameController,
                  decoration: InputDecoration(hintText: 'Петрович58'),
                ),
              ),
              Text(
                "Имя",
                style: theme.textTheme.bodyLarge
                    ?.copyWith(color: theme.colorScheme.secondary),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextField(
                  style: theme.textTheme.bodyLarge,
                  controller: wm.nameController,
                  decoration: InputDecoration(hintText: 'Иван'),
                ),
              ),
              Text(
                "Фамилия",
                style: theme.textTheme.bodyLarge
                    ?.copyWith(color: theme.colorScheme.secondary),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextField(
                  style: theme.textTheme.bodyLarge,
                  controller: wm.lastNameController,
                  decoration: InputDecoration(hintText: 'Смирнов'),
                ),
              ),
              Text(
                "Пароль",
                style: theme.textTheme.bodyLarge
                    ?.copyWith(color: theme.colorScheme.secondary),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: wm.isObscured,
                builder: (context, isObscured, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TextField(
                      style: theme.textTheme.bodyLarge,
                      controller: wm.passwordController,
                      obscureText: isObscured,
                      decoration: InputDecoration(
                        hintText: 'Пароль',
                        suffixIcon: IconButton(
                          icon: Icon(isObscured
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            wm.toggleObscure();
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: OutlinedButton(
                  onPressed: () async {},
                  child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('ЗАРЕГИСТРИРОВАТЬСЯ'),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Есть аккаунт?",
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: theme.colorScheme.secondary),
                  ),
                  TextButton(
                    onPressed: wm.navigateAuth,
                    child: Text(
                      "Авторизоваться!",
                      style: theme.textTheme.bodyLarge
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
