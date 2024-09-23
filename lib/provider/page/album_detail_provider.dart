import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/album_extension.dart';
import 'package:thinmpf/model/album_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'album_detail_provider.g.dart';

final _albumHostApi = AlbumHostApi();

@riverpod
class AlbumDetail extends _$AlbumDetail {
  @override
  AlbumModel? build() => null;

  Future<void> fetchAlbumDetail(String id) async {
    final album = await _albumHostApi.getAlbumById(id);
    
    state = album?.fromPigeon();
  }
}
