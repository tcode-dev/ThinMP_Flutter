import 'package:thinmpf/model/song_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

extension SongExtension on Song? {
  SongModel fromPigeon() {
    return SongModel(
      id: this!.id,
      name: this!.name,
      artistName: this!.artistName,
      imageId: this!.imageId,
      duration: this!.duration,
      albumId: this!.albumId,
      albumName: this!.albumName,
      artistId: this!.artistId,
      trackNumber: this!.trackNumber,
    );
  }
}
