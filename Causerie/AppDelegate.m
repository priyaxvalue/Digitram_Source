

#import "AppDelegate.h"
#define DB_Name @"Causerie.sqlite"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docpath = [ary objectAtIndex:0];
    NSLog(@"path %@",docpath);
    
    [self copysqllitetodocuments];

    [[UINavigationBar appearance] setBarTintColor:[ UIColor colorWithRed:0/255.f green:149/255.f blue:48/255.f alpha:1]] ;
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], NSForegroundColorAttributeName,
                                                           nil]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
   
    return YES;
}

-(NSString *) sqlliteapppath
{
    //application path for sqlite
    @try{
        NSString *apppath = [[NSBundle mainBundle] bundlePath];
        apppath = [ apppath stringByAppendingPathComponent:DB_Name];
        NSLog(@"The Location of Database is...%@",apppath);
        
        return apppath;
    }
    @catch (NSException *exception) {
    }
    
}
-(NSString *) doccumentspath
{
    //document path for sqlite
    @try{
        NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docpath = [ary objectAtIndex:0];
        docpath = [docpath stringByAppendingPathComponent:DB_Name];
        return docpath;
    }
    @catch (NSException *exception) {
    }
    
}

-(void)copysqllitetodocuments
{
    
    @try{
        NSString *apppath = [self sqlliteapppath];
        NSString *docpath = [self doccumentspath];
        
        NSFileManager *fl = [NSFileManager defaultManager];
        if(![fl fileExistsAtPath:docpath])
        {
            BOOL s = [fl copyItemAtPath : apppath toPath : docpath error:nil];
            if(s){
            }
            else {
            }
        }
    }
    @catch (NSException *exception) {
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
