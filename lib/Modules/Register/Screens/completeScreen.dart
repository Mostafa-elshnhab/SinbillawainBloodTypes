import 'package:blood_type/Data/Cash/cashHelper.dart';
import 'package:blood_type/Layout/Home/homeScreen.dart';
import 'package:blood_type/Modules/Register/Cubit/cubit.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/cubit.dart';
import 'package:blood_type/Shared/reusable/constants.dart';
import 'package:blood_type/Shared/reusable/reusable%20components.dart';
import 'package:blood_type/Style/Colors/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blood_type/Modules/Register/Cubit/States.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui' as ui;
class CompleteScreen extends StatelessWidget {
   CompleteScreen({Key? key,required this.name,required this.phone,required this.email,required this.password,required this.address}) : super(key: key);
   String name;
   String email;
   String phone;
   String password;
   String address;
   var formKey=GlobalKey<FormState>();
 final TextEditingController dataOfBirthController=TextEditingController();
 final TextEditingController dataOfGiveController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state){
          if (state is CreateUserSuccessState) {
            AppCubit.get(context)..getAllUsers();
//              token = state.loginModel!.data!.token;
            CashHelper.saveData(key: 'fasela', value: fasela);
            CashHelper.saveData(key: 'uId', value: uId)
                .then((value) => navToAndFinish(context, HomeScreen()));
          }
          if (state is CreateUserErrorState) {
            Fluttertoast.showToast(
                msg: 'خطأ',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (state is RegisterErrorState) {
            Fluttertoast.showToast(
                msg:
                '${state.error!.substring(state.error!.indexOf(']') + 1, state.error!.length - 1)}',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context,state){
          var cubit= RegisterCubit.get(context);
          return Scaffold(
         body:SafeArea(
           child: Directionality(
             textDirection: ui.TextDirection.rtl,
             child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Form(
                   key: formKey,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Center(child: Container(
                         clipBehavior: Clip.antiAliasWithSaveLayer,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(30.r),
                             border: Border.all(
                                 color: color4,
                                 width: 1.5.w
                             )
                         ),
                         child: Card(
                             clipBehavior: Clip.antiAliasWithSaveLayer,
                             child: Image.asset('assets/images/blood.png',width: 100.w,)),
                       )),
                       Center(
                         child: Padding(
                           padding:  EdgeInsets.only(top: 20.h),
                           child: Text('من فضلك أكمل البيانات التالية',
                             style: TextStyle(
                               color: color4,
                               fontSize: 20.sp,
                               fontWeight: FontWeight.bold,
                               fontFamily: 'Bold',
                             ),
                           ),
                         ),
                       ),
                       SizedBox(
                         height: 10.h,
                       ),
                       Text('إختر فصيلة دمك',
                         style: TextStyle(
                           color: color6,
                           fontSize: 20.sp,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'Bold',
                         ),
                       ),
                       Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                cubit.changeFasela('+A', 0);
                              },
                              child: Container(
                                height: 50.h,
                                child: Card(
                                  color: cubit.isFasela[0]?color6:color1,
                                  child: Center(child: Text('+A',style: TextStyle(
                                    color:color5,
                                    fontSize: 23.sp,
                                    fontFamily: 'NotoKufi'
                                  ),)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){

                                  cubit.changeFasela('-A', 1);

                              },
                              child: Container(
                                height: 50.h,
                                child: Card(
                                  color: cubit.isFasela[1]?color6:color1,
                                  child: Center(child: Text('-A',style: TextStyle(
                                      color: color5,
                                      fontSize: 23.sp,
                                      fontFamily: 'NotoKufi'
                                  ),)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                cubit.changeFasela('+B', 2);
                              },
                              child: Container(
                                height: 50.h,
                                child: Card(
                                  color: cubit.isFasela[2]?color6:color1,
                                  child: Center(child: Text('+B',style: TextStyle(
                                      color: color5,
                                      fontSize: 23.sp,
                                      fontFamily: 'NotoKufi'
                                  ),)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
                                cubit.changeFasela('-B', 3);
                              },
                              child: Container(
                                height: 50.h,
                                child: Card(
                                  color: cubit.isFasela[3]?color6:color1,
                                  child:  Center(child: Text('-B',style: TextStyle(
                                      color: color5,
                                      fontSize: 23.sp,
                                      fontFamily: 'NotoKufi'
                                  ),)),
                                ),
                              ),
                            ),
                          ),
                        ],
                       ),
                       SizedBox(
                         height: 5.h,
                       ),
                       Row(
                         children: [
                           Expanded(
                             child: GestureDetector(
                               onTap: (){
                                 cubit.changeFasela('+AB', 4);
                               },
                               child: Container(
                                 height: 50.h,
                                 child: Card(
                                   color: cubit.isFasela[4]?color6:color1,
                                   child: Center(child: Text('+AB',style: TextStyle(
                                       color: color5,
                                       fontSize: 23.sp,
                                       fontFamily: 'NotoKufi'
                                   ),)),
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             width: 10.w,
                           ),
                           Expanded(
                             child: GestureDetector(
                               onTap: (){
                                 cubit.changeFasela('-AB', 5);
                               },
                               child: Container(
                                 height: 50.h,
                                 child: Card(
                                   color: cubit.isFasela[5]?color6:color1,
                                   child: Center(child: Text('-AB',style: TextStyle(
                                       color: color5,
                                       fontSize: 23.sp,
                                       fontFamily: 'NotoKufi'
                                   ),)),
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             width: 10.w,
                           ),
                           Expanded(
                             child: GestureDetector(
                               onTap: (){
                                 cubit.changeFasela('+O', 6);
                               },
                               child: Container(
                                 height: 50.h,
                                 child: Card(
                                   color: cubit.isFasela[6]?color6:color1,
                                   child: Center(child: Text('+O',style: TextStyle(
                                       color: color5,
                                       fontSize: 23.sp,
                                       fontFamily: 'NotoKufi'
                                   ),)),
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(
                             width: 10.w,
                           ),
                           Expanded(
                             child: GestureDetector(
                               onTap: (){
                                 cubit.changeFasela('-O', 7);
                               },
                               child: Container(
                                 height: 50.h,
                                 child: Card(
                                   color: cubit.isFasela[7]?color6:color1,
                                   child:  Center(child: Text('-O',style: TextStyle(
                                       color: color5,
                                       fontSize: 23.sp,
                                       fontFamily: 'NotoKufi'
                                   ),)),
                                 ),
                               ),
                             ),
                           ),
                         ],
                       ),
                       if(!cubit.isFaselais&&cubit.isValidate)Text('الفصيلة مطلوبة',style:TextStyle(
                           color: color6,
                           fontFamily: 'Bold',
                           fontSize: 15.sp
                       ),),
                       SizedBox(
                         height: 5.h,
                       ),
                       Text('إختر نوعك',
                         style: TextStyle(
                           color: color6,
                           fontSize: 20.sp,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'Bold',
                         ),
                       ),
                       SizedBox(
                         height: 5.h,
                       ),
                       Center(child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           GestureDetector(
                             onTap:(){
                               cubit.changeGender('ذكر', 0);
                             },
                             child: Container(
                                 height: 60.h,
                                 width: 100.w,
                                 child: Card(
                                   color: cubit.isGender[0]?color6:color1,
                               child: Center(child: Text('ذكر',
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
                              onTap: ()
                              {
                                cubit.changeGender('انثي', 1);
                              },
                             child: Container(
                                 height: 60.h,
                                 width: 100.w,
                                 child: Card(
                                   color: cubit.isGender[1]?color6:color1,
                               child: Center(child: Text('انثي',
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
                       if(!cubit.isGenderis&&cubit.isValidate)Text('النوع مطلوب',style:TextStyle(
                           color: color6,
                           fontFamily: 'Bold',
                           fontSize: 15.sp
                       ),),
                       SizedBox(
                         height: 5.h,
                       ),

//                       TextFormField(
//                         validator: (String? value) {
//                           if (value!.isEmpty) {
//                             return 'تاريخ الميلاد مطلوب';
//                           }
//                           return null;
//                         },
//                         onTap: () {
//                           showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate:DateTime.parse('1940-10-30'),
//                               textDirection: ui.TextDirection.rtl,
//                               lastDate: DateTime.parse('2022-10-30'))
//                               .then((value) {
//
//                             DateTime today = DateTime.now();
//                      if( today.year - value!.year>18&&today.year - value.year<40)
//                      {
//                        dataOfBirthController.text =
//                            DateFormat.yMMMd()
//                                .format(value);
//                      }
//                      else
//                        {
//                        Fluttertoast.showToast(
//                        msg:'عمرك غير مناسب',
//                        toastLength: Toast.LENGTH_SHORT,
//                        gravity: ToastGravity.CENTER,
//                        timeInSecForIosWeb: 3,
//                        backgroundColor: Colors.red,
//                        textColor: Colors.white,
//                        fontSize: 16.0);
//                        }
//
////                                 if(DateFormat.y(value) -DateTime.now().year<60);
//                           });
//                         },
//                         controller: dataOfBirthController,
//                         keyboardType: TextInputType.datetime,
//                         decoration: InputDecoration(
//                             labelText: 'تاريخ الميلاد',
//                             errorStyle: TextStyle(
//                                 color: color6,
//                                 fontFamily: 'Bold',
//                                 fontSize: 15.sp
//                             ),
//                             labelStyle: TextStyle(
//                               color: color6,
//                               fontFamily: 'Bold',
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                               borderSide: BorderSide(
//                                 color: color6,
//                               ),
//                             ),
//                             prefixIcon:
//                             Icon(Icons.date_range_outlined,color: color6,)),
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       TextFormField(
//                         validator: (String? value) {
//                           if (value!.isEmpty) {
//                             return 'تاريخ أخر تبرع مطلوب';
//                           }
//                           return null;
//                         },
//                         onTap: () {
//                           showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime.parse('1940-10-30'),
//                               lastDate: DateTime.parse('2030-10-30'))
//                               .then((value) => dataOfGiveController.text =
//                               DateFormat.yMMMd()
//                                   .format(value!));
//                         },
//                         controller: dataOfGiveController,
//                         keyboardType: TextInputType.datetime,
//                         decoration: InputDecoration(
//                             labelText: 'تاريخ أخر تبرع',
//                             errorStyle: TextStyle(
//                                 color: color6,
//                                 fontFamily: 'Bold',
//                                 fontSize: 15.sp
//                             ),
//                             labelStyle: TextStyle(
//                               color: color6,
//                               fontFamily: 'Bold',
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                               borderSide: BorderSide(
//                                 color: color6,
//                               ),
//                             ),
//                             prefixIcon:
//                             Icon(Icons.date_range_outlined,color: color6,)),
//                       ),

                       SizedBox(
                         height: 5.h,
                       ),

                       Text('مستعد للتبرع الان؟',
                         style: TextStyle(
                           color: color6,
                           fontSize: 20.sp,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'Bold',
                         ),
                       ),
                       SizedBox(
                         height: 5.h,
                       ),
                       Center(child: Row(
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
                                   color: cubit.isMan3[0]?color6:color1,
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
                                   color: cubit.isMan3[1]?color6:color1,
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
                           if(!cubit.isMan3is&&cubit.isValidate)Text('المانع مطلوب',style:TextStyle(
                               color: color6,
                               fontFamily: 'Bold',
                               fontSize: 15.sp
                           ),),
                         ],
                       )),
                       SizedBox(
                         height: 10.h,
                       ),
                       Text('في حالة "لا" تصبح بياناتك غير مرئيه ',
                         style: TextStyle(
                           color: color6,
                           fontSize: 20.sp,
                           fontWeight: FontWeight.bold,
                           fontFamily: 'Bold',
                         ),
                       ),
                       SizedBox(
                         height: 10.h,
                       ),

                       (state is! RegisterLodaingState)?    Center(
                         child: Container(
                           width: 150.w,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(15.r),
                               color: color6
                           ),
                           child: MaterialButton(
                             onPressed: ()
                             {
                              if(formKey.currentState!.validate()&&cubit.isFaselais&&cubit.isGenderis&&cubit.isMan3is){
                                    cubit.register(
                                      dataOfBirth: dataOfBirthController.text,
//                                      dataOfTparo3: dataOfGiveController.text,
                                      name: name,
                                      email: email,
                                      password: password,
                                      phone: phone,
                                      address: address

                                    );
                              }
                              else
                                {
                                  cubit.isValidate=true;
                                  cubit.emit(ChangeFaselaState());
                                }
                             },
                             child: Text('حفظ و استمرار',style: TextStyle(
                                 color: color1,
                                 fontFamily: 'Bold',
                                 fontSize: 20.sp,
                                 fontWeight: FontWeight.bold
                             ),),
                           ),
                         ),
                       ):Center(
                         child: CircularProgressIndicator(
                           color: color6,
                         ),
                       ),
                     ],
                   ),
                 ),
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
