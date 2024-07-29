import 'dart:io';

import 'package:thinmpf/constant/target_platform_constant.dart';

T platformSelect<T>(Map<TargetPlatform, T> map) {
  if (Platform.isAndroid) {
    return map[TargetPlatform.android] as T;
  }

  if (Platform.isIOS) {
    return map[TargetPlatform.ios] as T;
  }

  throw UnsupportedError('Unsupported platform');
}
