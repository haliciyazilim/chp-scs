//
//  APIManager.m
//  e-Sandik
//
//  Created by Eren Halici on 08.11.2012.
//  Copyright (c) 2012 Halıcı. All rights reserved.
//

#import "APIManager.h"
#import "SCSManager.h"

@implementation APIManager

static APIManager *sharedInstance = nil;

#pragma mark - Singleton and init methods

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if (sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;
        }
    }
    
    return nil;
}

- (id)init
{
    self = [super initWithHostName:@"bilisim.chp.org.tr"
                customHeaderFields:@{@"x-client-identifier" : @"iOS",
                                            @"Content-Type" : @"text/xml"}];
    
    if (self) {
        // Initialization code here.
        [self useCache];
    }
    
    return self;
}

+ (APIManager *)sharedInstance
{
    @synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
    }
    
    return sharedInstance;
}

#pragma mark - Caching

- (NSString*) cacheDirectoryName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *cacheDirectoryName = [documentsDirectory stringByAppendingPathComponent:@"eSandikAPICache"];
    return cacheDirectoryName;
}

#pragma mark - Helpers

- (NSString *)pathForOperation:(NSString *)operation {
    return [NSString stringWithFormat:@"MobilService.asmx?op=%@", operation];
}

- (MKNetworkOperation *)createNetworkOperationForOperation:(NSString *)operationName
                                             andParameters:(NSDictionary *)parameters
                                              onCompletion:(CompletionBlock)completionBlock
                                                   onError:(ErrorBlock)errorBlock {
    __block NSString *parametersString = @"";
    
    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        parametersString = [parametersString stringByAppendingFormat:@"<%@>%@</%@>", key, obj, key];
        stop = NO;
    }];
    
    
    NSString *xmlString = [NSString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"><soap:Body><%@ xmlns=\"http://tempuri.org/\">%@</%@></soap:Body></soap:Envelope>", operationName, parametersString, operationName];
    
    
    
    MKNetworkOperation *op = [self operationWithPath:[self pathForOperation:operationName]
                                              params:@{@"xmlData" : xmlString}
                                          httpMethod:@"POST"];
    
    [op setCustomPostDataEncodingHandler:^NSString *(NSDictionary *postDataDict) {
        return [postDataDict objectForKey:@"xmlData"];
    }
                                 forType:@"text/xml"];
    
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        NSDictionary *responseDictionary = [self getDictionaryFromResponse:[completedOperation responseString]
                                                              forOperation:operationName];
        
        if([[responseDictionary valueForKey:@"hataKodu"] integerValue] == 1){
            NSError *apiError = [NSError errorWithDomain:@"APIError"
                                                    code:-101
                                                userInfo:@{NSLocalizedDescriptionKey : [responseDictionary valueForKey:@"hataAciklamasi"]}];
//            NSError *apiError = [NSError errorWithDomain:@"APIError"
//                                                    code:-101
//                                                userInfo:@{NSLocalizedDescriptionKey : @"Sunucuyla ilgili bir sorun oluştu. Lütfen daha sonra tekrar deneyiniz."}];
            errorBlock(apiError);
        }
        else{
            completionBlock(responseDictionary);
        }
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        if (error.domain == NSURLErrorDomain && error.code == -1009) {
            NSError *connectionError = [NSError errorWithDomain:@"ConnectionError"
                                                           code:-102
                                                       userInfo:@{NSLocalizedDescriptionKey : @"İnternet bağlantısı sağlanamadı, ayarlarınızı kontrol ederek tekrar deneyiniz."}];
            errorBlock(connectionError);
        } else {
            errorBlock(error);
        }
    }];
    
    [self enqueueOperation:op];
    return op;
}

- (NSDictionary *) getDictionaryFromResponse:(NSString *)response
                                forOperation:(NSString *)operation {
    NSRange range1 = [response rangeOfString:[NSString stringWithFormat:@"<%@Result>", operation]];
    NSRange range2 = [response rangeOfString:[NSString stringWithFormat:@"</%@Result>", operation]];
    NSRange range = {NSMaxRange(range1), range2.location-range1.location-range2.length+1};
    NSString *responseString = [response substringWithRange:range];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    responseString = [responseString stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    NSData *responseJSON = [responseString dataUsingEncoding:NSUTF8StringEncoding];
    
    id responseObject = [NSJSONSerialization JSONObjectWithData:responseJSON options:0 error:nil];
    
    if (!responseObject) {
        return @{ @"hataKodu" : @"1",
                  @"hataAciklamasi" : [NSString stringWithFormat:@"Result is not a proper JSON object. It is: %@", [response substringWithRange:range]]};
    }
    
    if ([responseObject isKindOfClass:[NSArray class]]) {
        return @{ @"hataKodu" : @"0",
                  @"result" : responseObject };
    } else {
        if ([responseObject objectForKey:@"HataKodu"]) {
            return @{ @"hataKodu" : @"1",
                      @"hataAciklamasi" : [responseObject objectForKey:@"HataAciklamasi"],
                      @"result" : responseObject};
        } else {
            return @{ @"hataKodu" : @"0",
                      @"result" : responseObject};
        }
    }
}

#pragma mark - Login

- (MKNetworkOperation *)loginV2WithUsername:(NSString *)username
                                andPassword:(NSString *)password
                               onCompletion:(CompletionBlock)completionBlock
                                    onError:(ErrorBlock)errorBlock
{
    if ([username characterAtIndex:0] == '0') {
        username = [username substringFromIndex:1];
    }
    
    return [self createNetworkOperationForOperation:@"SCS_Login"
                                      andParameters:@{@"telNo" : username,
                                                        @"Sifre" : password}
                                       onCompletion:^(NSDictionary *responseDictionary) {
                                           
                                       }
                                            onError:^(NSError *error) {
                                            }
            ];
}

- (MKNetworkOperation *)loginWithUsername:(NSString *)username
                              andPassword:(NSString *)password
                             onCompletion:(SCSCardBlock)cardBlock
                                  onError:(ErrorBlock)errorBlock {
    if ([username characterAtIndex:0] == '0') {
        username = [username substringFromIndex:1];
    }
    
    return [self createNetworkOperationForOperation:@"SCS_Login"
                  andParameters:@{@"telNo" : username,
                                  @"Sifre" : password  }
                   onCompletion:^(NSDictionary *responseDictionary) {
                       if ([responseDictionary[@"result"][@"LoginDurumu"] boolValue] == true) {
                           SCSManager* manager = [SCSManager SCSManagerWithDictionary:responseDictionary[@"result"]];
                           cardBlock(manager);
                       } else {
                           errorBlock([NSError errorWithDomain:@"LoginError"
                                                          code:-110
                                                      userInfo:@{NSLocalizedDescriptionKey : @"Hatalı kullanıcı adı veya şifre girdiniz. Lütfen tekrar deneyin."}]);
                       }
                   }
                        onError:^(NSError *error) {
                            errorBlock(error);
                        }];
}

#pragma mark - Getting images

- (MKNetworkOperation *)getImageWithURLString:(NSString *)urlString
                                 onCompletion:(ImageBlock)completionBlock
                                      onError:(ErrorBlock)errorBlock {
    MKNetworkOperation *op = [self operationWithURLString:urlString];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        completionBlock([completedOperation responseImage]);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        errorBlock(error);
    }];
    
    [self enqueueOperation:op];
    
    return op;
}

#pragma mark - Documents

- (MKNetworkOperation *)getDocumentsWithDocumentType:(int)docType
                                  andCompletionBlock:(DocumentsCompletionBlock)completionBlock
                                             onError:(ErrorBlock)errorBlock {
    return [self createNetworkOperationForOperation:@"SCS_GenelgeEgitimDocGetir"
                                      andParameters:@{@"DocType" : [NSNumber numberWithInt:docType]}
                                   onCompletion:^(NSDictionary *responseDictionary) {
                               if ([responseDictionary[@"hataKodu"] intValue] == 0) {
                                   completionBlock(responseDictionary[@"result"][@"GenelgeList"]);
                               } else {
                                   errorBlock([NSError errorWithDomain:@"LoginError"
                                                                  code:-110
                                                              userInfo:@{NSLocalizedDescriptionKey : @"Hatalı kullanıcı adı veya şifre girdiniz. Lütfen tekrar deneyin."}]);
                               }
                           }
                                onError:^(NSError *error) {
                                    errorBlock(error);
                                }];
}

#pragma mark - Communication

- (MKNetworkOperation *)getCommunicationInfosWithUsername:(NSString *)username
                                              andPassword:(NSString *)password
                                             onCompletion:(CompletionBlock)completionBlock
                                                  onError:(ErrorBlock)errorBlock {
    if ([username characterAtIndex:0] == '0') {
        username = [username substringFromIndex:1];
    }
    
    return [self createNetworkOperationForOperation:@"SCS_Iletisim"
                      andParameters:@{@"telNo" : username,
                                        @"Sifre" : password  }
                       onCompletion:^(NSDictionary *responseDictionary) {
                           if ([responseDictionary[@"result"][@"LoginDurum"] boolValue] == true) {
                               completionBlock(responseDictionary[@"result"]);
                           } else {
                               errorBlock([NSError errorWithDomain:@"LoginError"
                                                              code:-110
                                                          userInfo:@{NSLocalizedDescriptionKey : @"Hatalı kullanıcı adı veya şifre girdiniz. Lütfen tekrar deneyin."}]);
                           }
                       }
                            onError:^(NSError *error) {
                                errorBlock(error);
                            }];
}

@end
