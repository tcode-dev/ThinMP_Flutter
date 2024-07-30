enum SizeConstant { tiny, small, medium, large }

enum StyleType { button, image, padding, radius }

const Map<StyleType, dynamic> styleConstant = {
  StyleType.button: {
    SizeConstant.small: 50,
    SizeConstant.medium: 75,
    SizeConstant.large: 100,
  },
  StyleType.image: {
    SizeConstant.small: 20,
    SizeConstant.medium: 30,
    SizeConstant.large: 40,
  },
  StyleType.padding: {
    SizeConstant.tiny: 5,
    SizeConstant.small: 10,
    SizeConstant.medium: 15,
    SizeConstant.large: 20,
  },
  StyleType.radius: 4,
};
