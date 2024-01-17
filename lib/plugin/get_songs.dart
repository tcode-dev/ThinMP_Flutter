import 'package:path_provider/path_provider.dart';

  Future<List<String>> getSongs() async {
    final dir = await getExternalStorageDirectory();

    return dir!
        .listSync()
        .map((item) => item.path)
        .where((item) => item.endsWith(".mp3"))
        .toList(growable: false);
  }
