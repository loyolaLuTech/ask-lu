
#import <UIKit/UIKit.h>

@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainViewController *viewController;
@property (nonatomic,retain) NSArray *classes;
-(void)saveArray:(NSArray *)array;
@end
