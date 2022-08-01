import 'package:bloc/bloc.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/cubit.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/states.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Data/Cash/cashHelper.dart';
import 'Modules/Splash/splashScreen.dart';
import 'Shared/Cubit/cubit_observe.dart';
import 'Shared/reusable/constants.dart';
import 'Style/Colors/colors.dart';

void main() async{
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await CashHelper.init();
  uId = CashHelper.getuId('uId') ?? '';
  print(uId);
  fasela = CashHelper.getuId('fasela') ?? '';
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(EasyLocalization (
      path: 'assets/lang',
      supportedLocales:const [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      fallbackLocale:const Locale('ar', 'EG'),
      saveLocale: true,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return  ScreenUtilInit(
            designSize:const  Size(375, 812),
            builder: ()=>  MaterialApp (
              theme: ThemeData(primarySwatch: Colors. red,),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'فصائل الدم',
              debugShowCheckedModeBanner: false,
              home:const SplashScreen(),
            ),
          );
        },

      ),
    );
  }
}
