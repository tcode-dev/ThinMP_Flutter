import 'package:realm/realm.dart';
import 'package:thinmpf/repository/base_repository.dart';

abstract class FavoriteRepository<T extends RealmObject> extends BaseRepository<T> {
  T createModel(String id);

  void add(String id) {
    final model = createModel(id);

    realm.write(() {
      realm.add(model);
    });
  }
}
