import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thinmpf/constant/style_constant.dart';

bool isTabletDevice(BuildContext context) {
  return MediaQuery.of(context).size.shortestSide > StyleConstant.orientation.tabletBreakpoint;
}

// 縦向き
bool isPortrait(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.portrait;
}

// 横向き
bool isLandscape(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.landscape;
}

void setOrientation(BuildContext context) {
  if (isTabletDevice(context)) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  } else {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
