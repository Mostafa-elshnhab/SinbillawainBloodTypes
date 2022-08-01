import 'dart:async';
import 'package:blood_type/Modules/BloodData/allUsers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sqflite/sqflite.dart';
import 'package:blood_type/Layout/Home/homeScreen.dart';
import 'package:blood_type/Layout/Welcome/welcome.dart';
import 'package:blood_type/Models/UserModel/user_model.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/states.dart';
import 'package:blood_type/Shared/reusable/constants.dart';
import 'package:blood_type/Shared/reusable/reusable%20components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);
  void initState(context) {
    bool? isLogin;
    if (uId != '')
      isLogin = true;
    else
      isLogin = false;
    Widget startWidget;

    if (isLogin)
      startWidget = HomeScreen();
    else
      startWidget = WelcomeScreen();
    Timer(Duration(seconds: 5), () {
      navToAndFinish(context, startWidget);
    });
    emit(InitialAppState());
  }

  bool editAddress = false;
  bool editDate = false;
  bool editMan3 = false;
  bool isMan3is = false;
  String? man3;
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dataOfGiveController = TextEditingController();
  var isMan3 = List.filled(2, false);
  void changeEditAddress() {
    editAddress = !editAddress;
    emit(ChangeEditAddressState());
  }

  void changeEditDate() {
    editDate = !editDate;
    emit(ChangeEditAddressState());
  }

  void changeMane3Date() {
    editMan3 = !editMan3;
    emit(ChangeEditAddressState());
  }

  void changeMane3(value, index) {


    int y = 0;
    for (int i = 0; i <= 1; i++) {
      print('object');

      if (isMan3[i]) {
       isMan3[i]=false;
       isMan3[index]=true;
       man3 = value;
       isMan3is = true;
       emit(ChangeEditAddressState());
      }
      else isMan3[index]=true;
    }

  }
  bool isShow = true;
  void changePasswordIcon() {
    isShow = !isShow;
    emit(ChangeRegisterPasswordState());
  }
  var isFasela = List.filled(8, false);
  bool isFaselais = false;
  var isGender = List.filled(2, false);
  bool isGenderis = false;
  bool isValidate = false;
  String fasela='';
  String gender='';


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


/////////////////////////Firebase Code//////////////////////////////

  void crateUser({
    required String name,
    required String phone,
    required String uId,
    required String dataOfBirth,
//    required String dataOfTparo3,
    required String address,

  }) {
    emit(CreateUserLoadingState());
    UserModel model = UserModel(
        uId: uId,
        name: name,
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
          fasela='';
          man3='';
          gender='';
          isFasela = List.filled(8, false);
          isGender = List.filled(2, false);
          isMan3 = List.filled(2, false);
          emit(CreateUserSuccessState());
    }).catchError((error) {
      String errorData =
      error.toString().substring(25, error.toString().length);

      emit(CreateUserErrorState(errorData));
    });
  }

  UserModel? userModel;
  void getData() {
    emit(HomeLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
//      userModel = UserModel.fromJson(value.data()!);
      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState());
    });
  }

  List<UserModel> users = [];
//
//  void getUsers({required String fasela}) {
//    emit(GetUsersLoadingState());
//    users = [];
//    FirebaseFirestore.instance
//        .collection("users")
//        .where('fasela', isEqualTo: fasela)
//        .get()
//        .then((value) {
//      value.docs.forEach((element) {
//        users.add(UserModel.fromJson(element.data()));
//      });
//      print(users.length);
//      emit(GetUsersSuccessState());
//    }).catchError((error) {
//      print(error.toString());
//      emit(GetUsersErrorState());
//    });
//  }

  void getAllUsers() {
    emit(GetUsersLoadingState());
    users = [];
    FirebaseFirestore.instance.collection("users").get().then((value) {
      value.docs.forEach((element) {
        users.add(UserModel.fromJson(element.data()));

      });
      print(users[0].name);
      deleteTable();
      for (var element in users) {
        insertDatabase(
            name: element.name,
//            dataOfTparo3: element.dataOfTparo3,
            address: element.address,
            man3: element.man3,
            phone: element.phone,
            email: element.email,
            dataOfBirth: element.dataOfBirth,
            fasela: element.fasela,
            gender: element.gender,
            key: element.uId);
      }

      emit(GetUsersSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUsersErrorState());
    });
  }

  void save() {
    editMan3 = false;
    editAddress = false;
    editDate = false;
    man3 ??= userModel!.man3;
    if (addressController.text == '') {
      addressController.text = userModel!.address!;
    }
    if (dataOfGiveController.text == '') {
//      dataOfGiveController.text = userModel!.dataOfTparo3!;
    }

    updateData(
        man3: man3!,
        address: addressController.text,
        dataOfTparo3: dataOfGiveController.text,
        uId: uId!,
      gender: userModel!.gender!,
      fasela:userModel!.fasela! ,
      email: userModel!.email!,
      phone:userModel!.phone! ,
      name: userModel!.name!,
      dataOfBirth:userModel!.dataOfBirth! ,
    );
//    UpdateDatabase(man3:man3!,address:addressController.text,dataOfTparo3: dataOfGiveController.text  );

    getAllUsers();
  }
  void saveAdmin(int index,uid)async {
    editMan3 = false;
    editAddress = false;
    editDate = false;
    man3 ??= users[index].man3;

    if (addressController.text == '') {
      addressController.text = users[index].address!;
    }
    if (dataOfGiveController.text == '') {
//      dataOfGiveController.text = userModel!.dataOfTparo3!;
    }
print(uid);
    updateData(
        man3: man3!,
        address: addressController.text,
        dataOfTparo3: dataOfGiveController.text,
        uId: uid,
      dataOfBirth:  users[index].dataOfBirth!,
      name:  users[index].name!,
      phone:  users[index].phone!,
      email:  users[index].email!,
      fasela: users[index].fasela! ,
      gender:  users[index].gender!,
    );
//    UpdateDatabase(man3:man3!,address:addressController.text,dataOfTparo3: dataOfGiveController.text  );

    getAllUsers();
  }

  void updateData ({
    required String man3,
    required String name,
    required String email,
    required String phone,
    required String dataOfBirth,
    required String fasela,
    required String gender,
    required String address,
    required String dataOfTparo3,
    required String uId,
  })async {
    UserModel model = UserModel(
      uId: uId,
      name:name,
      email:email,
      phone: phone,
      man3: man3,
      address: address,
//      dataOfTparo3: dataOfTparo3,
      dataOfBirth: dataOfBirth,
      fasela: fasela,
      gender: gender,
      isVerified: false,
    );
    emit(UpdateLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(model.toMap())
        .then((value) {
      getData();
         }).catchError((error) {
      print(error.toString());
      emit(UpdateErrorState());
    });
  }
  void deleteData (context)
  {
     FirebaseAuth.instance.currentUser!.delete();
    FirebaseFirestore.instance.collection('users').doc(uId).delete().then((value) =>logout(context));
  }
  void deleteAdmin(id,context)
  {
    FirebaseFirestore.instance.collection('users').doc(id).delete().then((value)
        {
          getAllUsers();
        navToAndFinish(context, WelcomeScreen());
        });
  }

  /////////////////////////sqflite Code//////////////////////////////

  List<Map> faselA1 = [];
  List<Map> faselA2 = [];
  List<Map> faselO1 = [];
  List<Map> faselO2 = [];
  List<Map> faselB1 = [];
  List<Map> faselB2 = [];
  List<Map> faselAB1 = [];
  List<Map> faselAB2 = [];
  Database? database;

  void createDatabase() {
    openDatabase(
      'fasel.dp',
      version: 1,
      onCreate: (db, version) {
        db
            .execute(
                'CREATE TABLE users ( uId TEXT, name TEXT, address TEXT, email TEXT,phone TEXT, fasela TEXT,gender TEXT, dataOfBirth TEXT,dataOfTparo3 TEXT, man3 TEXT)')
            .then((value) => print('table created'))
            .catchError((onError) {
          print('Erorr When create table$onError');
        });
      },
      onOpen: (db) {

        getDataSqflite(db);

        print('database Opend');
      },
    ).then((value) {
      database = value;
      print('$database');
      emit(CreateDatabaseState());
    });
  }

  void insertDatabase(
      {key,
      name,
      address,
      email,
      phone,
      fasela,
      gender,
      dataOfBirth,
      dataOfTparo3,
      man3}) async {
    await database!.transaction((txn) {

      return txn
          .rawInsert(
              'INSERT INTO users (uId,name,address,email,phone,fasela,gender,dataOfBirth,dataOfTparo3,man3) VALUES ("$key","$name","$address","$email","$phone","$fasela","$gender","$dataOfBirth","$dataOfTparo3","$man3")')
          .then((value) {
        print('$value data inserted');
        emit(InsertDatabaseState());
        getDataSqflite(database);
      }).catchError((onError) {
        print('error when insert in table $onError');
      });
    });
  }

  getDataSqflite(db) {
    faselA1 = [];
    faselA2 = [];
    faselO1 = [];
    faselO2 = [];
    faselB1 = [];
    faselB2 = [];
    faselAB1 = [];
    faselAB2 = [];

    db.rawQuery('SELECT * FROM users').then((value) {
      print('from ${value.length}');
      users=[];
      value.forEach((element) {
users.add(UserModel.fromJson(element));

//        if (element['fasela'] == '+A') {
//          faselA1.add(element);
//        } else if (element['fasela'] == '-A') {
//          faselA2.add(element);
//        } else if (element['fasela'] == '+O') {
//          faselO1.add(element);
//        } else if (element['fasela'] == '-O') {
//          faselO2.add(element);
//        } else if (element['fasela'] == '+B') {
//          faselB1.add(element);
//        } else if (element['fasela'] == '-B') {
//          faselA2.add(element);
//        }else if (element['fasela'] == '+AB') {
//          faselAB1.add(element);
//        }else if (element['fasela'] == '-AB') {
//          faselAB2.add(element);
//        }
      });
      if(uId!=''){
//        print('sasa00$uId');
//        users.forEach((element) {
//          if(element.uId==uId)
//          {
//            userModel=element;
//          }
//        });
        db.rawQuery('SELECT * FROM users WHERE uId = ?',[uId]).then((value){
          userModel=UserModel.fromJson(value[0]);
          print(userModel!.email);
        });
      }

      emit(GetDatabaseState());
    });
  }

  void UpdateDatabase({required String man3,required String address,required String dataOfTparo3,}) {
    database!.rawUpdate('UPDATE users SET man3 = ?, address = ?, dataOfTparo3 = ? WHERE uId = ?', [
      man3,
      address,
      dataOfTparo3,
      uId,
    ]).then((value) {
      emit(UpdateDatabaseState());
      getDataSqflite(database);
    });
  }

  void deleteDatabase({required int id}) {
    database!.rawDelete('DELETE FROM tasks WHERE uId = ?', [id]).then((value) {
      emit(DeleteDatabaseState());
      getDataSqflite(database);
    });
  }
  void deleteTable() {
    database!.rawDelete('DELETE FROM users').then((value) {
      emit(DeleteDatabaseState());
      getDataSqflite(database);
    });
  }





  Future<void> onRefresh() async{
    getAllUsers();
  }
}
