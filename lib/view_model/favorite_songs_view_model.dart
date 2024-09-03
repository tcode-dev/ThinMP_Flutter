import 'package:thinmpf/model/song_model.dart';

class FavoriteSongsViewModel {
  final List<SongModel> songs;
  final List<String> songIds;

  FavoriteSongsViewModel({
    required this.songs,
    required this.songIds,
  });
}
