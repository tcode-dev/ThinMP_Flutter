import 'package:thinmpf/model/realm/favorite_song_realm_model.dart';
import 'package:thinmpf/repository/dto/favorite_song_dto.dart';

extension FavoriteSongRealmModelExtension on FavoriteSongRealmModel {
  FavoriteSongDTO toDTO() {
    return FavoriteSongDTO(
      songId: songId,
      order: order,
    );
  }
}
