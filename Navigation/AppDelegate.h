
#import <UIKit/UIKit.h>

@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainViewController *viewController;
@property (nonatomic,retain) NSMutableArray *classes;
-(void)saveArray:(NSString *)array;
@property(nonatomic) BOOL Run;
@end
