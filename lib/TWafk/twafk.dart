import 'package:flutter/material.dart';

import '../Style/Colors/colors.dart';
class Twafk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color6,
      appBar: AppBar(
        backgroundColor: color6
        ,
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/learn.jpg'),
            Image.asset('assets/images/learn2.jpeg'),
          ],
        ),
      ),
    );
  }
}
