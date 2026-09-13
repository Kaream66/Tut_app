import 'package:flutter/material.dart';
import 'package:new_project/core/resources/routes.dart';
import 'package:new_project/core/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static final MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;
  // const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      onGenerateRoute: RouteGenerator.getRoutes,
      initialRoute: Routes.splashRoute,
    );
  }
}
