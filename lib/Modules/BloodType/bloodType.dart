import 'package:blood_type/Style/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BloodType extends StatelessWidget {
  const BloodType({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color6,
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
                      onTap: (){},
                      child: Card(

                        child: Center(child: Text('+A',style: TextStyle(color: color5,
                        fontSize: 40.sp,
                          fontFamily: 'NotoKufi',
                          fontWeight: FontWeight.bold,
                        ),)),
                      ),
                    ),
                    GestureDetector(
                       onTap: (){},
                      child: Card(
                        child: Center(child: Text('-A',style: TextStyle(color: color5,
                          fontSize: 40.sp,
                          fontFamily: 'NotoKufi',
                          fontWeight: FontWeight.bold,
                        ),)),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Card(
                        child: Center(child: Text('+B',style: TextStyle(color: color5,
                          fontSize: 40.sp,
                          fontFamily: 'NotoKufi',
                          fontWeight: FontWeight.bold,
                        ),)),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Card(
                        child: Center(child: Text('-B',style: TextStyle(color: color5,
                          fontSize: 40.sp,
                          fontFamily: 'NotoKufi',
                          fontWeight: FontWeight.bold,
                        ),)),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Card(
                        child: Center(child: Text('+O',style: TextStyle(color: color5,
                          fontSize: 40.sp,
                          fontFamily: 'NotoKufi',
                          fontWeight: FontWeight.bold,
                        ),)),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Card(
                        child: Center(child: Text('-O',style: TextStyle(color: color5,
                          fontSize: 40.sp,
                          fontFamily: 'NotoKufi',
                          fontWeight: FontWeight.bold,
                        ),)),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Card(
                        child: Center(child: Text('+AB',style: TextStyle(color: color5,
                          fontSize: 40.sp,
                          fontFamily: 'NotoKufi',
                          fontWeight: FontWeight.bold,
                        ),)),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Card(
                        child: Center(child: Text('-AB',style: TextStyle(color: color5,
                          fontSize: 40.sp,
                          fontFamily: 'NotoKufi',
                          fontWeight: FontWeight.bold,
                        ),)),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
