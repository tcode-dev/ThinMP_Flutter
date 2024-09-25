import 'package:realm/realm.dart';
import 'package:thinmpf/model/realm/playlist_realm_model.dart';
import 'package:thinmpf/repository/base_repository.dart';

class PlaylistRepository extends BaseRepository<PlaylistRealmModel> {
  @override
  Realm realm = Realm(Configuration.local([PlaylistRealmModel.schema]));

  @override
  PlaylistRealmModel? findById(Object primaryKey) {
    return super.findById(ObjectId.fromHexString(primaryKey as String));
  }

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

  void update(List<String> ids) {
    final models = findAll();
    final deleteModels = models.where((model) => !ids.contains(model.id.toString())).toList();
    final updateModels = models.where((model) => ids.contains(model.id.toString())).toList();
    final sortModels = ids.map((id) => updateModels.firstWhere((model) => model.id.toString() == id)).toList();

    realm.write(() {
      for (var model in deleteModels) {
        realm.delete(model);
      }

      sortModels.asMap().forEach((index, model) {
        model.order = index + 1;
      });
    });
  }

  List<PlaylistRealmModel> findAllSortedByAsc() {
    return realm.query<PlaylistRealmModel>('TRUEPREDICATE SORT(order ASC)').toList();
  }

  void _write(PlaylistRealmModel model, String songId) {
    realm.write(() {
      model.songIds.add(songId);
      realm.add(model);
    });
  }
}
