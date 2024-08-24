import 'package:thinmpf/model/album_model.dart';
import 'package:thinmpf/model/song_model.dart';

class ArtistDetailViewModel {
  ArtistDetailViewModel({
    required this.id,
    required this.name,
    required this.imageId,
    required this.albums,
    required this.songs,
  }) : description = '${albums.length} albums, ${songs.length} songs';

  final String id;
  final String name;
  final String description;
  final String imageId;
  final List<AlbumModel> albums;
  final List<SongModel> songs;
}
