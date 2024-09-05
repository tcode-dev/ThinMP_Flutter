import 'package:realm/realm.dart';
import 'package:thinmpf/model/realm/favorite_song_realm_model.dart';
import 'package:thinmpf/repository/dto/favorite_song_dto.dart';
import 'package:thinmpf/extension/favorite_song_extension.dart';

class FavoriteSongRepository {
  final LocalConfiguration config = Configuration.local([FavoriteSongRealmModel.schema]);
  Realm? realm;

  void open() {
    realm = Realm(config);
  }

  void close() {
    realm?.close();
  }

  FavoriteSongDTO? findById(String id) {
    open();

    final model = realm?.find<FavoriteSongRealmModel>(id);
    final dto = model?.toDTO();

    close();

    return dto;
  }

  bool exists(String id) {
    return findById(id) != null;
  }

  List<FavoriteSongDTO> findAll() {
    open();
    try {
      final models = realm?.all<FavoriteSongRealmModel>();

      return models?.map((model) => model.toDTO()).toList() ?? [];
    } finally {
      close();
    }
  }

  void add(String id) {
    open();

    final model = FavoriteSongRealmModel(id, 1);

    realm?.write(() {
      realm?.add(model);
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
