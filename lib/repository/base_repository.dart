import 'package:realm/realm.dart';

abstract class BaseRepository<T extends RealmObject> {
  Realm get realm;

  void dispose() {
    realm.close();
  }

  T? findById(Object primaryKey) {
    return realm.find<T>(primaryKey);
  }

  List<T> findAll() {
    return realm.all<T>().toList();
  }

  void truncate() {
    realm.write(() {
      realm.deleteAll<T>();
    });
  }

  int increment() {
    final results = realm.query<T>('TRUEPREDICATE SORT(order DESC) LIMIT(1)');

    if (results.isNotEmpty) {
      final result = results.first;
      final json = result.toEJson();

      if (json != null && json is Map<String, dynamic>) {
        final fieldValue = json['order'];

        if (fieldValue != null && fieldValue.containsKey('\$numberInt')) {
          final intValue = int.parse(fieldValue['\$numberInt']);

          return intValue + 1;
        }
      }
    }

    return 1;
  }
}
