import 'package:electronics_app/constants/colorres.dart';
import 'package:flutter/cupertino.dart';

Widget AppText({
  required String appText,
  TextStyle? style,
  TextAlign? textAlign,

})
{
  return Text(appText,
      textAlign: textAlign ?? TextAlign.center,
      style: style ??
          TextStyle(
            color: ColorRes.greyA0A4AB,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ));
}

TextStyle AppTextStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  TextDecoration? textDecoration,
}) {
  return TextStyle(
      decoration: textDecoration,
      color: color ?? ColorRes.greyA0A4AB,
      fontSize: fontSize ?? 13,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontStyle: fontStyle ?? FontStyle.normal);
}
