import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thinmpf/constant/style_constant.dart';

void setOrientation(BuildContext context) {
  var shortestSide = MediaQuery.of(context).size.shortestSide;
  var isTablet = shortestSide > StyleConstant.orientation.tabletBreakpoint;

  if (isTablet) {
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
