import 'package:thinmpf/model/album_model.dart';
import 'package:thinmpf/model/song_model.dart';

class ArtistDetailViewModel {
  ArtistDetailViewModel({
    required this.id,
    required this.name,
    required this.imageId,
    required List<AlbumModel> albumModels,
    required List<SongModel> songModels,
  }) : description = '${albumModels.length} albums, ${songModels.length} songs' {
    albums = _sortAlbums(albumModels);
    songs = _sortSongs(songModels);
  }

  final String id;
  final String name;
  final String description;
  final String imageId;
  late final List<AlbumModel> albums;
  late final List<SongModel> songs;

  List<AlbumModel> _sortAlbums(List<AlbumModel> albumModels) {
    List<AlbumModel> sortedList = List.from(albumModels);

    albumModels.sort((a, b) => a.name.compareTo(b.name));

    return sortedList;
  }

  List<SongModel> _sortSongs(List<SongModel> songs) {
    List<SongModel> sortedList = List.from(songs);

    sortedList.sort((a, b) {
      int albumNameComparison = a.albumName.compareTo(b.albumName);
      if (albumNameComparison != 0) {
        return albumNameComparison;
      }
      return a.trackNumber.compareTo(b.trackNumber);
    });

    return sortedList;
  }
}
