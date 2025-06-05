// Project imports:
import 'package:thinmpf/model/media/playlist_model.dart';
import 'package:thinmpf/model/realm/playlist_realm_model.dart';

extension PlaylistRealmModelExtension on PlaylistRealmModel {
  PlaylistModel fromRealm() {
    return PlaylistModel(
      id: id.toString(),
      name: name,
    );
  }
}
