import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:thinmpf/extension/artist_extension.dart';
import 'package:thinmpf/model/artist_model.dart';
import 'package:thinmpf/pigeon_output/audio.g.dart';

part 'artists_provider.g.dart';

final _api = ArtistHostApi();

@riverpod
class Artists extends _$Artists {
  @override
  List<ArtistModel> build() => [];

  Future<void> fetchAllArtists() async {
    final artists = await _api.getAllArtists();

    state = artists.map((artist) => artist.fromPigeon()).toList();
  }
}
