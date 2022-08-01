import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navTo(context, Widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}

void navToAndFinish(context, Widget) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => Widget), (route) {
    return false;
  });
}

Widget customTextFormField(
    {required TextEditingController controller,
    required TextInputType inputType,
    required Widget prefixIcon,
    Widget? suffixIcon,
    String? labelText,
    TextStyle? labelStyle,
    required TextStyle style,
    Color? borderColor,
    BorderRadius? borderRadius,
    BorderRadius? focusedBorderRadius,
    Color? focusedBorderColor,
    FormFieldValidator<String>? validator,
    bool? obscureText}) {
  return Container(
    height: 70,
    child: TextFormField(
      style: style,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ?? SizedBox(),
        labelText: labelText,
        labelStyle: labelStyle,
        border: OutlineInputBorder(
          borderRadius: borderRadius!,
          borderSide: BorderSide(
            color: borderColor!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: focusedBorderRadius!,
          borderSide: BorderSide(
            color: focusedBorderColor!,
          ),
        ),
      ),
      validator: validator ??
          (val) {
            return null;
          },
      obscureText: obscureText ?? false,
    ),
  );
}
