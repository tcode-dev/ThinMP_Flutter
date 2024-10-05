import 'dart:io';

import 'package:thinmpf/constant/platform_constant.dart';

T platformSelect<T>(Map<PlatformConstant, T> map) {
  if (Platform.isAndroid) {
    return map[PlatformConstant.android] as T;
  } else if (Platform.isIOS) {
    return map[PlatformConstant.ios] as T;
  } else {
    throw UnsupportedError('Unsupported platform');
  }
}
