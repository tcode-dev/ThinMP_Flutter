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
    final result = realm.query<T>('TRUEPREDICATE SORT(order DESC) LIMIT(1)');

    return result.isNotEmpty ? result.first : null;
  }

  int increment() {
    final latest = findLatest();

    if (latest != null) {
      final json = latest.toEJson();
      if (json != null && json is Map<String, dynamic>) {
        final fieldValue = json['order'];
        if (fieldValue != null) {
          return fieldValue + 1;
        }
      }
    }
    return 1;
  }
}
