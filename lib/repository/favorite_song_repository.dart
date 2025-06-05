// Package imports:
import 'package:realm/realm.dart';

// Project imports:
import 'package:thinmpf/model/realm/favorite_song_realm_model.dart';
import 'package:thinmpf/repository/favorite_repository.dart';

class FavoriteSongRepository extends FavoriteRepository<FavoriteSongRealmModel> {
  @override
  Realm realm = Realm(Configuration.local([FavoriteSongRealmModel.schema]));

  @override
  FavoriteSongRealmModel createModel(String id, int order) {
    return FavoriteSongRealmModel(id, order);
  }
}
