import 'package:blood_type/Layout/Home/homeScreen.dart';
import 'package:blood_type/Modules/AddFasela/addPageOne.dart';
import 'package:blood_type/Modules/Login/Screen/loginScreen.dart';
import 'package:blood_type/Modules/Register/Screens/registerScreen.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/cubit.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/states.dart';
import 'package:blood_type/Shared/reusable/reusable%20components.dart';
import 'package:blood_type/Style/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../TWafk/twafk.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: color6,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(child: Image.asset('assets/images/azoz.png')),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text('فصائل دم أبناء وبنات السنبلاوين والقري المجاوره',style: TextStyle(
                            color:color1 ,
                            fontFamily: 'Bold',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(
                          height: 40.h,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: color1
                          ),
                          child: MaterialButton(
                            onPressed: ()
                            {
                              navTo(context, LoginScreen());
                            },
                            child: Text('تسجيل الدخول',style: TextStyle(
                                color: color6,
                                fontFamily: 'Bold',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                  color: color1,
                                  width: 1.5
                              ),
                            ),
                            child: MaterialButton(

                                onPressed: (){
                                  navTo(context, RegisterScreen());
                                }, child: Text('إضافه فصيلة',style: TextStyle(
                                color: color1,
                                fontFamily: 'Bold',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold
                            ),))),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                  color: color1,
                                  width: 1.5
                              ),
                            ),
                            child: MaterialButton(

                                onPressed: (){
                                  navTo(context, HomeScreen());
                                }, child: Text('عرض الفصائل',style: TextStyle(
                                color: color1,
                                fontFamily: 'Bold',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold
                            ),))),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                  color: color1,
                                  width: 1.5
                              ),
                            ),
                            child: MaterialButton(

                                onPressed: (){
                                  navTo(context, Twafk());
                                }, child: Text('معرفة التوافق بين فصائل الدم',style: TextStyle(
                                color: color1,
                                fontFamily: 'Bold',
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold
                            ),))),
                        SizedBox(
                          height: 15.h,
                        ),
//                        Container(
//                            width: double.infinity,
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(15.r),
//                              border: Border.all(
//                                  color: color6,
//                                  width: 1.5
//                              ),
//                            ),
//                            child: MaterialButton(
//
//                                onPressed: (){
//                                  navTo(context, AddPageOne());
//                                }, child: Text('إضافة فصيلة',style: TextStyle(
//                                color: color6,
//                                fontFamily: 'Bold',
//                                fontSize: 18.sp,
//                                fontWeight: FontWeight.bold
//                            ),)))
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
