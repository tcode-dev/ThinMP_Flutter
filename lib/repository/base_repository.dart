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

  T? findLatest() {
    return realm.query<T>('TRUEPREDICATE SORT(order DESC) LIMIT(1)').first;
  }

  void delete(Object primaryKey) {
    final model = findById(primaryKey);

    if (model != null) {
      realm.write(() {
        realm.delete(model);
      });
    }
  }
}
