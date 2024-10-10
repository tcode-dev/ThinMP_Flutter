class SongModel {
  SongModel({
    required this.id,
    required this.name,
    required this.albumId,
    required this.albumName,
    required this.artistId,
    required this.artistName,
    required this.imageId,
    required this.duration,
    required this.trackNumber,
  });

  final String id;
  final String name;
  final String albumId;
  final String albumName;
  final String artistId;
  final String artistName;
  final String imageId;
  final double duration;
  final double trackNumber;
}
