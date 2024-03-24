import 'package:flutter/material.dart';
import 'package:sadovod/data/app_components.dart';
import 'package:sadovod/data/app_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppComponents().init();
  runApp(
    const AppDependency(),
  );
}