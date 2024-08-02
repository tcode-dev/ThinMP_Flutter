enum SizeConstant { tiny, small, medium, large }

enum StyleType { button, height, image, padding, radius }

const Map<StyleType, dynamic> styleConstant = {
  StyleType.button: {
    SizeConstant.small: 50.0,
    SizeConstant.medium: 75.0,
    SizeConstant.large: 100.0,
  },
  StyleType.height: {
    SizeConstant.small: 50.0,
  },
    StyleType.image: {
    SizeConstant.small: 40.0,
    SizeConstant.medium: 70.0,
    SizeConstant.large: 90.0,
  },
  StyleType.padding: {
    SizeConstant.tiny: 5.0,
    SizeConstant.small: 10.0,
    SizeConstant.medium: 15.0,
    SizeConstant.large: 20.0,
  },
  StyleType.radius: 4.0,
};
