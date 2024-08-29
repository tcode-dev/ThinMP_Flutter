// Autogenerated from Pigeon (v21.1.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, RepeatMode) {
  RepeatModeOff = 0,
  RepeatModeOne = 1,
  RepeatModeAll = 2,
};

/// Wrapper for RepeatMode to allow for nullability.
@interface RepeatModeBox : NSObject
@property(nonatomic, assign) RepeatMode value;
- (instancetype)initWithValue:(RepeatMode)value;
@end

typedef NS_ENUM(NSUInteger, ShuffleMode) {
  ShuffleModeOff = 0,
  ShuffleModeOn = 1,
};

/// Wrapper for ShuffleMode to allow for nullability.
@interface ShuffleModeBox : NSObject
@property(nonatomic, assign) ShuffleMode value;
- (instancetype)initWithValue:(ShuffleMode)value;
@end

@class Song;
@class Album;
@class Artist;
@class ArtistDetail;

@interface Song : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithId:(NSString *)id
    name:(NSString *)name
    albumId:(NSString *)albumId
    albumName:(NSString *)albumName
    artistId:(NSString *)artistId
    artistName:(NSString *)artistName
    imageId:(NSString *)imageId
    duration:(double )duration
    trackNumber:(double )trackNumber;
@property(nonatomic, copy) NSString * id;
@property(nonatomic, copy) NSString * name;
@property(nonatomic, copy) NSString * albumId;
@property(nonatomic, copy) NSString * albumName;
@property(nonatomic, copy) NSString * artistId;
@property(nonatomic, copy) NSString * artistName;
@property(nonatomic, copy) NSString * imageId;
@property(nonatomic, assign) double  duration;
@property(nonatomic, assign) double  trackNumber;
@end

@interface Album : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithId:(NSString *)id
    name:(NSString *)name
    artistId:(NSString *)artistId
    artistName:(NSString *)artistName
    imageId:(NSString *)imageId;
@property(nonatomic, copy) NSString * id;
@property(nonatomic, copy) NSString * name;
@property(nonatomic, copy) NSString * artistId;
@property(nonatomic, copy) NSString * artistName;
@property(nonatomic, copy) NSString * imageId;
@end

@interface Artist : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithId:(NSString *)id
    name:(NSString *)name;
@property(nonatomic, copy) NSString * id;
@property(nonatomic, copy) NSString * name;
@end

@interface ArtistDetail : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithId:(NSString *)id
    name:(NSString *)name
    imageId:(NSString *)imageId;
@property(nonatomic, copy) NSString * id;
@property(nonatomic, copy) NSString * name;
@property(nonatomic, copy) NSString * imageId;
@end

/// The codec used by all APIs.
NSObject<FlutterMessageCodec> *nullGetAudioCodec(void);

///
/// HostApi
///
@protocol SongHostApi
/// @return `nil` only when `error != nil`.
- (nullable NSArray<Song *> *)getAllSongsWithError:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable NSArray<Song *> *)getSongsByAlbumIdAlbumId:(NSString *)albumId error:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable NSArray<Song *> *)getSongsByArtistIdArtistId:(NSString *)artistId error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpSongHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<SongHostApi> *_Nullable api);

extern void SetUpSongHostApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<SongHostApi> *_Nullable api, NSString *messageChannelSuffix);


@protocol AlbumHostApi
/// @return `nil` only when `error != nil`.
- (nullable NSArray<Album *> *)getAllAlbumsWithError:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable NSArray<Album *> *)getAlbumsByArtistIdArtistId:(NSString *)artistId error:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable NSArray<Album *> *)getRecentAlbumsCount:(NSInteger)count error:(FlutterError *_Nullable *_Nonnull)error;
- (nullable Album *)getAlbumByIdId:(NSString *)id error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpAlbumHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<AlbumHostApi> *_Nullable api);

extern void SetUpAlbumHostApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<AlbumHostApi> *_Nullable api, NSString *messageChannelSuffix);


@protocol ArtistHostApi
/// @return `nil` only when `error != nil`.
- (nullable NSArray<Artist *> *)getAllArtistsWithError:(FlutterError *_Nullable *_Nonnull)error;
- (nullable ArtistDetail *)getArtistDetailByIdId:(NSString *)id error:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpArtistHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<ArtistHostApi> *_Nullable api);

extern void SetUpArtistHostApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<ArtistHostApi> *_Nullable api, NSString *messageChannelSuffix);


@protocol ArtworkHostApi
- (void)getArtworkId:(NSString *)id completion:(void (^)(FlutterStandardTypedData *_Nullable, FlutterError *_Nullable))completion;
@end

extern void SetUpArtworkHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<ArtworkHostApi> *_Nullable api);

extern void SetUpArtworkHostApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<ArtworkHostApi> *_Nullable api, NSString *messageChannelSuffix);


@protocol PlayerHostApi
- (void)startAllSongsIndex:(NSInteger)index error:(FlutterError *_Nullable *_Nonnull)error;
- (void)startAlbumSongsIndex:(NSInteger)index albumId:(NSString *)albumId error:(FlutterError *_Nullable *_Nonnull)error;
- (void)startArtistSongsIndex:(NSInteger)index artistId:(NSString *)artistId error:(FlutterError *_Nullable *_Nonnull)error;
- (void)playWithError:(FlutterError *_Nullable *_Nonnull)error;
- (void)pauseWithError:(FlutterError *_Nullable *_Nonnull)error;
- (void)prevWithError:(FlutterError *_Nullable *_Nonnull)error;
- (void)nextWithError:(FlutterError *_Nullable *_Nonnull)error;
- (void)seekTime:(double)time error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setRepeatRepeatMode:(RepeatMode)repeatMode error:(FlutterError *_Nullable *_Nonnull)error;
- (void)setShuffleShuffleMode:(ShuffleMode)shuffleMode error:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable NSNumber *)getCurrentTimeWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpPlayerHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PlayerHostApi> *_Nullable api);

extern void SetUpPlayerHostApiWithSuffix(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PlayerHostApi> *_Nullable api, NSString *messageChannelSuffix);


///
/// FlutterApi
///
@interface PlayerFlutterApi : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger messageChannelSuffix:(nullable NSString *)messageChannelSuffix;
- (void)onIsPlayingChangeIsPlaying:(BOOL)isPlaying completion:(void (^)(FlutterError *_Nullable))completion;
- (void)onPlaybackSongChangeSong:(Song *)song completion:(void (^)(FlutterError *_Nullable))completion;
@end

NS_ASSUME_NONNULL_END
