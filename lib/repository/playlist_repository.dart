// Package imports:
import 'package:realm/realm.dart';

// Project imports:
import 'package:thinmpf/model/realm/playlist_realm_model.dart';
import 'package:thinmpf/repository/base_repository.dart';

class PlaylistRepository extends BaseRepository<PlaylistRealmModel> {
  @override
  Realm realm = Realm(Configuration.local([PlaylistRealmModel.schema]));

  @override
  PlaylistRealmModel? findById(Object primaryKey) {
    return super.findById(ObjectId.fromHexString(primaryKey as String));
  }

  bool exists(String playlistId, String songId) {
    final model = findById(playlistId);

    if (model == null) {
      return false;
    }

    return model.songIds.contains(songId);
  }

  void create(String name, String songId) {
    final model = PlaylistRealmModel(ObjectId(), name, increment());

    realm.write(() {
      model.songIds.add(songId);
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
    });
  }

  void updatePlaylists(List<String> ids) {
    final idSet = ids.toSet();
    final models = findAll();
    final deleteModels = models.where((model) => !idSet.contains(model.id.toString())).toList();
    final updateModels = models.where((model) => idSet.contains(model.id.toString())).toList();
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

  void updatePlaylistDetail(String playlistId, String name, List<String> songIds) {
    final model = findById(playlistId);

    if (model == null) {
      return;
    }

    realm.write(() {
      model.name = name;
      model.songIds.clear();
      model.songIds.addAll(songIds);
    });
  }

  void delete(String playlistId) {
    final model = findById(playlistId);

    if (model != null) {
      realm.write(() {
        realm.delete(model);
      });
    }
  }
}
