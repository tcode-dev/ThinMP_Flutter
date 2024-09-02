import 'package:realm/realm.dart';
import 'package:thinmpf/model/realm/favorite_song_realm_model.dart';

class FavoriteSongRepository {
  final LocalConfiguration config = Configuration.local([FavoriteSongRealmModel.schema]);
  Realm? realm;

  void open() {
    realm = Realm(config);
  }

  void close() {
    realm?.close();
  }

  FavoriteSongRealmModel? findById(String id) {
    open();

    final favoriteSongRealmModel = realm?.find<FavoriteSongRealmModel>(id);

    close();

    return favoriteSongRealmModel;
  }

  bool exists(String id) {
    return findById(id) != null;
  }

  List<FavoriteSongRealmModel> getAll() {
    open();

    final favoriteSongRealmModels = realm?.all<FavoriteSongRealmModel>();

    close();

    return favoriteSongRealmModels?.toList() ?? [];
  }

  void add(String id) {
    open();

    final favoriteSongRealmModel = FavoriteSongRealmModel(id, 1);

    realm?.write(() {
      realm?.add(favoriteSongRealmModel);
    });

    close();
  }

  void delete(String id) {
    open();

    final model = realm?.find<FavoriteSongRealmModel>(id);

    if (model != null) {
      realm?.write(() {
        realm?.delete(model);
      });
    }

    close();
  }
}
