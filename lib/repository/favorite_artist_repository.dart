import 'package:realm/realm.dart';
import 'package:thinmpf/model/realm/favorite_artist_realm_model.dart';
import 'package:thinmpf/repository/favorite_repository.dart';

class FavoriteArtistRepository extends FavoriteRepository<FavoriteArtistRealmModel> {
  @override
  Realm realm = Realm(Configuration.local([FavoriteArtistRealmModel.schema]));

  @override
  FavoriteArtistRealmModel createModel(String id) {
    return FavoriteArtistRealmModel(id, increment());
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
