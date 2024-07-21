import 'dart:io';

T platformSelect<T>(Map<String, T> map) {
  if (Platform.isAndroid) {
    return map['android']!;
  } else {
    return map['ios']!;
  }
}
