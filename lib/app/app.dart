import 'package:flutter/material.dart';
import 'package:new_project/presentation/theme_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: getAppTheme());
  }
}
