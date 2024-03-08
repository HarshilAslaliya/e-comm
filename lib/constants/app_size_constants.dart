import 'package:flutter/material.dart';


class MyAppSize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? safeWidth;
  static double? safeHeight;

  static late double scaleFactorWidth;
  static late double scaleFactorHeight;
  static double? size282;

  //Custom sizes
  static double? size;
  static double? size0;

  static double? size1;
  static late double? size2;
  static late double? size3;
  static double? size4;
  static double? size5;
  static double? size6;
  static double? size7;
  static double? size8;
  static double? size10;
  static double? size20;
  static double? size79;
  static double? size150;
  static double? size280;
  static double? size750;
  static double? size700;
  static double? size500;
  static double? size450;
  static double? size448;
  static double? size58;
  static double? size60;
  static double? size56;
  static double? size36;
  static double? size100;
  static double? size290;
  static double? size330;
  static double? size300;
  static double? size480;
  static double? size748;
  static double? size620;
  static double? size615;
  static double? size190;
  static double? size200;
  static double? size210;
  static double? size410;
  static double? size470;
  static double? size490;
  static double? size240;
  static double? size495;
  static double? size195;
  static double? size65;
  static double? size275;
  static double? size85;
  static double? size50;
  static double? size55;
  static double? size45;
  static double? size900;
  static double? size970;
  static double? size170;
  static double? size140;
  static double? size160;


  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);

    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;

    double safeAreaWidth = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    double safeAreaHeight = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeWidth = (screenWidth - safeAreaWidth);
    safeHeight = (screenHeight - safeAreaHeight);

    safeWidth = (screenWidth - safeAreaWidth);
    safeHeight = (screenHeight - safeAreaHeight);

    scaleFactorHeight = (safeHeight! / 896);
    if (scaleFactorHeight < 1) {
      double diff = (1 - scaleFactorHeight) * (1 - scaleFactorHeight);
      scaleFactorHeight += diff;
    }

    scaleFactorWidth = (safeWidth! / 439);

    if (scaleFactorWidth < 1) {
      double diff = (1 - scaleFactorWidth) * (1 - scaleFactorWidth);
      scaleFactorWidth += diff;
    }

    //Custom sizes
    size = scaleFactorHeight * 0.94;
    size0 = 0;
    size1 = scaleFactorHeight * 1;
    size2 = scaleFactorHeight * 2;
    size3 = scaleFactorHeight * 3;
    size4 = scaleFactorHeight * 4;
    size5 = scaleFactorHeight * 5;
    size6 = scaleFactorHeight * 6;
    size7 = scaleFactorHeight * 7;
    size8 = scaleFactorHeight * 8;
    size10 = scaleFactorHeight * 10;
    size20 = scaleFactorHeight * 20;
    size750 = scaleFactorHeight * 775;
    size700 = scaleFactorHeight * 500;
    size500 = scaleFactorHeight * 700;
    size450 = scaleFactorHeight * 450;
    size448= scaleFactorHeight * 448;
    size150 = scaleFactorHeight * 150;
    size58 = scaleFactorHeight * 58;
    size36 = scaleFactorHeight * 36;
    size100 = scaleFactorHeight * 100;
    size290 = scaleFactorHeight * 290;
    size330 = scaleFactorHeight * 330;
    size300 = scaleFactorHeight * 300;
    size480 = scaleFactorHeight * 480;
    size748 = scaleFactorHeight * 748;
    size620 = scaleFactorHeight * 620;
    size615 = scaleFactorHeight * 615;
    size190 = scaleFactorHeight * 190;
    size200 = scaleFactorHeight * 200;
    size210 = scaleFactorHeight * 210;
    size410 = scaleFactorHeight * 410;
    size470 = scaleFactorHeight * 470;
    size490 = scaleFactorHeight * 490;
    size495 = scaleFactorHeight * 495;
    size56 = scaleFactorHeight * 56;
    size60 = scaleFactorHeight * 60;
    size85 = scaleFactorHeight * 85;
    size65 = scaleFactorHeight * 65;
    size275 = scaleFactorHeight * 275;
    size50 = scaleFactorHeight * 50;
    size55 = scaleFactorHeight * 55;
    size45 = scaleFactorHeight * 45;
    size900 = scaleFactorHeight * 900;
    size970 = scaleFactorHeight * 970;
    size170 = scaleFactorHeight * 170;
    size170 = scaleFactorHeight * 230;
    size140 = scaleFactorHeight * 140;
    size160 = scaleFactorHeight * 160;
    size280 = scaleFactorHeight * 280;





  }

  static double getScaledSizeWidth(double size) {
    return (size * scaleFactorWidth);
  }

  static double getScaledSizeHeight(double size) {
    return (size * scaleFactorHeight);
  }
}

class Spacing {
  static EdgeInsetsGeometry zero = EdgeInsets.zero;

  static EdgeInsetsGeometry only({double top = 0, double right = 0, double bottom = 0, double left = 0}) {
    return EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
  }

  static EdgeInsetsGeometry fromLTRB(double left, double top, double right, double bottom) {
    return Spacing.only(bottom: bottom, top: top, right: right, left: left);
  }

  static EdgeInsetsGeometry all(double spacing) {
    return Spacing.only(bottom: spacing, top: spacing, right: spacing, left: spacing);
  }

  static EdgeInsetsGeometry left(double spacing) {
    return Spacing.only(left: spacing);
  }

  static EdgeInsetsGeometry nLeft(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing, right: spacing);
  }

  static EdgeInsetsGeometry top(double spacing) {
    return Spacing.only(top: spacing);
  }

  static EdgeInsetsGeometry nTop(double spacing) {
    return Spacing.only(left: spacing, bottom: spacing, right: spacing);
  }

  static EdgeInsetsGeometry right(double spacing) {
    return Spacing.only(right: spacing);
  }

  static EdgeInsetsGeometry nRight(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing, left: spacing);
  }

  static EdgeInsetsGeometry bottom(double spacing) {
    return Spacing.only(bottom: spacing);
  }

  static EdgeInsetsGeometry nBottom(double spacing) {
    return Spacing.only(top: spacing, left: spacing, right: spacing);
  }

  static EdgeInsetsGeometry horizontal(double spacing) {
    return Spacing.only(left: spacing, right: spacing);
  }

  static x(double spacing) {
    return Spacing.only(left: spacing, right: spacing);
  }

  static xy(double xSpacing, double ySpacing) {
    return Spacing.only(left: xSpacing, right: xSpacing, top: ySpacing, bottom: ySpacing);
  }

  static y(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing);
  }

  static EdgeInsetsGeometry vertical(double spacing) {
    return Spacing.only(top: spacing, bottom: spacing);
  }

  static EdgeInsetsGeometry symmetric({double vertical = 0, double horizontal = 0}) {
    return Spacing.only(top: vertical, right: horizontal, left: horizontal, bottom: vertical);
  }

  static Widget height(double height) {
    return SizedBox(
      height: height,
    );
  }

  static Widget width(double width) {
    return SizedBox(
      width: width,
    );
  }
}

class Space {
  Space();

  static Widget height(double space) {
    return SizedBox(
      height: MyAppSize.getScaledSizeHeight(space),
    );
  }

  static Widget width(double space) {
    return SizedBox(
      width: MyAppSize.getScaledSizeHeight(space),
    );
  }
}

enum ShapeTypeFor { container, button }

class Shape {
  static dynamic circular(double radius, {ShapeTypeFor shapeTypeFor = ShapeTypeFor.container}) {
    BorderRadius borderRadius = BorderRadius.all(Radius.circular(MyAppSize.getScaledSizeHeight(radius)));

    switch (shapeTypeFor) {
      case ShapeTypeFor.container:
        return borderRadius;
      case ShapeTypeFor.button:
        return RoundedRectangleBorder(borderRadius: borderRadius);
    }
  }

  static dynamic circularTop(double radius, {ShapeTypeFor shapeTypeFor = ShapeTypeFor.container}) {
    BorderRadius borderRadius = BorderRadius.only(
        topLeft: Radius.circular(MyAppSize.getScaledSizeHeight(radius)),
        topRight: Radius.circular(MyAppSize.getScaledSizeHeight(radius)));
    switch (shapeTypeFor) {
      case ShapeTypeFor.container:
        return borderRadius;

      case ShapeTypeFor.button:
        return RoundedRectangleBorder(borderRadius: borderRadius);
    }
  }
}

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || false == o || "" == o;
}
