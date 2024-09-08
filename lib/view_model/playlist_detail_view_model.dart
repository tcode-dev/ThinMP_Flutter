import 'package:thinmpf/model/song_model.dart';

class PlaylistDetailViewModel {
  PlaylistDetailViewModel({
    required this.id,
    required this.name,
    required this.imageId,
    required this.songs,
  });

  final String id;
  final String name;
  final String imageId;
  final List<SongModel> songs;
}
