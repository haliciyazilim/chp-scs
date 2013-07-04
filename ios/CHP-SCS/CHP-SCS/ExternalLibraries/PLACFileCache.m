//
//  PLACFileCache.m
//
//  Copyright © 2012 Placester, Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "PLACFileCache.h"

@interface PLACFileCache ()

@property (nonatomic) NSUInteger maxSize;
@property (retain) NSString * cacheDirectory;
@property (retain) NSString * cacheInfoFile;
@property (retain) NSMutableDictionary * cacheInfo;
@property (retain) NSMutableDictionary * transforms;
@property (retain) NSOperationQueue * requestQueue;

- (void) prepareDirectory;
- (void) prepareCache;
- (void) sweepCache;

- (NSString *) encodeURL:(NSString *)url;

@end

@implementation PLACFileCache

@synthesize delegate;
@synthesize active;
@synthesize maxSize;
@synthesize requestQueue;
@synthesize cacheDirectory;
@synthesize cacheInfoFile;
@synthesize cacheInfo;
@synthesize transforms;

static PLACFileCache * sharedFileCache;

+ (PLACFileCache *) sharedCache
{
  if (nil == sharedFileCache)
  {
    [NSException raise:NSInternalInconsistencyException
                format:@"[%@ %@] cannot be called until a shared loader is initialized.", NSStringFromClass([self class]), NSStringFromSelector(_cmd)];
  }
  
  return sharedFileCache;
}

- (id) init
{
  [NSException raise:NSInternalInconsistencyException
              format:@"[%@ %@] cannot be called, use [%@ %@] instead.", NSStringFromClass([self class]), NSStringFromSelector(_cmd), NSStringFromClass([self class]), NSStringFromSelector(@selector(initWithDirectory:maxSize:))];
  
  return nil;
}

- (id) initWithDirectory:(NSString *)directory maxSize:(NSUInteger)size
{
  self = [super init];
  
  if (self)
  {
    self.cacheDirectory = directory;
    self.maxSize = size;
    self.active = YES;
    self.transforms = [[NSMutableDictionary alloc] init];
    self.requestQueue = [[NSOperationQueue alloc] init];
    
    [self.requestQueue setMaxConcurrentOperationCount:2];
    
    [self prepareDirectory];
    [self prepareCache];
  }
  
  if (!sharedFileCache) {
    sharedFileCache = self;
  }
  
  return self;
}

- (NSUInteger) currentSize {
  if ([self.cacheInfo valueForKey:@"currentSize"]) {
    return [[self.cacheInfo valueForKey:@"currentSize"] intValue];
  } else {
    return 0;
  }
}

- (void) prepareDirectory {
  if (![[NSFileManager defaultManager] fileExistsAtPath:self.cacheDirectory])
  {
    [[NSFileManager defaultManager] createDirectoryAtPath:self.cacheDirectory withIntermediateDirectories:YES attributes:nil error:nil];
  }
  
}

- (void) prepareCache
{
  self.cacheInfoFile = [self.cacheDirectory stringByAppendingPathComponent:@"cache.plist"];
  if([[NSFileManager defaultManager] fileExistsAtPath:cacheInfoFile])
  {
    self.cacheInfo = [NSMutableDictionary dictionaryWithContentsOfFile:cacheInfoFile];
  } else {
    self.cacheInfo = [[NSMutableDictionary alloc] init];
    [self.cacheInfo setValue:[[NSMutableArray alloc] init] forKey:@"cachedFiles"];
  }
}

- (NSData *) manageURL:(NSString *)url {
  return [self manageURL:url withTransform:nil delegate:self.delegate];
}

- (NSData *) manageURL:(NSString *)url delegate:(id<PLACFileCacheDelegate>)manageDelegate {
  return [self manageURL:url withTransform:nil delegate:manageDelegate];
}

- (NSData *) manageURL:(NSString *)url withTransform:(id)transformIdentifier {
  return [self manageURL:url withTransform:transformIdentifier delegate:self.delegate];
}

- (BOOL) checkFileModified:(NSString*)url
{
    NSURL *fileUrl = [NSURL URLWithString:url];
    NSDate *fileDate;
    NSError* error;

    [fileUrl getResourceValue:&fileDate forKey:NSURLContentModificationDateKey error:&error];
    if (!error)
    {
        NSLog(@"%@",fileDate);
        //here you should be able to read valid date from fileDate variable
    }
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://partiiciegitim.chp.org.tr/dosyalar/mevzuat/sandik-baski.pdf"]];
    [request setHTTPMethod:@"HEAD"];
    NSHTTPURLResponse* response;
    [NSURLConnection sendSynchronousRequest:request
                          returningResponse:&response error:&error];
    
    NSDate* remote = [NSDate dateFromRFC1123:(NSString *)[[response allHeaderFields] objectForKey:@"Last-Modified"]];
    NSDate *locale  = [[[NSFileManager defaultManager] attributesOfItemAtPath:[self filePathForUrl:url] error:nil] fileModificationDate];
    
    if([locale compare:remote] == NSOrderedAscending){
        return YES;
    }
    return NO;

}

- (NSData *) manageURL:(NSString *)url withTransform:(id)transformIdentifier delegate:(id<PLACFileCacheDelegate>)manageDelegate {  
    NSData * returnData;
    NSString * filename = [self encodeURL:url];
    BOOL shouldDownload = NO;
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self.cacheDirectory stringByAppendingPathComponent:filename]]) {
        if([self checkFileModified:url] == NO){
            [[self.cacheInfo objectForKey:@"cachedFiles"] removeObject:filename];
            [[self.cacheInfo objectForKey:@"cachedFiles"] addObject:filename];
            returnData = [NSData dataWithContentsOfFile:[self.cacheDirectory stringByAppendingPathComponent:filename]];
        } else {
            shouldDownload = YES;
        }
    }
    
    if(shouldDownload)
    {
        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLCacheStorageAllowedInMemoryOnly timeoutInterval:20.0];
        [self.requestQueue addOperationWithBlock:^{
            NSURLResponse * response;
            NSError * error;
            NSData * responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            if (error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [manageDelegate fileCache:self didFailWithError:error];
                });
            } else {
                NSData * (^transformBlock)(NSData *,NSString *);
                transformBlock = [self.transforms objectForKey:transformIdentifier];
                if (transformBlock) {
                    responseData = transformBlock(responseData,[self.cacheDirectory stringByAppendingPathComponent:filename]);
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    [manageDelegate fileCache:self didLoadFile:responseData withTransform:transformIdentifier fromURL:url];
                });
            }
            [responseData writeToFile:[self.cacheDirectory stringByAppendingPathComponent:filename] atomically:YES];
            [self.cacheInfo setValue:[NSNumber numberWithInt:[responseData length] + [[self.cacheInfo valueForKey:@"currentSize"] intValue]] forKey:@"currentSize"];
            [self sweepCache];
        }];
        
        returnData = nil;
    }
    return returnData;
}

- (NSString*) filePathForUrl:(NSString*)url
{
     NSString * filename = [NSString stringWithFormat:@"%@", [self encodeURL:url]];
    return [self.cacheDirectory stringByAppendingPathComponent:filename];
}

- (void) registerTransform:(id)transformIdentifier withBlock:(NSData *(^)(NSData *,NSString*))block {
  [self.transforms setValue:[block copy] forKey:transformIdentifier];
}

- (NSString *) encodeURL:(NSString *)url
{
  return [[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
}

- (void) clearCache {
  NSError * error = nil;
  
  [[NSFileManager defaultManager] removeItemAtPath:self.cacheDirectory error:&error];
  
  if (error) {
    [delegate fileCache:self didFailWithError:error];
  }
  
  [self prepareDirectory];
  [self prepareCache];
}

- (void) sweepCache {
  while (self.currentSize > self.maxSize) {
    NSString * fileNameToRemove = [[self.cacheInfo objectForKey:@"cachedFiles"] lastObject];
    [[self.cacheInfo objectForKey:@"cachedFiles"] removeLastObject];
    
    NSUInteger length = [[NSData dataWithContentsOfFile:[self.cacheDirectory stringByAppendingPathComponent:fileNameToRemove]] length];
    NSError * error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:[self.cacheDirectory stringByAppendingPathComponent:fileNameToRemove] error:nil];
    
    if (error) {
      [delegate fileCache:self didFailWithError:error];
    }
    
    [self.cacheInfo setValue:[NSNumber numberWithInt:[[self.cacheInfo valueForKey:@"currentSize"] intValue] - length] forKey:@"currentSize"];
  }
  
  [self.cacheInfo writeToFile:self.cacheInfoFile atomically:YES];
}
@end