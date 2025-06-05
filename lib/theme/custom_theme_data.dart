// Flutter imports:
import 'package:flutter/material.dart';

extension CustomThemeData on ThemeData {
  Color get transparent {
    return brightness == Brightness.light ? const Color(0x00ffffff) : const Color(0x00000000);
  }
}
