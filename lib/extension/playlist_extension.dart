// Project imports:
import 'package:thinmpf/model/media/playlist_model.dart';
import 'package:thinmpf/model/playlist_entity.dart';

extension PlaylistEntityExtension on PlaylistEntity {
  PlaylistModel toPlaylistModel() {
    return PlaylistModel(
      id: id,
      name: name,
    );
  }
}
