#import "AtlasflitPlugin.h"
#import <atlasflit/atlasflit-Swift.h>

@implementation AtlasflitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAtlasflitPlugin registerWithRegistrar:registrar];
}
@end
