class StyleConstant {
  static ButtonValue button = ButtonValue();
  static GridValue grid = GridValue();
  static HeightValue height = HeightValue();
  static ImageValue image = ImageValue();
  static OpacityValue opacity = OpacityValue();
  static PaddingValue padding = PaddingValue();
  static RadiusValue radius = RadiusValue();
}

class ButtonValue {
  final double small = 50.0;
  final double medium = 75.0;
  final double large = 100.0;
}

class GridValue {
  final int minSpanCount = 2;
  final int spanBaseSize = 200;
}

class HeightValue {
  final double borderBox = 51.0;
  final double contentBox = 50.0;
}

class ImageValue {
  final double tiny = 40.0;
  final double small = 44.0;
  final double medium = 70.0;
  final double large = 90.0;
}

class OpacityValue {
  final double off = 0.5;
  final double on = 1.0;
}

class PaddingValue {
  final double tiny = 5.0;
  final double small = 10.0;
  final double medium = 15.0;
  final double large = 20.0;
}

class RadiusValue {
  final double small = 4.0;
}
