// Autogenerated from Pigeon (v16.0.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN


/// The codec used by HostPermissionApi.
NSObject<FlutterMessageCodec> *HostPermissionApiGetCodec(void);

@protocol HostPermissionApi
/// @return `nil` only when `error != nil`.
- (nullable NSNumber *)checkPermissionWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void SetUpHostPermissionApi(id<FlutterBinaryMessenger> binaryMessenger, NSObject<HostPermissionApi> *_Nullable api);

NS_ASSUME_NONNULL_END
