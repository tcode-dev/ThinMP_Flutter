import 'package:thinmpf/model/album_model.dart';
import 'package:thinmpf/model/song_model.dart';

class ArtistDetailViewModel {
  ArtistDetailViewModel({
    required this.albums,
    required this.songs,
  })  : id = albums.first.artistId,
        name = albums.first.artistName,
        description = '${albums.length} albums, ${songs.length} songs',
        imageId = albums.first.imageId;

  final String id;
  final String name;
  final String description;
  final String imageId;
  final List<AlbumModel> albums;
  final List<SongModel> songs;
}
