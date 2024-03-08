import 'package:electronics_app/constants/colorres.dart';
import 'package:flutter/material.dart';

Widget CommomContainer(
    {Widget? child,
    Function? onTap,
    // Color? bttxtColo,
    // Color? bgColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    String? fontFamily,
    Decoration? decoration,
    double? borderRadius,
    TextStyle? textstyle}) {
  return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        padding: padding??EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        margin: margin??EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        decoration: decoration ??
            BoxDecoration(
                border: Border.all(color: ColorRes.whiteE8F1FF),
                borderRadius: BorderRadius.circular(borderRadius ?? 15),
                color: ColorRes.white),
        height: height ?? 55,
        width: width ?? double.infinity,
        child: child ?? const Center(),
      ));
}

Widget appBorderButton(
    {required String btnText,
    Function? onTap,
    Color? bttxtColo,
    Color? bgColor,
    Color? borderColor,
    double? width,
    double? height,
    String? fontFamily,
    double? borderRadius,
    TextStyle? textstyle,
    Widget? child}) {
  return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        height: height ?? 55,
        width: width ?? double.infinity,
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: ColorRes.blue,
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            border: Border.all(color: borderColor ?? ColorRes.white)),
        child: Center(
            child: child ??
                FittedBox(
                  child: Text(
                    btnText,
                    style: textstyle ??
                        const TextStyle(
                            fontSize: 16,
                            color: ColorRes.white,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal),
                  ),
                )),
      ));





}
Widget lastContainer(){
  return  Center(
  child: Container(
  height: 5,
width: 134,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(10),
color: ColorRes.grey979797),
),
);
}