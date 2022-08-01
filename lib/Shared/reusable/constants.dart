

import 'package:blood_type/Data/Cash/cashHelper.dart';
import 'package:blood_type/Layout/Welcome/welcome.dart';
import 'package:blood_type/Modules/Splash/splashScreen.dart';
import 'package:blood_type/Shared/reusable/reusable%20components.dart';

void logout(context) {
  uId='';
  CashHelper.removeData(key: 'uId')
      .then((value) => navToAndFinish(context, WelcomeScreen()));
}

String? uId;
String? fasela;

String lang = 'arabic';
