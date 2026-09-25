import 'dart:async';

import 'package:new_project/core/resources/assets_manager.dart';
import 'package:new_project/core/resources/strings_manager.dart';
import 'package:new_project/domain/models/onboarding_slider_model.dart';
import 'package:new_project/domain/models/onboarding_slider_view.dart';
import 'package:new_project/presentation/base/base_view_model.dart';

class OnBoardingViewModel
    implements BaseViewModel, OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextindex = ++_currentIndex;
    if (nextindex == _list.length) {
      nextindex = 0;
    }
    return nextindex;
  }

  @override
  int goPrevious() {
    int previousindex = --_currentIndex;
    if (previousindex == -1) {
      previousindex = _list.length - 1;
    }
    return previousindex;
  }

  @override
  void onPageChanged(int index) {
    index = _currentIndex;
    _postDataToView();
  }

  @override
  Sink get inputSliderObject => _streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);
  void _postDataToView() {
    inputSliderObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }

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
}

//inputs to do some actions accordding to requests from view
abstract class OnBoardingViewModelInputs {
  int goNext(); // when user click on right arrow or swipe left
  int goPrevious(); // when user click on left arrow or swipe right
  void onPageChanged(int index);
  Sink get inputSliderObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderObject;
}
