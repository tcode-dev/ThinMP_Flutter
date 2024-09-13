import 'package:realm/realm.dart';
import 'package:thinmpf/model/realm/playlist_realm_model.dart';
import 'package:thinmpf/repository/base_repository.dart';

class PlaylistRepository extends BaseRepository<PlaylistRealmModel> {
  @override
  Realm realm = Realm(Configuration.local([PlaylistRealmModel.schema]));

  void create(String name, String songId) {
    final model = PlaylistRealmModel(ObjectId(), name, increment());

    _write(model, songId);
  }

  void add(String playlistId, String songId) {
    final model = findById(playlistId);

    if (model == null) {
      return;
    }

    _write(model, songId);
  }

  void _write(PlaylistRealmModel model, String songId) {
    realm.write(() {
      model.songIds.add(songId);
      realm.add(model);
    });
  }

  int increment() {
    final latest = findLatest();

    if (latest != null) {
      return latest.order + 1;
    } else {
      return 1;
    }
  }
}
