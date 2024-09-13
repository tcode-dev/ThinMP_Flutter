import 'package:realm/realm.dart';
import 'package:thinmpf/constant/shortcut_item_type.dart';
import 'package:thinmpf/model/realm/shortcut_realm_model.dart';
import 'package:thinmpf/repository/base_repository.dart';

class ShortcutRepository extends BaseRepository<ShortcutRealmModel> {
  @override
  Realm realm = Realm(Configuration.local([ShortcutRealmModel.schema]));

  void add(String id, ShortcutItemType type) {
    final model = ShortcutRealmModel(ObjectId(), id, type.index, increment());

    realm.write(() {
      realm.add(model);
    });
  }

  List<ShortcutRealmModel> findAllSortedByDesc() {
    return realm.query<ShortcutRealmModel>('TRUEPREDICATE SORT(order DESC)').toList();
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
