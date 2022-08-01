import 'package:blood_type/Data/Cash/cashHelper.dart';
import 'package:blood_type/Layout/Home/homeScreen.dart';
import 'package:blood_type/Modules/Login/Cubit/States.dart';
import 'package:blood_type/Modules/Login/Cubit/cubit.dart';
import 'package:blood_type/Modules/Register/Screens/registerScreen.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/cubit.dart';
import 'package:blood_type/Shared/reusable/constants.dart';
import 'package:blood_type/Shared/reusable/reusable%20components.dart';
import 'package:blood_type/Style/Colors/colors.dart';
import 'package:blood_type/Style/Icons/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LoginScreen extends StatelessWidget {
  final TextEditingController emailController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  final TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if (state is LoginErorrState) {
            Fluttertoast.showToast(
                msg:
                '${state.error!.substring(state.error!.indexOf(']') + 1, state.error!.length - 1)}',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (state is LoginScssesState) {
            CashHelper.saveData(key: 'uId', value: state.uId);
            AppCubit.get(context).getAllUsers();
            navToAndFinish(context, HomeScreen());
          }
        },
        builder: (context,state){
          var cubit=LoginCubit.get(context);
          return  Scaffold(
            body: SafeArea(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key:formKey ,
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
                              child: Text('تسجيل الدخول',
                                style: TextStyle(
                                  color: color6,
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
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined,color: color6,),
                                labelStyle:TextStyle(
                                  color: color4,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Bold',
                                ),
                                labelText: 'البريد الإلكتروني',
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
                                if (value!.isEmpty &&
                                    !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                        .hasMatch(value)) {
                                  return 'من فضلك ادخل الايميل';
                                } else
                                  return null;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: LoginCubit.get(context).isShow,
                              decoration: InputDecoration(
                                prefixIcon: Icon(IconBroken.Password,color: color6,),
                                labelStyle: TextStyle(
                                  color: color4,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Bold',
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      LoginCubit.get(context)
                                          .ChangePasswordIcon();
                                    },
                                    icon: Icon(Icons.remove_red_eye,color: color6,)),
                                labelText: 'كلمة السر',
                                enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: color6,
                                  ),
                                ),
                                border: OutlineInputBorder(
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
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'من فضلك ادخل كلمة السر';
                                } else
                                  return null;
                              },
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            (state is! LoginLodaingState)?
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
                                      cubit.login(email: emailController.text, password: passwordController.text);
                                    }

                                  },
                                  child: Text('الدخول',style: TextStyle(
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
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              children: [
                                Text('ليس لديك فصيلة؟',style: TextStyle(
                                  color: color4,
                                  fontFamily: 'Bold',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),),
                                GestureDetector(
                                    onTap: (){
                                      navTo(context, RegisterScreen());
                                    },
                                    child: Text('إنشاء فصيلة',style: TextStyle(
                                      color: color6,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      fontFamily: 'Bold',

                                    ),)),
                              ],
                            ),
                           SizedBox(height: 10.h,),
//                          Center(
//                            child: Text('أو',style: TextStyle(
//                              color: color5,
//                              fontFamily: 'Bold',
//                              fontSize: 20.sp,
//                              fontWeight: FontWeight.bold
//                            ),),
//                          ),
//                          SizedBox(height: 10.h,),
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
      ),
    );
  }
}
