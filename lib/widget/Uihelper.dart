import 'package:flutter/material.dart';

class UiHelper {
  static Widget customImage({required String img, double width = 24, double height = 24}) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset("assets/images/$img", fit: BoxFit.contain),
    );
  }

  static Widget CustomText({
    required String text,
    required Color color,
    required FontWeight fontWeight,
    String? fontFamily,
    required double fontSize,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily ?? "regular",
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
