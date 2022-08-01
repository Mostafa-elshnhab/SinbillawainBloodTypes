
import 'package:blood_type/Modules/AddFasela/%D9%90AddPageTwo.dart';
import 'package:blood_type/Modules/Login/Screen/loginScreen.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/cubit.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/states.dart';
import 'package:blood_type/Shared/reusable/reusable%20components.dart';
import 'package:blood_type/Style/Colors/colors.dart';
import 'package:blood_type/Style/Icons/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AddPageOne extends StatelessWidget {
  AddPageOne({Key? key}) : super(key: key);
  final TextEditingController nameController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  final TextEditingController addressController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        return  Scaffold(
          body: SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
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
                          Padding(
                            padding:  EdgeInsets.only(top: 30.h),
                            child: Text('إضافة فصيلة',
                              style: TextStyle(
                                color: color5,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Bold',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  color: color6,
                                  fontFamily: 'Bold',
                                  fontSize: 15.sp
                              ),
                              prefixIcon: Icon(IconBroken.User,color: color6,),
                              labelStyle:TextStyle(
                                color: color4,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Bold',
                              ),

                              labelText: 'الاسم بالكامل',
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
                              if (value!.isEmpty||value.length<12) {
                                return 'من فضلك ادخل اسمك بالكامل';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixIcon: Icon(IconBroken.Call,color: color6,),
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
                              labelText: 'رقم الهاتف',
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
                              if (value!.isEmpty || !(value.length==11)) {
                                return 'ادخل رقم هاتف صحيح';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          TextFormField(
                            controller: addressController,
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

                          SizedBox(
                            height: 20.h,
                          ),
                          Center(
                            child: Container(
                              width: 120.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: color6
                              ),
                              child: MaterialButton(
                                onPressed: ()
                                {
                                  if(formKey.currentState!.validate())
                                  {
                                    navTo(context, AddPageTwo(
                                      phone: phoneController.text,
                                      name: nameController.text,
                                      address: addressController.text,
                                    ));
                                  }
                                },
                                child: Text('التالي',style: TextStyle(
                                    color: color1,
                                    fontFamily: 'Bold',
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold
                                ),),
                              ),
                            ),
                          ),

                          SizedBox(height: 10.h,),
//                          Center(
//                            child: Text('أو',style: TextStyle(
//                                color: color5,
//                                fontFamily: 'Bold',
//                                fontSize: 20.sp,
//                                fontWeight: FontWeight.bold
//                            ),),
//                          ),
//                          GestureDetector(onTap: (){}, child: Center(child: Image.asset('assets/images/google2.png',width: 200.w,height: 60.h,))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
