// Project imports:
import 'package:thinmpf/model/media/album_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

extension AlbumExtension on AlbumDTO? {
  AlbumModel fromPigeon() {
    return AlbumModel(
      id: this!.id,
      name: this!.name,
      artistId: this!.artistId,
      artistName: this!.artistName,
      imageId: this!.imageId,
    );
  }
}
