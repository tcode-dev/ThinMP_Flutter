import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/album_extension.dart';
import 'package:thinmpf/model/media/album_model.dart';
import 'package:thinmpf/provider/api/album_host_api_factory_provider.dart';

part 'album_detail_provider.g.dart';

@riverpod
class AlbumDetail extends _$AlbumDetail {
  @override
  AlbumModel? build() => null;

  Future<void> fetchAlbumDetail(String id) async {
    final albumHostApi = ref.read(albumHostApiFactoryProvider);
    final album = await albumHostApi.getAlbumById(id);

    state = album?.fromPigeon();
  }
}
