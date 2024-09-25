import 'package:realm/realm.dart';
import 'package:thinmpf/constant/shortcut_constant.dart';
import 'package:thinmpf/model/realm/shortcut_realm_model.dart';
import 'package:thinmpf/repository/base_repository.dart';

class ShortcutRepository extends BaseRepository<ShortcutRealmModel> {
  @override
  Realm realm = Realm(Configuration.local([ShortcutRealmModel.schema]));

  bool exists(String id, ShortcutConstant type) {
    return _find(id, type) != null;
  }

  void add(String id, ShortcutConstant type) {
    final model = ShortcutRealmModel(ObjectId(), id, type.index, increment());

    realm.write(() {
      realm.add(model);
    });
  }

  void toggleShortcut(String id, ShortcutConstant type) {
    if (exists(id, type)) {
      delete(id, type);
    } else {
      add(id, type);
    }
  }

  void delete(String id, ShortcutConstant type) {
    final model = _find(id, type);

    if (model != null) {
      realm.write(() {
        realm.delete(model);
      });
    }
  }

  ShortcutRealmModel? _find(String id, ShortcutConstant type) {
    return realm.query<ShortcutRealmModel>(
      'itemId == \$0 AND type == \$1',
      [id, type.index],
    ).firstOrNull;
  }
}
