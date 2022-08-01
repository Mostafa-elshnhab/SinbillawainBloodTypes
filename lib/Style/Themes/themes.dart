import 'package:blood_type/Style/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  static ThemeData themeData(bool isDark) {
    return isDark
        ? ThemeData(
            primarySwatch: Colors.blue,
            dialogBackgroundColor: Color(0xFF253341),
            snackBarTheme: SnackBarThemeData(
              actionTextColor: Colors.black,
              disabledActionTextColor: Colors.black,
              backgroundColor: Colors.lightBlueAccent.withOpacity(.7),
            ),
            textTheme: TextTheme(
                caption: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'NotoKufi'),
                button: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'NotoKufi',
                ),
                bodyText2: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: 'NotoKufi',
                ),
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontFamily: 'NotoKufi',
                )),
            scaffoldBackgroundColor: Color(0xFF15202B),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color(0xFF253341),
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.lightBlueAccent),
            tabBarTheme: TabBarTheme(
              labelColor: Colors.white,
              labelStyle: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoKufi',
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.0,
                fontFamily: 'NotoKufi',
              ),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: Color(0xFF253341),
              elevation: 0,
              backwardsCompatibility: false,
              iconTheme: IconThemeData(color: Colors.white, size: 22),
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoKufi',
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xFF253341),
                  statusBarIconBrightness: Brightness.light),
            ),
          )
        : ThemeData(
            primarySwatch: Colors.teal,
            dialogBackgroundColor: color3,
            snackBarTheme: SnackBarThemeData(
              backgroundColor: color4.withOpacity(.7),
            ),
            textTheme: TextTheme(
                caption: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: color4,
                    fontFamily: 'NotoKufi'),
                button: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: color4,
                  fontFamily: 'NotoKufi',
                ),
                bodyText2: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: color4,
                  fontFamily: 'NotoKufi',
                ),
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: color3,
                  fontFamily: 'NotoKufi',
                )),
            scaffoldBackgroundColor: color6,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: color1.withOpacity(.7),
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: color2,
                selectedItemColor: color3),
            tabBarTheme: TabBarTheme(
              labelColor: color4,
              labelStyle: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoKufi',
              ),
              unselectedLabelStyle: TextStyle(
                color: color2,
                fontSize: 12.0,
                fontFamily: 'NotoKufi',
              ),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: color1.withOpacity(.7),
              toolbarHeight: 50,
              elevation: 0,
              backwardsCompatibility: false,
              iconTheme: IconThemeData(color: color4, size: 22),
              centerTitle: true,
              titleTextStyle: TextStyle(
                color: color4,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoKufi',
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: color2,
                  statusBarIconBrightness: Brightness.dark),
            ),
            cardTheme: CardTheme(
                color: color3.withOpacity(.9),
                elevation: 2,
                clipBehavior: Clip.antiAlias,
                shadowColor: color4,
                margin: EdgeInsetsDirectional.all(8)),
            fontFamily: 'NotoKufi',
          );
  }
}
