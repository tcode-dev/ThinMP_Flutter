import 'package:thinmpf/constant/style_constant.dart';

double calcChildAspectRatio(screenWidth, count) {
  final gridWidth = (screenWidth - ((count + 1) * styleConstant[StyleType.padding][SizeConstant.large])) / count;

  return gridWidth / (gridWidth + styleConstant[StyleType.height][SizeConstant.small]);
}
