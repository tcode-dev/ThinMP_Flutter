import 'package:flutter/services.dart';

Future<String> getTest() async {
  const MethodChannel channel = MethodChannel("dev.tcode.thinmpf/test");

  return await channel.invokeMethod("getTest");
}