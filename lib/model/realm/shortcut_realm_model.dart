// Package imports:
import 'package:realm/realm.dart';

part 'shortcut_realm_model.realm.dart';

@RealmModel()
class _ShortcutRealmModel {
  @PrimaryKey()
  late ObjectId id;
  late String itemId;
  late int type;
  late int order;
}
