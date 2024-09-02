import 'package:realm/realm.dart';

part 'favorite_song_realm_model.realm.dart';

@RealmModel()
class _FavoriteSongRealmModel {
  @PrimaryKey()
  late String songId;

  late int order;
}
