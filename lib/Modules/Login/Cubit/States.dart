abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class ChangePasswordState extends LoginStates {}

class LoginLodaingState extends LoginStates {}

class LoginScssesState extends LoginStates {
  final String? uId;
  LoginScssesState(this.uId);
}

class LoginErorrState extends LoginStates {
  String? error;

  LoginErorrState(this.error);
}
