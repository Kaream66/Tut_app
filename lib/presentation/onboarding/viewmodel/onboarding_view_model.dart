import 'dart:async';

import 'package:new_project/domain/models/onboarding_slider_view.dart';
import 'package:new_project/presentation/base/base_view_model.dart';

class OnBoardingViewModel
    implements BaseViewModel, OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  StreamController _streamController = StreamController<OnBoardingSliderView>();
  @override
  void dispose() {}

  @override
  void start() {}

  @override
  void goNext() {}

  @override
  void goPrevious() {}

  @override
  void onPageChanged(int index) {}

  @override
  Sink<dynamic> get inputSliderObject => throw UnimplementedError();

  @override
  Sink<dynamic> get outputSliderObject => throw UnimplementedError();
}

//inputs to do some actions accordding to requests from view
abstract class OnBoardingViewModelInputs {
  void goNext(); // when user click on right arrow or swipe left
  void goPrevious(); // when user click on left arrow or swipe right
  void onPageChanged(int index);
  Sink get inputSliderObject;
}

abstract class OnBoardingViewModelOutputs {
  Sink get outputSliderObject;
}
