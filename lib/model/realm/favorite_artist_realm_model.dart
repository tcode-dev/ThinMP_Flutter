import 'package:realm/realm.dart';

part 'favorite_artist_realm_model.realm.dart';

@RealmModel()
class _FavoriteArtistRealmModel {
  @PrimaryKey()
  late String artistId;

  late int order;
}
