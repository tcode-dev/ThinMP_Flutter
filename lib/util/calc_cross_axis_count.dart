import 'dart:math';
import 'package:thinmpf/constant/style_constant.dart';

int calcCrossAxisCount(screenWidth) {
  return max(screenWidth ~/ styleConstant[StyleType.grid]["spanBaseSize"], styleConstant[StyleType.grid]["minSpanCount"]);
}
