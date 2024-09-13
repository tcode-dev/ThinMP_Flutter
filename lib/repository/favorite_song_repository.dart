import 'package:realm/realm.dart';
import 'package:thinmpf/model/realm/favorite_song_realm_model.dart';
import 'package:thinmpf/repository/favorite_repository.dart';

class FavoriteSongRepository extends FavoriteRepository<FavoriteSongRealmModel> {
  @override
  Realm realm = Realm(Configuration.local([FavoriteSongRealmModel.schema]));

  @override
  FavoriteSongRealmModel createModel(String id) {
    return FavoriteSongRealmModel(id, increment());
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
