// Package imports:
import 'package:realm/realm.dart';

part 'playlist_realm_model.realm.dart';

@RealmModel()
class _PlaylistRealmModel {
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late int order;
  late List<String> songIds;
}
