import 'dart:math';
import 'package:thinmpf/constant/style_constant.dart';

int calcCrossAxisCount(screenWidth) {
  return max(screenWidth ~/ StyleConstant.grid.spanBaseSize, StyleConstant.grid.minSpanCount);
}
