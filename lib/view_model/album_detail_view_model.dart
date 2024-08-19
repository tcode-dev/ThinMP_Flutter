import 'package:thinmpf/model/song_model.dart';

class AlbumDetailViewModel {
  AlbumDetailViewModel({
    required this.id,
    required this.name,
    required this.artistId,
    required this.artistName,
    required this.imageId,
    required this.songs,
  });

  final String id;
  final String name;
  final String artistId;
  final String artistName;
  final String imageId;
  final List<SongModel> songs;
}
