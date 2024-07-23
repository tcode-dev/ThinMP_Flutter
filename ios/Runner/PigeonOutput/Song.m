// Autogenerated from Pigeon (v16.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "Song.h"

#if TARGET_OS_OSX
#import <FlutterMacOS/FlutterMacOS.h>
#else
#import <Flutter/Flutter.h>
#endif

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSArray *wrapResult(id result, FlutterError *error) {
  if (error) {
    return @[
      error.code ?: [NSNull null], error.message ?: [NSNull null], error.details ?: [NSNull null]
    ];
  }
  return @[ result ?: [NSNull null] ];
}

static id GetNullableObjectAtIndex(NSArray *array, NSInteger key) {
  id result = array[key];
  return (result == [NSNull null]) ? nil : result;
}

@interface Song ()
+ (Song *)fromList:(NSArray *)list;
+ (nullable Song *)nullableFromList:(NSArray *)list;
- (NSArray *)toList;
@end

@implementation Song
+ (instancetype)makeWithId:(NSString *)id
    title:(NSString *)title
    artist:(NSString *)artist
    imageId:(NSString *)imageId {
  Song* pigeonResult = [[Song alloc] init];
  pigeonResult.id = id;
  pigeonResult.title = title;
  pigeonResult.artist = artist;
  pigeonResult.imageId = imageId;
  return pigeonResult;
}
+ (Song *)fromList:(NSArray *)list {
  Song *pigeonResult = [[Song alloc] init];
  pigeonResult.id = GetNullableObjectAtIndex(list, 0);
  pigeonResult.title = GetNullableObjectAtIndex(list, 1);
  pigeonResult.artist = GetNullableObjectAtIndex(list, 2);
  pigeonResult.imageId = GetNullableObjectAtIndex(list, 3);
  return pigeonResult;
}
+ (nullable Song *)nullableFromList:(NSArray *)list {
  return (list) ? [Song fromList:list] : nil;
}
- (NSArray *)toList {
  return @[
    self.id ?: [NSNull null],
    self.title ?: [NSNull null],
    self.artist ?: [NSNull null],
    self.imageId ?: [NSNull null],
  ];
}
@end

@interface SongHostApiCodecReader : FlutterStandardReader
@end
@implementation SongHostApiCodecReader
- (nullable id)readValueOfType:(UInt8)type {
  switch (type) {
    case 128: 
      return [Song fromList:[self readValue]];
    default:
      return [super readValueOfType:type];
  }
}
@end

@interface SongHostApiCodecWriter : FlutterStandardWriter
@end
@implementation SongHostApiCodecWriter
- (void)writeValue:(id)value {
  if ([value isKindOfClass:[Song class]]) {
    [self writeByte:128];
    [self writeValue:[value toList]];
  } else {
    [super writeValue:value];
  }
}
@end

@interface SongHostApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation SongHostApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[SongHostApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[SongHostApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *SongHostApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  static dispatch_once_t sPred = 0;
  dispatch_once(&sPred, ^{
    SongHostApiCodecReaderWriter *readerWriter = [[SongHostApiCodecReaderWriter alloc] init];
    sSharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return sSharedObject;
}

void SetUpSongHostApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<SongHostApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.thinmpf.SongHostApi.findAll"
        binaryMessenger:binaryMessenger
        codec:SongHostApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(findAllWithError:)], @"SongHostApi api (%@) doesn't respond to @selector(findAllWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSArray<Song *> *output = [api findAllWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
