

#import <UIKit/UIKit.h>

@interface CRTableViewController : UITableViewController
{
    NSArray *dataSource;
    NSMutableArray *selectedMarks;
}

@property (nonatomic) NSArray *dataSource;

@end