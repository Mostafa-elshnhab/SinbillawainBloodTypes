import 'package:blood_type/Modules/BloodData/allUsers.dart';
import 'package:blood_type/Modules/BloodData/bloodData.dart';
import 'package:blood_type/Modules/BloodType/bloodType.dart';
import 'package:blood_type/Modules/Profile/profile.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/cubit.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/states.dart';
import 'package:blood_type/Shared/reusable/constants.dart';
import 'package:blood_type/Shared/reusable/reusable%20components.dart';
import 'package:blood_type/Style/Colors/colors.dart';
import 'package:blood_type/Style/Icons/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../TWafk/twafk.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>AppCubit()..createDatabase()..getAllUsers(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){

          var cubit=AppCubit.get(context);
          return  Scaffold(
            backgroundColor: color6,
            appBar:  AppBar(
              backgroundColor:color6,
              elevation: 0,
              title: Text('فصائل الدم',
                style: TextStyle(
                  color: color1,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                  fontFamily: 'Bold',

                ),),
              centerTitle: true,
              leading: uId!=''?  Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                  backgroundColor: color1,
                  child: IconButton(onPressed: (){
                    navTo(context, Profile(false));
                  },icon: Icon(IconBroken.Profile,color: color6,),),
                ),
              ):SizedBox(),


            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('إختر الفصيلة اللتي تبحث عنها',
                        style: TextStyle(
                            color: color1,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Bold'
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      GridView(
                        shrinkWrap: true,
                        physics:BouncingScrollPhysics() ,

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 6.w,
                            mainAxisSpacing:6.h ,
                            childAspectRatio: 1.2.r,
                            mainAxisExtent: 130.h
                        ),
                        children: [
                          GestureDetector(
                            onTap: (){
//                              cubit.getUsers(fasela: '+A');
                              navTo(context,  Fasela(faselaName: '+A',));
                            },
                            child: Card(
                              color: color4,
                              child: Center(child: Text('+A',style: TextStyle(color: color5,
                                fontSize: 40.sp,
                                fontFamily: 'NotoKufi',
                                fontWeight: FontWeight.bold,
                              ),)),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
//                              cubit.getUsers(fasela: '-A');
                              navTo(context,  Fasela(faselaName: '-A',));
                            },
                            child: Card(
                              color: color4,
                              child: Center(child: Text('-A',style: TextStyle(color: color5,
                                fontSize: 40.sp,
                                fontFamily: 'NotoKufi',
                                fontWeight: FontWeight.bold,
                              ),)),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()
                            {
//                              cubit.getUsers(fasela: '+B');
                              navTo(context,  Fasela(faselaName: '+B',));
                            },
                            child: Card(
                              color: color4,
                              child: Center(child: Text('+B',style: TextStyle(color: color5,
                                fontSize: 40.sp,
                                fontFamily: 'NotoKufi',
                                fontWeight: FontWeight.bold,
                              ),)),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()
                            {
//                              cubit.getUsers(fasela: '-B');
                              navTo(context,  Fasela(faselaName: '-B',));
                            },
                            child: Card(
                              color: color4,
                              child: Center(child: Text('-B',style: TextStyle(color: color5,
                                fontSize: 40.sp,
                                fontFamily: 'NotoKufi',
                                fontWeight: FontWeight.bold,
                              ),)),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()
                            {
//                              cubit.getUsers(fasela: '+O');
                              navTo(context,  Fasela(faselaName: '+O',));
                            },
                            child: Card(
                              color: color4,
                              child: Center(child: Text('+O',style: TextStyle(color: color5,
                                fontSize: 40.sp,
                                fontFamily: 'NotoKufi',
                                fontWeight: FontWeight.bold,
                              ),)),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
//                              cubit.getUsers(fasela: '-O');
                              navTo(context,  Fasela(faselaName: '-O',));
                            },
                            child: Card(
                              color: color4,
                              child: Center(child: Text('-O',style: TextStyle(color: color5,
                                fontSize: 40.sp,
                                fontFamily: 'NotoKufi',
                                fontWeight: FontWeight.bold,
                              ),)),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()
                            {
//                              cubit.getUsers(fasela: '+AB');
                              navTo(context,  Fasela(faselaName: '+AB',));
                            },
                            child: Card(
                              color: color4,
                              child: Center(child: Text('+AB',style: TextStyle(color: color5,
                                fontSize: 40.sp,
                                fontFamily: 'NotoKufi',
                                fontWeight: FontWeight.bold,
                              ),)),
                            ),
                          ),
                          GestureDetector(
                            onTap: ()
                            {
//                              cubit.getUsers(fasela: '-AB');
                              navTo(context,  Fasela(faselaName: '-AB',));
                            },
                            child: Card(
                              color: color4,
                              child: Center(child: Text('-AB',style: TextStyle(color: color5,
                                fontSize: 40.sp,
                                fontFamily: 'NotoKufi',
                                fontWeight: FontWeight.bold,
                              ),)),
                            ),
                          ),

                        ],
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
                                navTo(context, Twafk());
                              }, child: Text('معرفة التوافق بين فصائل الدم',style: TextStyle(
                              color: color1,
                              fontFamily: 'Bold',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold
                          ),))),
//                  SizedBox(
//                    height: 15.h,
//                  ),
//                  Center(
//                    child: Container(
//                      width: 180.w,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(15.r),
//                          color: color6
//                      ),
//                      child: MaterialButton(
//                        onPressed: ()
//                        {
//                          navTo(context, AllUsers());
//                        },
//                        child: Text('كل المستخدمين',style: TextStyle(
//                            color: color1,
//                            fontFamily: 'Bold',
//                            fontSize: 20.sp,
//                            fontWeight: FontWeight.bold
//                        ),),
//                      ),
//                    ),)
                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
