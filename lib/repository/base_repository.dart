import 'package:realm/realm.dart';

abstract class BaseRepository<T extends RealmObject> {
  Realm get realm;

  void destroy() {
    realm.close();
  }

  T? findById(Object primaryKey) {
    return realm.find<T>(primaryKey);
  }

  List<T> findAll() {
    return realm.all<T>().toList();
  }

  bool exists(Object primaryKey) {
    return findById(primaryKey) != null;
  }

  void delete(Object primaryKey) {
    final model = findById(primaryKey);

    if (model != null) {
      realm.write(() {
        realm.delete(model);
      });
    }
  }

  int incrementOrder() {
    final models = realm.all<T>();

    return models.length + 1;
  }
}
