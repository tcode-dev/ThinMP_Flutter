// Package imports:
import 'package:realm/realm.dart';

// Project imports:
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
