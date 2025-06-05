// Dart imports:
import 'dart:math';

// Project imports:
import 'package:thinmpf/constant/style_constant.dart';

int calcGridCount(screenWidth) {
  return max(screenWidth ~/ StyleConstant.grid.spanBaseSize, StyleConstant.grid.minSpanCount);
}
