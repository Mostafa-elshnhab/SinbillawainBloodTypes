
import 'package:blood_type/Models/UserModel/user_model.dart';
import 'package:blood_type/Shared/reusable/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'States.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialRegisterState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  bool isShow = true;
  void changePasswordIcon() {
    isShow = !isShow;
    emit(ChangeRegisterPasswordState());
  }
  final isFasela = List.filled(8, false);
  bool isFaselais = false;
  final isGender = List.filled(2, false);
  bool isGenderis = false;
  bool isValidate = false;
  final isMan3 = List.filled(2, false);
  bool isMan3is =false;
  String fasela='';
  String gender='';
  String man3='';

  void changeFasela(value,index)
 {
   int y=0;
   for(int i=0;i<=7;i++)
   {
     print('object');

     if(isFasela[i])
     {
       isFasela[i]=false;
       isFasela[index]=!isFasela[index];
       isFaselais=true;
       fasela=value;
       emit(ChangeFaselaState());
     }
     else isFasela[index]=true;
   }
//   if(y==0||isFasela[index])
//   {
//
//   }

 }
  void changeGender(value,index)
  {
    int y=0;
    for (int i = 0; i <= 1; i++) {
      print('object');

      if (isGender[i]) {
        isGender[i]=false;
        isGender[index]=true;
        gender = value;
        isGenderis = true;
        emit(ChangeGenderState());
      }
      else isGender[index]=true;
    }

  }
  void changeMane3(value,index)
  {
    for (int i = 0; i <= 1; i++) {
      print('object');

      if (isMan3[i]) {
        isMan3[i]=false;
        isMan3[index]=true;
        man3 = value;
        isMan3is = true;
        emit(ChangeMan3State());
      }
      else isMan3[index]=true;
    }

  }

  void register({
    required String name,
    required String email,
    required String phone,
    required String password,
//    required String dataOfTparo3,
    required String dataOfBirth,
    required String address,
  }) {
    emit(RegisterLodaingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      uId = value.user!.uid;
      crateUser(
        name: name,
        email: email,
        phone: phone,
        uId: value.user!.uid,
//        dataOfTparo3: dataOfTparo3,
        dataOfBirth: dataOfBirth,
        address: address
      );
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  void crateUser({
    required String name,
    required String email,
    required String phone,
    required String uId,
    required String dataOfBirth,
//    required String dataOfTparo3,
    required String address,

  }) {
    UserModel model = UserModel(
        uId: uId,
        name: name,
        email: email,
        phone: phone,
        isVerified: false,
       gender: gender,
      dataOfBirth: dataOfBirth,
//      dataOfTparo3: dataOfTparo3,
      fasela: fasela,
      man3: man3,
      address: address
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      String errorData =
          error.toString().substring(25, error.toString().length);

      emit(CreateUserErrorState(errorData));
    });
  }
}
