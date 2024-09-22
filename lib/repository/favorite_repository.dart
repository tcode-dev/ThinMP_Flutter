import 'package:realm/realm.dart';
import 'package:thinmpf/repository/base_repository.dart';
import 'package:thinmpf/repository/mixin_repository.dart';

abstract class FavoriteRepository<T extends RealmObject> extends BaseRepository<T> with MixinRepository<T> {
  T createModel(String id);

  bool exists(Object primaryKey) {
    return findById(primaryKey) != null;
  }

  void add(String id) {
    final model = createModel(id);

    realm.write(() {
      realm.add(model);
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
