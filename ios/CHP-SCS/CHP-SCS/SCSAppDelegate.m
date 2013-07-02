//
//  SCSAppDelegate.m
//  CHP-SCS
//
//  Created by Alperen Kavun on 11.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSAppDelegate.h"
#import "APIManager.h"

@implementation SCSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    NSURL *fileUrl = [NSURL URLWithString:@"http://partiiciegitim.chp.org.tr/dosyalar/mevzuat/sandik-baski.pdf"];
//    NSDate *fileDate;
//    NSError* error;
//    
//    [fileUrl getResourceValue:&fileDate forKey:NSURLContentModificationDateKey error:&error];
//    if (!error)
//    {
//        NSLog(@"%@",fileDate);
//        //here you should be able to read valid date from fileDate variable
//    }
//    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://partiiciegitim.chp.org.tr/dosyalar/mevzuat/sandik-baski.pdf"]];
//    [request setHTTPMethod:@"HEAD"];
//    NSHTTPURLResponse* response;
//    [NSURLConnection sendSynchronousRequest:request
//                          returningResponse:&response error:&error];
//    
//    long long dataLength = [response expectedContentLength];
//    NSDate* lastModified = [NSDate dateFromRFC1123:(NSString *)[[response allHeaderFields] objectForKey:@"Last-Modified"]];
//    NSDate* now = [NSDate date];
//    if([now compare:lastModified] == NSOrderedAscending){
//        NSLog(@"Ascending");
//    }
//    else if([now compare:lastModified] == NSOrderedDescending){
//        NSLog(@"Descending");
//    }
//    else {
//        NSLog(@"Same");
//    }
//    NSLog(@"%lld",dataLength);
    
//    NSLog(@"%@",[request allHTTPHeaderFields]);
//    [[APIManager sharedInstance] getDocumentsWithDocumentType:DOCUMENTS_TYPE_EGITIM andCompletionBlock:^(NSArray *responseArray) {
//        NSLog(@"%@",responseArray);
//    } onError:^(NSError *error) {
//        
//    }];
    
    if([[UIScreen mainScreen] bounds].size.height == 568){
        _window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg-568h.jpg"]];
    }
    else{
        _window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg.jpg"]];
    }
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
