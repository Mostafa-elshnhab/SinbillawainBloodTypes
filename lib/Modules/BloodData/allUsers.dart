import 'package:blood_type/Modules/Profile/profile.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/cubit.dart';
import 'package:blood_type/Shared/Cubit/AppCubit/states.dart';
import 'package:blood_type/Shared/reusable/reusable%20components.dart';
import 'package:blood_type/Style/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AllUsers extends StatelessWidget {
  AllUsers({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return RefreshIndicator(
            onRefresh: cubit.onRefresh,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: color6,
                title: Text('كل المستخدمين',
                    style: TextStyle(
                      color: color1,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp,
                      fontFamily: 'NotoKufi',
                    )),
                centerTitle: true,
              ),
              body: ListView.separated(
                  itemBuilder: (context, index) =>
                       Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        navTo(context, Profile(true,index: index,));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${cubit.users[index].name}',
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    color: color6,
                                    fontFamily: 'Bold',
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${cubit.users[index].address}',
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        color: color5,
                                        fontFamily: 'Bold',
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Spacer(),
                                  Text(
                                    cubit.users[index].man3=='لا'?'متاح':'غير متاح',
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        color: color5,
                                        fontFamily: 'Bold',
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${cubit.users[index].phone}',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: color4,
                                          fontFamily: 'Bold',
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Clipboard.setData(ClipboardData(
                                          text:
                                          '${cubit.users[index].phone}'))
                                          .then((value) {
                                        Fluttertoast.showToast(
                                            msg: 'تم نسخ الرقم',
                                            toastLength:
                                            Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor: Colors.green,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'نسخ الرقم',
                                            style: TextStyle(
                                                color: color5,
                                                fontWeight:
                                                FontWeight.bold,
                                                fontFamily: 'Bold'),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Icon(
                                            Icons.copy,
                                            color: color6,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5.h,
                  ),
                  itemCount: cubit.users.length),
            ),
          );
        },
      ),
    );
  }
}
