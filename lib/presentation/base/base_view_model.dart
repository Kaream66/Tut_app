abstract class BaseViewModel implements BaseViewModelInputs, BaseViewModelOutputs {}

abstract class BaseViewModelInputs {
  //this is the method to start the view model
  void start();
  //this is the method to kill the view model
  void dispose();
}

abstract class BaseViewModelOutputs {}
