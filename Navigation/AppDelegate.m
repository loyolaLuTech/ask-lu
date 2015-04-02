

#import "AppDelegate.h"

#import "MainViewController.h"

@implementation AppDelegate
@synthesize classes;
@synthesize Run = _Run;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSUserDefaults *fetchDefaults = [NSUserDefaults standardUserDefaults];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    classes = [[NSArray alloc] init];
    classes = [fetchDefaults objectForKey:@"kKey"];
    
    ///////
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (![defaults objectForKey:@"FR"]){
        
        self.Run = TRUE;
        
        [defaults setObject:[NSDate date] forKey:@"FR"];
        
    }else{
        
        self.Run = FALSE;
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    if (self.Run) {
        
        NSLog(@"First Run");
        
    } else {
        
        NSLog(@"Normal Run");
        
    }
    ///////
    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
-(void)saveArray:(NSArray *)array {
    classes = array;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    // To Save A String
    [defaults setObject:array forKey:@"kKey"];
    
    // Synchronizing the defaults. If you don't do this the defaults may or may not sync.
    [defaults synchronize];
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
