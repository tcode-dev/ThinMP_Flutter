import 'package:flutter/services.dart';

Future<String> getTest() async {
  try {
    const MethodChannel channel = MethodChannel("dev.tcode.thinmpf/test");

    final result = await channel.invokeMethod("getTest");

    return result as String;
  } on PlatformException {
    return "getTest PlatformException";
  }
}
