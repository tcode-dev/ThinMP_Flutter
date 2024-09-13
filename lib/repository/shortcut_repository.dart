import 'package:realm/realm.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/model/realm/shortcut_realm_model.dart';

class ShortcutRepository {
  Realm realm = Realm(Configuration.local([ShortcutRealmModel.schema]));

  void destroy() {
    realm.close();
  }

  List<ShortcutRealmModel> findAll() {
    return realm.all<ShortcutRealmModel>().toList();
  }

  ShortcutRealmModel? findLatest() {
    return realm.query<ShortcutRealmModel>('TRUEPREDICATE SORT(order DESC) LIMIT(1)').first;
  }

  bool exists(String id, ShortcutItemType type) {
    return realm.query<ShortcutRealmModel>(
      'itemId == \$0 AND type == \$1',
      [id, type.index],
    ).isNotEmpty;
  }

  void add(String id, ShortcutItemType type) {
    final model = ShortcutRealmModel(ObjectId(), id, type.index, increment());

    realm.write(() {
      realm.add(model);
    });
  }

  List<ShortcutRealmModel> findAllSortedByDesc() {
    return realm.query<ShortcutRealmModel>('TRUEPREDICATE SORT(order DESC)').toList();
  }

  void delete(String id, ShortcutItemType type) {
    final models = realm.query<ShortcutRealmModel>(
      'itemId == \$0 AND type == \$1',
      [id, type.index],
    );

    if (models.isNotEmpty) {
      realm.write(() {
        realm.delete(models.first);
      });
    }
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
