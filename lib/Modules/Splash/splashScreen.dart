import 'package:blood_type/Shared/Cubit/AppCubit/cubit.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/states.dart';
import 'package:blood_type/Style/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => AppCubit()..initState(context),
    child: BlocConsumer<AppCubit, AppStates>(
    listener: (context, state) {},
    builder: (context, state) {
      return Scaffold(
        backgroundColor: color6,
//              backgroundColor: Colors.black87.withOpacity(.7),
                body: SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(child: Image.asset('assets/images/azoz.png')),
                              Text('دليل فصائل الدم',style: TextStyle(
                                color: color1,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Bold',
                              ),),
//                              Text('سامول',style: TextStyle(
//                                color: color5,
//                                fontSize: 20.sp,
//                                fontWeight: FontWeight.bold,
//                                fontFamily: 'Bold',
//                              ),)
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            children: [
                              Text(' 2022 \u00a9 مصطفي رأفت الشنهاب',style: TextStyle(
                                color: color1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Regular'
                              ),),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text('معمل عزوز للتحاليل الطبية',style: TextStyle(
                                  color: color1,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Regular'
                              ),),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              );
    })
    );
  }
}
