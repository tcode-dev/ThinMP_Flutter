// Package imports:
import 'package:realm/realm.dart';

// Project imports:
import 'package:thinmpf/repository/base_repository.dart';
import 'package:thinmpf/repository/mixin_repository.dart';

abstract class FavoriteRepository<T extends RealmObject> extends BaseRepository<T> with MixinRepository<T> {
  T createModel(String id, int order);

  bool exists(Object primaryKey) {
    return findById(primaryKey) != null;
  }

  void add(String id) {
    final model = createModel(id, increment());

    realm.write(() {
      realm.add(model);
    });
  }

  void update(List<String> ids) {
    truncate();

    final models = ids.asMap().entries.map((entry) {
      return createModel(entry.value, entry.key + 1);
    });

    realm.write(() {
      for (var model in models) {
        realm.add(model);
      }
    });
  }

  void toggle(String id) {
    if (exists(id)) {
      delete(id);
    } else {
      add(id);
    }
  }
}
