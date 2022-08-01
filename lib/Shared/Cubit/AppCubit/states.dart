abstract class AppStates {}

class InitialAppState extends AppStates {}

class BottomNaveChange extends AppStates {}

class HomeLoadingState extends AppStates {}

class HomeSuccessState extends AppStates {}

class HomeErrorState extends AppStates {}

class GetUsersLoadingState extends AppStates {}

class GetUsersSuccessState extends AppStates {}

class GetUsersErrorState extends AppStates {}

class UpdateLoadingState extends AppStates {}

class UpdateErrorState extends AppStates {}

class ChangeEditAddressState extends AppStates {}

class CreateDatabaseState extends AppStates {}

class InsertDatabaseState extends AppStates {}

class GetDatabaseState extends AppStates {}

class UpdateDatabaseState extends AppStates {}

class DeleteDatabaseState extends AppStates {}

class ChangeRegisterPasswordState extends AppStates {}

class CreateUserSuccessState extends AppStates {}

class ChangeFaselaState extends AppStates {}

class ChangeGenderState extends AppStates {}

class ChangeMan3State extends AppStates {}

class CreateUserLoadingState extends AppStates {}


class CreateUserErrorState extends AppStates {
  String? error;

  CreateUserErrorState(this.error);
}