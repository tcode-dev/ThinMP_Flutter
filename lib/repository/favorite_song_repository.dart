import 'package:realm/realm.dart';
import 'package:thinmpf/model/realm/favorite_song_realm_model.dart';
import 'package:thinmpf/repository/dto/favorite_song_dto.dart';
import 'package:thinmpf/extension/favorite_song_extension.dart';

class FavoriteSongRepository {
  final Realm realm = Realm(Configuration.local([FavoriteSongRealmModel.schema]));

  void destroy() {
    realm.close();
  }

  FavoriteSongDTO? findById(String id) {
    final model = realm.find<FavoriteSongRealmModel>(id);
    final dto = model?.toDTO();

    return dto;
  }

  bool exists(String id) {
    return findById(id) != null;
  }

  List<FavoriteSongRealmModel> findAll() {
    return realm.all<FavoriteSongRealmModel>().toList();
  }

  void add(String id) {
    final model = FavoriteSongRealmModel(id, _incrementOrder());

    realm.write(() {
      realm.add(model);
    });
  }

  void delete(String id) {
    final model = realm.find(id);

    if (model != null) {
      realm.write(() {
        realm.delete(model);
      });
    }
  }

  int _incrementOrder() {
    final models = realm.all<FavoriteSongRealmModel>();

    return models.length + 1;
  }
}
