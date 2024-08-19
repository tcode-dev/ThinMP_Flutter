import 'package:thinmpf/model/artist_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

extension ArtistExtension on Artist? {
  ArtistModel fromPigeon() {
    return ArtistModel(
      id: this!.id,
      name: this!.name,
    );
  }
}
