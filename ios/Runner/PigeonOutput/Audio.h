// Autogenerated from Pigeon (v16.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class Song;
@class Album;

@interface Song : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithId:(NSString *)id
    title:(NSString *)title
    artist:(NSString *)artist
    imageId:(NSString *)imageId
    duration:(double )duration;
@property(nonatomic, copy) NSString * id;
@property(nonatomic, copy) NSString * title;
@property(nonatomic, copy) NSString * artist;
@property(nonatomic, copy) NSString * imageId;
@property(nonatomic, assign) double  duration;
@end

@interface Album : NSObject
/// `init` unavailable to enforce nonnull fields, see the `make` class method.
- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)makeWithId:(NSString *)id
    title:(NSString *)title
    artist:(NSString *)artist
    imageId:(NSString *)imageId;
@property(nonatomic, copy) NSString * id;
@property(nonatomic, copy) NSString * title;
@property(nonatomic, copy) NSString * artist;
@property(nonatomic, copy) NSString * imageId;
@end

/// The codec used by AlbumHostApi.
NSObject<FlutterMessageCodec> *AlbumHostApiGetCodec(void);

/// HostApi
@protocol AlbumHostApi
/// @return `nil` only when `error != nil`.
- (nullable NSArray<Album *> *)getAllAlbumsWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpAlbumHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<AlbumHostApi> *_Nullable api);

/// The codec used by ArtworkHostApi.
NSObject<FlutterMessageCodec> *ArtworkHostApiGetCodec(void);

@protocol ArtworkHostApi
- (void)queryArtworkId:(NSString *)id completion:(void (^)(FlutterStandardTypedData *_Nullable, FlutterError *_Nullable))completion;
@end

extern void SetUpArtworkHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<ArtworkHostApi> *_Nullable api);

/// The codec used by PlayerHostApi.
NSObject<FlutterMessageCodec> *PlayerHostApiGetCodec(void);

@protocol PlayerHostApi
- (void)startAllSongsIndex:(NSInteger)index error:(FlutterError *_Nullable *_Nonnull)error;
- (void)playWithError:(FlutterError *_Nullable *_Nonnull)error;
- (void)pauseWithError:(FlutterError *_Nullable *_Nonnull)error;
- (void)prevWithError:(FlutterError *_Nullable *_Nonnull)error;
- (void)nextWithError:(FlutterError *_Nullable *_Nonnull)error;
- (void)seekTime:(double)time error:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable NSNumber *)getCurrentTimeWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpPlayerHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PlayerHostApi> *_Nullable api);

/// The codec used by SongHostApi.
NSObject<FlutterMessageCodec> *SongHostApiGetCodec(void);

@protocol SongHostApi
/// @return `nil` only when `error != nil`.
- (nullable NSArray<Song *> *)getAllSongsWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpSongHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<SongHostApi> *_Nullable api);

/// The codec used by PlayerFlutterApi.
NSObject<FlutterMessageCodec> *PlayerFlutterApiGetCodec(void);

/// FlutterApi
@interface PlayerFlutterApi : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
- (void)onIsPlayingChangeIsPlaying:(BOOL)isPlaying completion:(void (^)(FlutterError *_Nullable))completion;
- (void)onPlaybackSongChangeSong:(Song *)song completion:(void (^)(FlutterError *_Nullable))completion;
@end

NS_ASSUME_NONNULL_END
