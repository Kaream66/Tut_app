import 'package:flutter/material.dart';
import 'package:new_project/core/resources/colors_manager.dart';
import 'package:new_project/core/resources/styles.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.grey2,
      body: Center(
        child: Text('Wellcome to my project', style: getBoldStyle(color: ColorsManager.error)),
      ),
    );
  }
}
