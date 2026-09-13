import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_project/core/resources/assets_manager.dart';
import 'package:new_project/core/resources/colors_manager.dart';
import 'package:new_project/core/resources/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  _startDelay() {
    _timer = Timer(Duration(seconds: 3), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      body: Center(child: Image(image: AssetImage(AssetsManager.splashlogo))),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
