import 'package:flutter_application_3/model/model1.dart';

abstract class LoginRedisterStates {}

class LoginRegisterInitStates extends LoginRedisterStates {}

class LoginLoadingStates extends LoginRedisterStates {}

class LoginSuccessStates extends LoginRedisterStates {
  final DateMdel1 model;
  LoginSuccessStates(this.model);
}

class LoginErrorStates extends LoginRedisterStates {
  final String error;
  LoginErrorStates(this.error);
}

class RegisterLoadingStates extends LoginRedisterStates {}

class RegisterSuccessStates extends LoginRedisterStates {
  final DateMdel1 model1;
  RegisterSuccessStates(this.model1);
}

class RegisterErrorStates extends LoginRedisterStates {
  final String error;
  RegisterErrorStates(this.error);
}

class RegisterIconStates extends LoginRedisterStates {}

class pickImagecameraStates extends LoginRedisterStates {}

class pickImageGalleryStates extends LoginRedisterStates {}

class NoInternetStates extends LoginRegisterInitStates {}
