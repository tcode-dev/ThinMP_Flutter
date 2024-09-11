import 'package:thinmpf/model/album_model.dart';
import 'package:thinmpf/model/shortcut_model.dart';

class MainViewModel {
  MainViewModel({
    required this.shortcuts,
    required this.albums,
  });

  final List<ShortcutModel> shortcuts;
  final List<AlbumModel> albums;
}
