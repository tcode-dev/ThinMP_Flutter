// Autogenerated from Pigeon (v16.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class Song;

@interface Song : NSObject
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

/// The codec used by PlayerHostApi.
NSObject<FlutterMessageCodec> *PlayerHostApiGetCodec(void);

@protocol PlayerHostApi
- (void)startBySongsIndex:(NSInteger)index error:(FlutterError *_Nullable *_Nonnull)error;
- (void)playWithError:(FlutterError *_Nullable *_Nonnull)error;
- (void)stopWithError:(FlutterError *_Nullable *_Nonnull)error;
/// @return `nil` only when `error != nil`.
- (nullable Song *)getCurrentSongWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpPlayerHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<PlayerHostApi> *_Nullable api);

/// The codec used by PlayerFlutterApi.
NSObject<FlutterMessageCodec> *PlayerFlutterApiGetCodec(void);

@interface PlayerFlutterApi : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
- (void)onSongChangeSong:(Song *)song completion:(void (^)(FlutterError *_Nullable))completion;
- (void)onPlaybackStateChangeIsPlaying:(BOOL)isPlaying completion:(void (^)(FlutterError *_Nullable))completion;
@end

NS_ASSUME_NONNULL_END
