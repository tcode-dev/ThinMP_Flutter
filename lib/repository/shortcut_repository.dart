// Package imports:
import 'package:realm/realm.dart';

// Project imports:
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

  void toggle(String id, ShortcutConstant type) {
    if (exists(id, type)) {
      delete(id, type);
    } else {
      add(id, type);
    }
  }

  void update(List<String> ids) {
    final idSet = ids.toSet();
    final models = findAll();
    final deleteModels = models.where((model) => !idSet.contains(model.id.toString())).toList();
    final updateModels = models.where((model) => idSet.contains(model.id.toString())).toList();
    final sortModels = ids.map((id) => updateModels.firstWhere((model) => model.id.toString() == id)).toList();

    realm.write(() {
      for (var model in deleteModels) {
        realm.delete(model);
      }

      sortModels.asMap().forEach((index, model) {
        model.order = index + 1;
      });
    });
  }

  void delete(String id, ShortcutConstant type) {
    final model = _find(id, type);

    if (model != null) {
      realm.write(() {
        realm.delete(model);
      });
    }
  }

  void deleteByIds(List<ObjectId> ids) {
    final models = ids.map((id) => findById(id));
    final filteredModels = models.where((model) => model != null).cast<ShortcutRealmModel>().toList();

    realm.write(() {
      for (var model in filteredModels) {
        realm.delete(model);
      }
    });
  }

  ShortcutRealmModel? _find(String id, ShortcutConstant type) {
    return realm.query<ShortcutRealmModel>(
      'itemId == \$0 AND type == \$1',
      [id, type.index],
    ).firstOrNull;
  }
}
