//
//  APIManager.h
//  e-Sandik
//
//  Created by Eren Halici on 08.11.2012.
//  Copyright (c) 2012 Halıcı. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "MKNetworkKit/MKNetworkEngine.h"

@class SCSManager;

typedef void (^CompletionBlock) (NSDictionary *responseDictionary);
typedef void (^ErrorBlock) (NSError *error);
typedef void (^SCSCardBlock) (SCSManager* manager);
typedef void (^ImageBlock) (UIImage *resultImage);
typedef void (^DocumentsCompletionBlock) (NSArray *responseArray);

//typedef void (^SCSCardBlock) (NSDictionary* card);

@interface APIManager : MKNetworkEngine

+ (APIManager *)sharedInstance;

- (MKNetworkOperation *)loginWithUsername:(NSString *)username
                              andPassword:(NSString *)password
                             onCompletion:(SCSCardBlock)cardBlock
                                  onError:(ErrorBlock)errorBlock;

- (MKNetworkOperation *)loginV2WithUsername:(NSString *)username
                              andPassword:(NSString *)password
                             onCompletion:(CompletionBlock)completionBlock
                                  onError:(ErrorBlock)errorBlock;

- (MKNetworkOperation *)getImageWithURLString:(NSString *)urlString
                                 onCompletion:(ImageBlock)completionBlock
                                      onError:(ErrorBlock)errorBlock;

- (MKNetworkOperation *)getCommunicationInfosWithUsername:(NSString *)username
                                              andPassword:(NSString *)password
                                             onCompletion:(CompletionBlock)completionBlock
                                                  onError:(ErrorBlock)errorBlock;

- (MKNetworkOperation *)getDocumentsWithDocumentType:(int)docType
                                  andCompletionBlock:(DocumentsCompletionBlock)completionBlock
                                             onError:(ErrorBlock)errorBlock;


@end
