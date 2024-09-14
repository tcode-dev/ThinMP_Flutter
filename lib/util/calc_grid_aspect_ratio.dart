import 'package:thinmpf/constant/style_constant.dart';

double calcGridAspectRatio(screenWidth, count) {
  final gridWidth = (screenWidth - ((count + 1) * StyleConstant.padding.large)) / count;

  return gridWidth / (gridWidth + StyleConstant.row.contentBoxHeight);
}
