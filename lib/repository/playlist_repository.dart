import 'package:realm/realm.dart';
import 'package:thinmpf/model/realm/playlist_realm_model.dart';

class PlaylistRepository {
  final Realm realm = Realm(Configuration.local([PlaylistRealmModel.schema]));

  void destroy() {
    realm.close();
  }

  PlaylistRealmModel? findById(String id) {
    return realm.find<PlaylistRealmModel>(ObjectId.fromHexString(id));
  }

  bool exists(String id) {
    return findById(id) != null;
  }

  List<PlaylistRealmModel> findAll() {
    return realm.all<PlaylistRealmModel>().toList();
  }

  void create(String name, String songId) {
    final model = PlaylistRealmModel(ObjectId(), name, _incrementOrder());

    model.songIds.add(songId);

    realm.write(() {
      realm.add(model);
    });
  }

  void add(String playlistId, String songId) {
    final model = findById(playlistId);

    if (model == null) {
      return;
    }

    realm.write(() {
      model.songIds.add(songId);
      realm.add(model);
    });
  }

  void delete(String id) {
    final model = findById(id);

    if (model == null) {
      return;
    }

    realm.write(() {
      realm.delete(model);
    });
  }

  int _incrementOrder() {
    final models = realm.all<PlaylistRealmModel>();

    return models.length + 1;
  }
}
