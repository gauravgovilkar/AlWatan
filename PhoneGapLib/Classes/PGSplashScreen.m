/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */


#import "PGSplashScreen.h"
#import "PGViewController.h"
#import "PhoneGapDelegate.h"

@implementation PGSplashScreen


- (void) __show:(BOOL)show
{
    // Legacy support - once deprecated classes removed, clean this up
    id<UIApplicationDelegate> delegate = [[UIApplication sharedApplication] delegate];
    
    if ([delegate isKindOfClass:[PhoneGapDelegate class]]) {
        ((PhoneGapDelegate*)delegate).imageView.hidden = !show;
        ((PhoneGapDelegate*)delegate).activityView.hidden = !show;
    } else if ([delegate respondsToSelector:@selector(viewController)]) {
        id vc = [delegate performSelector:@selector(viewController)];
        if ([vc isKindOfClass:[PGViewController class]]) {
            ((PGViewController*)vc).imageView.hidden = !show;
            ((PGViewController*)vc).activityView.hidden = !show;
        }
    }
}

- (void) show:(NSArray*)arguments withDict:(NSMutableDictionary*)options
{
	[self __show:YES];
}

- (void) hide:(NSArray*)arguments withDict:(NSMutableDictionary*)options
{
	[self __show:NO];
}

@end