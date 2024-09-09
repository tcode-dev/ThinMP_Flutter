import 'package:realm/realm.dart';
import 'package:thinmpf/repository/base_repository.dart';

abstract class FavoriteRepository<T extends RealmObject> extends BaseRepository<T> {
  T createModel(String id, int order);

  void add(String id) {
    final model = createModel(id, incrementOrder());

    realm.write(() {
      realm.add(model);
    });
  }
}
