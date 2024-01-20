import 'package:flutter/services.dart';

Future<List<String>> getSongs() async {
  try {
    const MethodChannel channel = MethodChannel("dev.tcode.thinmpf/test");

    final List<dynamic>? result = await channel.invokeMethod<List<dynamic>>("getSongs");

    return result?.cast().map<String>((d) => d.toString()).toList() ?? <String>[];
  } on PlatformException {
    return ["getTest PlatformException"];
  }
}
