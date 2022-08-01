
import 'package:blood_type/Shared/reusable/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'States.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());
  static LoginCubit get(context) => BlocProvider.of(context);
  bool isShow = true;
  void ChangePasswordIcon() {
    isShow = !isShow;
    emit(ChangePasswordState());
  }

  void login({required email, required password}) {
    emit(LoginLodaingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uId = value.user!.uid;
      print ('$uId');
      emit(LoginScssesState(value.user!.uid));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErorrState(error.toString()));
    });
  }
}
