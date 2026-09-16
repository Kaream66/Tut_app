import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project/core/resources/assets_manager.dart';
import 'package:new_project/core/resources/colors_manager.dart';
import 'package:new_project/core/resources/routes.dart';
import 'package:new_project/core/resources/strings_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  List<SliderObject> _getSliderData() => [
    SliderObject(
      StringsManager.onBoardingTitle1,
      StringsManager.onBoardingSubTitle1,
      AssetsManager.onBoardingImage1,
    ),
    SliderObject(
      StringsManager.onBoardingTitle2,
      StringsManager.onBoardingSubTitle2,
      AssetsManager.onBoardingImage2,
    ),
    SliderObject(
      StringsManager.onBoardingTitle3,
      StringsManager.onBoardingSubTitle2,
      AssetsManager.onBoardingImage3,
    ),
    SliderObject(
      StringsManager.onBoardingTitle4,
      StringsManager.onBoardingSubTitle4,
      AssetsManager.onBoardingImage4,
    ),
  ];
  @override
  Widget build(BuildContext context) {
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
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(_list[index]);
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
            Container(color: ColorsManager.primaryColor, child: _getBottomSheetWidget()),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.all(14),
          child: GestureDetector(
            child: SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(AssetsManager.leftArrow),
            ),
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < _list.length; i++)
              Padding(padding: EdgeInsetsGeometry.all(8), child: _getCircleColor(i)),
          ],
        ),
        Padding(
          padding: EdgeInsetsGeometry.all(14),
          child: GestureDetector(
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

  Widget _getCircleColor(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(AssetsManager.hollowCircle);
    } else {
      return SvgPicture.asset(AssetsManager.solidCircle);
    }
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
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
