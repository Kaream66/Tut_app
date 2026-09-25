abstract class BaseViewModel implements BaseViewModelInputs, BaseViewModelOutputs {
  //shared variables and functions will be used through any view model
}

abstract class BaseViewModelInputs {
  //this is the method to start the view model
  void start();
  //this is the method to kill the view model
  void dispose();
}

abstract class BaseViewModelOutputs {}
