//
//  APIManager.h
//  e-Sandik
//
//  Created by Eren Halici on 08.11.2012.
//  Copyright (c) 2012 Halıcı. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MKNetworkKit/MKNetworkEngine.h"
#import "SCSManager.h"

typedef void (^CompletionBlock) (NSDictionary *responseDictionary);
typedef void (^ErrorBlock) (NSError *error);
typedef void (^SCSCardBlock) (SCSManager* manager);

//typedef void (^SCSCardBlock) (NSDictionary* card);

@interface APIManager : MKNetworkEngine

+ (APIManager *)sharedInstance;

- (MKNetworkOperation *)loginWithUsername:(NSString *)username
                              andPassword:(NSString *)password
                             onCompletion:(SCSCardBlock)cardBlock
                                  onError:(ErrorBlock)errorBlock;

@end
