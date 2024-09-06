import 'package:realm/realm.dart';

abstract class FavoriteRepository<T extends RealmObject> {
  Realm get realm;

  T createModel(String id, int order);

  void destroy() {
    realm.close();
  }

  T? findById(String id) {
    return realm.find<T>(id);
  }

  bool exists(String id) {
    return findById(id) != null;
  }

  List<T> findAll() {
    return realm.all<T>().toList();
  }

  void add(String id) {
    final model = createModel(id, _incrementOrder());

    realm.write(() {
      realm.add(model);
    });
  }

  void delete(String id) {
    final model = findById(id);

    if (model != null) {
      realm.write(() {
        realm.delete(model);
      });
    }
  }

  int _incrementOrder() {
    final models = realm.all<T>();

    return models.length + 1;
  }
}
