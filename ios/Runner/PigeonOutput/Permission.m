// Autogenerated from Pigeon (v16.0.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import "Permission.h"

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

NSObject<FlutterMessageCodec> *HostPermissionApiGetCodec(void) {
  static FlutterStandardMessageCodec *sSharedObject = nil;
  sSharedObject = [FlutterStandardMessageCodec sharedInstance];
  return sSharedObject;
}

void SetUpHostPermissionApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<HostPermissionApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [[FlutterBasicMessageChannel alloc]
        initWithName:@"dev.flutter.pigeon.thinmpf.HostPermissionApi.checkPermission"
        binaryMessenger:binaryMessenger
        codec:HostPermissionApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(checkPermissionWithError:)], @"HostPermissionApi api (%@) doesn't respond to @selector(checkPermissionWithError:)", api);
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        NSNumber *output = [api checkPermissionWithError:&error];
        callback(wrapResult(output, error));
      }];
    } else {
      [channel setMessageHandler:nil];
    }
  }
}
