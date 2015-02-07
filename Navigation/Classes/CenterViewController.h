//

#import "LeftPanelViewController.h"
#import "NavigationBarButton.h"
@protocol CenterViewControllerDelegate <NSObject>

@optional
- (void)movePanelLeft;
- (void)movePanelRight;

@required
- (void)movePanelToOriginalPosition;

@end

@interface CenterViewController : UIViewController <LeftPanelViewControllerDelegate,UITableViewDataSource,UITableViewDelegate> {
    IBOutlet UIButton *selectclasses;
    IBOutlet UIImageView *aboutimage;
    NSString *tbstring;
    IBOutlet UIButton *title;
    IBOutlet UIView *about;
}

@property (nonatomic, assign) id<CenterViewControllerDelegate> delegate;
@property (nonatomic, retain) NSMutableArray *data;

@property (nonatomic, retain) IBOutlet NavigationBarButton *leftButton;
@property (nonatomic, retain) IBOutlet UIButton *rightButton;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
-(IBAction)selectClasses:(id)sender;
@end
