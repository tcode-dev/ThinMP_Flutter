import 'package:realm/realm.dart';
import 'package:thinmpf/repository/base_repository.dart';

mixin MixinRepository<T extends RealmObject> on BaseRepository<T> {
  void delete(Object primaryKey) {
    final model = findById(primaryKey);

    if (model != null) {
      realm.write(() {
        realm.delete(model);
      });
    }
  }
}
