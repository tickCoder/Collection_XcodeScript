//
//  DemoFrameworkPrivateShow.m
//  DemoFramework
//
//  Created by Claris on 2016.04.15.Friday.
//  Copyright © 2016 tickCoder. All rights reserved.
//

#import "DemoFrameworkPrivateShow.h"

@implementation DemoFrameworkPrivateShow
- (NSString *)somethingPrivate {
    return [NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__];
}
@end
