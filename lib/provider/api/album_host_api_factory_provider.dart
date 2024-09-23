import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'album_host_api_factory_provider.g.dart';

@riverpod
AlbumHostApi albumHostApiFactory(AlbumHostApiFactoryRef ref) {
  return AlbumHostApi();
}
