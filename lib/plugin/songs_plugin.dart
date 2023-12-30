import 'package:flutter/services.dart';

Future<String> getTest() async {
  const MethodChannel channel = MethodChannel("Channel");
  String? resultText = await channel.invokeMethod("test");
  return resultText ?? "null";
}