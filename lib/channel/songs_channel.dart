import 'package:flutter/services.dart';

Future<String> getSongs() async {
  try {
    const MethodChannel channel = MethodChannel("dev.tcode.thinmpf/test");

    final result = await channel.invokeMethod("getSongs");

    return result as String;
  } on PlatformException {
    return "getTest PlatformException";
  }
}
