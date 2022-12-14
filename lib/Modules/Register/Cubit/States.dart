abstract class RegisterStates {}

class InitialRegisterState extends RegisterStates {}
class ChangeFaselaState extends RegisterStates {}
class ChangeGenderState extends RegisterStates {}
class ChangeMan3State extends RegisterStates {}

class ChangeRegisterPasswordState extends RegisterStates {}

class RegisterLodaingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  String? error;

  RegisterErrorState(this.error);
}

class CreateUserSuccessState extends RegisterStates {}

class CreateUserErrorState extends RegisterStates {
  String? error;

  CreateUserErrorState(this.error);
}
