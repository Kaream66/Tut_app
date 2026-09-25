import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project/core/resources/assets_manager.dart';
import 'package:new_project/core/resources/colors_manager.dart';
import 'package:new_project/core/resources/routes.dart';
import 'package:new_project/core/resources/strings_manager.dart';
import 'package:new_project/domain/models/onboarding_slider_model.dart';
import 'package:new_project/domain/models/onboarding_slider_view.dart';
import 'package:new_project/presentation/onboarding/viewmodel/onboarding_view_model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();

  OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _viewModel.outputSliderObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorsManager.white,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          _viewModel.onPageChanged(index);
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(sliderViewObject.sliderObject);
        },
      ),
      bottomSheet: Container(
        color: ColorsManager.white,
        height: 100,
        child: Column(
          children: [
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(
                  StringsManager.skip,
                  textAlign: TextAlign.end,
                  style: TextStyle(color: ColorsManager.primaryColor),
                ),
              ),
            ),
            Container(
              color: ColorsManager.primaryColor,
              child: _getBottomSheetWidget(sliderViewObject),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return const SizedBox.shrink();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.all(14),
          child: GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _viewModel.goPrevious(),
                duration: Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
              );
            },
            child: SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(AssetsManager.leftArrow),
            ),
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < sliderViewObject.numOfSlides; i++)
              Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: _getCircleColor(i, sliderViewObject.currentIndex),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsetsGeometry.all(14),
          child: GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                _viewModel.goNext(),
                duration: Duration(milliseconds: 300),
                curve: Curves.bounceInOut,
              );
            },
            child: SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(AssetsManager.rightArrow),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getCircleColor(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(AssetsManager.hollowCircle);
    } else {
      return SvgPicture.asset(AssetsManager.solidCircle);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(this._sliderObject, {super.key});
  final SliderObject _sliderObject;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        Text(_sliderObject.title, style: Theme.of(context).textTheme.displayLarge),
        Text(_sliderObject.subTitle, style: Theme.of(context).textTheme.headlineMedium),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}
