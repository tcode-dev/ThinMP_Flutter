// Package imports:
import 'package:realm/realm.dart';

// Project imports:
import 'package:thinmpf/model/realm/favorite_artist_realm_model.dart';
import 'package:thinmpf/repository/favorite_repository.dart';

class FavoriteArtistRepository extends FavoriteRepository<FavoriteArtistRealmModel> {
  @override
  Realm realm = Realm(Configuration.local([FavoriteArtistRealmModel.schema]));

  @override
  FavoriteArtistRealmModel createModel(String id, int order) {
    return FavoriteArtistRealmModel(id, order);
  }
}
