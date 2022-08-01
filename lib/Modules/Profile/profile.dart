import 'package:blood_type/Models/UserModel/user_model.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/cubit.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/states.dart';
import 'package:blood_type/Shared/reusable/constants.dart';
import 'package:blood_type/Shared/reusable/reusable%20components.dart';
import 'package:blood_type/Style/Colors/colors.dart';
import 'package:blood_type/Style/Icons/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui'as ui;
class Profile extends StatelessWidget {
   Profile(this.admin, {Key? key,index}) : super(key: key)
   {
     this.index=index;
   }
bool admin;
int? index;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          UserModel? model;
          if(admin){
            model= AppCubit.get(context).users[index!];
          }else {
            model= AppCubit.get(context).userModel!;
          }
          var cubit=AppCubit.get(context);
          return Scaffold(

            appBar: AppBar(
              backgroundColor: color6,
              title: Text('البيانات الشخصية',style: TextStyle(
                color: color1,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
                fontFamily: 'Bold',
              ),),
              centerTitle: true,
            ),
            body: Directionality(
              textDirection: ui.TextDirection.rtl,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${model.name}',
                              style: TextStyle(
                                  color: color6,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Bold',
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('فصيلة الدم',style: TextStyle(
                                          color: color6,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                        ),),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text('${model.fasela}',style: TextStyle(
                                          color: color4,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                        ),)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('النوع',style: TextStyle(
                                          color: color6,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                        ),),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Text('${model.gender}',style: TextStyle(
                                          color: color4,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                        ),)
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('حالة التبرع',style: TextStyle(
                                          color: color6,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                        ),),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                       Text(model.man3=='نعم' ?'غير متاح':'متاح',style: TextStyle(
                                          color: color4,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                        ),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text('البريد الإلكتروني',
                                    style: TextStyle(
                                        color: color6,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Bold',
                                        overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Icon(Icons.email_outlined,color: color6,)
                                ],
                              ),
                            ),
                            Text('${model.email}',
                              style: TextStyle(
                                  color: color4,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NotoKufi',
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),

                          ],
                        ),
                      ),
                   SizedBox(
                     height: 6.h,
                   ),
                   !cubit.editAddress?   Card(
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text('العنوان',
                                        style: TextStyle(
                                            color: color6,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Bold',
                                            overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Icon(IconBroken.Location,color: color6,)
                                    ],
                                  ),
                                ),
                                Text('${model.address}',
                                  style: TextStyle(
                                      color: color4,
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'NotoKufi',
                                      overflow: TextOverflow.ellipsis
                                  ),
                                ),

                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: GestureDetector(
                                  onTap: ()
                                  {
                                    cubit.changeEditAddress();
                                  },
                                  child: Icon(IconBroken.Edit_Square,color: color6,)),
                            )
                          ],
                        ),
                      ):TextFormField(
                     controller:cubit.addressController,
                     keyboardType: TextInputType.streetAddress,
                     decoration: InputDecoration(
                       prefixIcon: Icon(IconBroken.Location,color: color6,),
                       errorStyle: TextStyle(
                           color: color6,
                           fontFamily: 'Bold',
                           fontSize: 15.sp
                       ),
                       labelStyle:TextStyle(
                         color: color4,
                         fontSize: 16.sp,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'Bold',
                       ),
                       labelText: 'العنوان',
                       enabledBorder:  OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.0),
                         borderSide: BorderSide(
                           color: color6,
                         ),
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.0),
                         borderSide: BorderSide(
                           color: color5,
                         ),
                       ),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.0),
                         borderSide: BorderSide(
                           color: color6,
                         ),
                       ),
                     ),
                     validator: (value) {
                       if (value!.isEmpty) {
                         return 'العنوان مطلوب';
                       } else {
                         return null;
                       }
                     },
                   ),
                      SizedBox(height: 10.h,),
                      SizedBox(height: 10.h,),
//                     !cubit.editDate? Card(
//                        child: Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: [
//                            Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Row(
//                                children: [
//                                  Text('تاريخ أخر تبرع',
//                                    style: TextStyle(
//                                        color: color6,
//                                        fontSize: 20.sp,
//                                        fontWeight: FontWeight.bold,
//                                        fontFamily: 'Bold',
//                                        overflow: TextOverflow.ellipsis
//                                    ),
//                                  ),
//                                  SizedBox(
//                                    width: 10.w,
//                                  ),
//                                  Icon(Icons.date_range_outlined,color: color6,)
//                                ],
//                              ),
//                            ),
//                            Padding(
//                              padding: const EdgeInsets.only(right: 8.0),
//                              child: Row(
//                                children: [
//                                  Text('${model.dataOfTparo3}',
//                                    style: TextStyle(
//                                        color: color5,
//                                        fontSize: 17.sp,
//                                        fontWeight: FontWeight.bold,
//                                        fontFamily: 'NotoKufi',
//                                        overflow: TextOverflow.ellipsis
//                                    ),
//                                  ),
//                                  Spacer(),
//                                  Padding(
//                                    padding: const EdgeInsets.only(left: 8.0),
//                                    child: GestureDetector(
//                                        onTap: ()
//                                        {
//                                          cubit.changeEditDate();
//                                        },
//                                        child: Icon(IconBroken.Edit_Square,color: color6,)),
//                                  )
//                                ],
//                              ),
//                            ),
//                          ],
//                        ),
//                      ): TextFormField(
//                       validator: (String? value) {
//                         if (value!.isEmpty) {
//                           return 'تاريخ أخر تبرع مطلوب';
//                         }
//                         return null;
//                       },
//                       onTap: () {
//                         showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime.parse('1940-10-30'),
//                             lastDate: DateTime.parse('2030-10-30'))
//                             .then((value) => cubit.dataOfGiveController.text =
//                             DateFormat.yMMMd()
//                                 .format(value!));
//                       },
//                       controller: cubit.dataOfGiveController,
//                       keyboardType: TextInputType.datetime,
//                       decoration: InputDecoration(
//                           labelText: 'تاريخ أخر تبرع',
//                           errorStyle: TextStyle(
//                               color: color6,
//                               fontFamily: 'Bold',
//                               fontSize: 15.sp
//                           ),
//                           labelStyle: TextStyle(
//                             color: color6,
//                             fontFamily: 'Bold',
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                             borderSide: BorderSide(
//                               color: color6,
//                             ),
//                           ),
//                           prefixIcon:
//                           Icon(Icons.date_range_outlined,color: color6,)),
//                     ),
                      SizedBox(height: 10.h,),
                    !cubit.editMan3?  Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){},
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('مستعد تتبرع الانً ؟ ',
                                  style: TextStyle(
                                      color: color4,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Bold',
                                      overflow: TextOverflow.ellipsis
                                  ),
                                ),
                                Text('${model.man3}',
                                  style: TextStyle(
                                      color: color6,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Bold',
                                      overflow: TextOverflow.ellipsis
                                  ),
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: (){
                                      cubit.changeMane3Date();
                                    },
                                    child: Icon(IconBroken.Edit_Square,color: color6,))
                              ],
                            ),
                          ),
                        ),
                      ):   Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap:()
                          {
                           cubit.changeMane3('لا',0);
                          },
                          child: Container(
                              height: 60.h,
                              width: 100.w,
                              child: Card(
                                color:  cubit.isMan3[0]?color6:color1,
                                child: Center(child: Text('نعم',
                                  style: TextStyle(
                                    color: color5,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Bold',
                                  ),
                                )),
                              )),
                        ),
                        GestureDetector(
                          onTap:()
                          {
                          cubit.changeMane3('نعم',1);
                          },
                          child: Container(
                              height: 60.h,
                              width: 100.w,
                              child: Card(
                                color:  cubit.isMan3[1]?color6:color1,
                                child: Center(child: Text('لا',
                                  style: TextStyle(
                                    color: color5,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Bold',
                                  ),
                                )),
                              )),
                        ),

                      ],
                    )),
                      SizedBox(height: 20.h,),
                    cubit.editDate||cubit.editAddress||cubit.editMan3?  Center(
                        child: Container(
                          width: 150.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: color6
                          ),
                          child: MaterialButton(
                            onPressed: ()
                            {
                              if(admin){
                                Navigator.pop(context);
                                cubit.saveAdmin(index!,model!.uId);

                              }else{
                             cubit.save();
                              }
                            },
                            child: Text('حفظ',style: TextStyle(
                                color: color1,
                                fontFamily: 'Bold',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                      ):const SizedBox(),
                      SizedBox(height: 20.h,),
                 admin?  SizedBox()   :Center(
                        child: Container(
                          width: 150.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: color6
                          ),
                          child: MaterialButton(
                            onPressed: ()
                            {
                              logout(context);
                            },
                            child: Text('تسجيل الخروج',style: TextStyle(
                                color: color1,
                                fontFamily: 'Bold',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      Center(
                        child: Container(
                          width: 150.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: color6
                          ),
                          child: MaterialButton(
                            onPressed: ()
                            {
                              if(admin){
                                cubit.deleteAdmin(model!.uId!,context);
                              }else{
                                cubit.deleteData(context);
                              }


                            },
                            child: Text('حذف بياناتي',style: TextStyle(
                                color: color1,
                                fontFamily: 'Bold',
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                        ),
                      ),
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
