
#import "CenterViewController.h"

#import "CellData.h"
#import "ClassCalendar.h"
#import "CRTableViewController.h"
#import "AppDelegate.h"
@interface CenterViewController ()

@property (nonatomic, retain) IBOutlet UIImageView *mainImageView;
@property (nonatomic, retain) IBOutlet UILabel *imageTitle;
@property (nonatomic, retain) IBOutlet UILabel *imageCreator;

@property (nonatomic, strong) NSMutableArray *imagesArray;

@end

@implementation CenterViewController
@synthesize data;
#pragma mark -
#pragma mark View Did Load/Unload

- (void)viewDidLoad
{

    about.backgroundColor = [UIColor clearColor];
    about.hidden = YES;
    tbstring = @"A";
    self.view.backgroundColor = [UIColor colorWithRed:0.635 green:0.11 blue:0.286 alpha:1] /*#a21c49*/;
    if ([tbstring isEqualToString:@"A"]) {
        _tableView.hidden = NO;
        aboutimage.hidden = YES;
        //selectclasses.hidden = YES;
        tbstring = @"A";
        [_delegate movePanelToOriginalPosition];
        
        
        ClassCalendar *class = [[ClassCalendar alloc]init];
        
        AppDelegate *appDelegate =(AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        if(![appDelegate.classes count] == 0) {
            
            NSString *strdata = @"";
            for (int i =0; i < [appDelegate.classes count]; i++) {
                if (i == 0) {
                    strdata = [NSString stringWithFormat:@"%@",[appDelegate.classes objectAtIndex:i]];
                } else {
                    strdata = [NSString stringWithFormat:@"%@,%@",strdata,[appDelegate.classes objectAtIndex:i]];
                }
            }
            
            
            BOOL yesno = [class checkClassesAgainstString:strdata];
            if (yesno) {
                NSMutableArray *array = [class getClassesForAnaylsis];
                for (int i = 0; i < [array count]; i++) {
                    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:[array objectAtIndex:i]];
                    NSString *key = [unarchiver decodeObjectForKey:@"Key"];
                    if ([key isEqualToString:@"Y"]) {
                        NSLog(@"You have a major in %@",[unarchiver decodeObjectForKey:@"Major"]);
                    } else {
                        NSLog(@"You could have a major in %@ if you took the following classes:",[unarchiver decodeObjectForKey:@"Major"]);
                        NSMutableArray *theclasses = [unarchiver decodeObjectForKey:@"Data"];
                        for (int i = 0; i < [theclasses count]; i++) {
                            NSLog(@"%d) %@",i+1,[theclasses objectAtIndex:i]);
                        }
                    }
                    [unarchiver finishDecoding];
                }
            }
            NSMutableArray *array = [class getClassesForAnaylsis];
            data = array;
            [data retain];
            
            
        } else {
           
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"You have no classes selected. Please go to Menu then Classes and pick the classes you have taken or current taking." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [av show];
        }
        
        
    }
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

#pragma mark -
#pragma mark View Will/Did Appear

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(IBAction)selectClasses:(id)sender; {
    CRTableViewController *tableView = [[CRTableViewController alloc] initWithStyle:UITableViewStylePlain];
    //CRTableViewController *tableView = [[CRTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tableView];
    
    [self presentModalViewController:navController animated:YES];
    
}
- (void)viewDidAppear:(BOOL)animated
{
    _tableView.delegate=self;
    _tableView.dataSource=self;
    if([tbstring isEqualToString:@"C"]) {
        [_tableView reloadData];
    }
   	[super viewDidAppear:animated];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if([tbstring isEqualToString:@"A"]) {
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:[data objectAtIndex:section]];
        NSString *key = [unarchiver decodeObjectForKey:@"Major"];
        return key;
    }
    if([tbstring isEqualToString:@"C"]) {
       
        return @"Classes Taking/Taken";
    }
    return nil;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if([tbstring isEqualToString:@"A"]) {

    return [data count];
        
    }
    
    if([tbstring isEqualToString:@"C"]) {

        return 1;
    
    }
    
    return nil;
}
#pragma mark -
#pragma mark View Will/Did Disappear

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

#pragma mark -
#pragma mark Button Actions

-(IBAction)btnMovePanelRight:(id)sender {
	UIButton *button = sender;
	switch (button.tag) {
		case 0: {
			[_delegate movePanelToOriginalPosition];
			break;
		}
			
		case 1: {
			[_delegate movePanelRight];
			break;
		}
			
		default:
			break;
	}
}

-(IBAction)btnMovePanelLeft:(id)sender {
	UIButton *button = sender;
	switch (button.tag) {
		case 0: {
			[_delegate movePanelToOriginalPosition];
			break;
		}
			
		case 1: {
			[_delegate movePanelLeft];
			break;
		}
            
		default:
			break;
	}
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if([tbstring isEqualToString:@"A"]) {

    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:[data objectAtIndex:section]];
    NSString *key = [unarchiver decodeObjectForKey:@"Key"];
    if ([key isEqualToString:@"Y"]) {
        return 1;
    } else {
        NSMutableArray *theclasses = [unarchiver decodeObjectForKey:@"Data"];
        return [theclasses count];    //count number of row from counting array hear cataGorry is An Array
    }
    [unarchiver finishDecoding];
    
    }
    
    if([tbstring isEqualToString:@"C"]) {
        AppDelegate *appDelegate =(AppDelegate *)[[UIApplication sharedApplication] delegate];
        return [appDelegate.classes count];
        
    }
    
    return nil;    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier:MyIdentifier] autorelease];
    }
    
    if([tbstring isEqualToString:@"A"]) {
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:[data objectAtIndex:indexPath.section]];
    NSString *key = [unarchiver decodeObjectForKey:@"Key"];
    if ([key isEqualToString:@"Y"]) {
        cell.textLabel.text = @"You have a major";
    } else {
        NSMutableArray *theclasses = [unarchiver decodeObjectForKey:@"Data"];
        cell.textLabel.text = [theclasses objectAtIndex:indexPath.row];   //count number of row from counting array hear cataGorry is An Array
    }
    [unarchiver finishDecoding];
        
    }
    if([tbstring isEqualToString:@"C"]) {
        AppDelegate *appDelegate =(AppDelegate *)[[UIApplication sharedApplication] delegate];

        cell.textLabel.text = [appDelegate.classes objectAtIndex:indexPath.row];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   
    
}

- (void)imageSelected:(UIImage *)image withTitle:(NSString *)imageTitle withCreator:(NSString *)imageCreator
{
    if (image)
    {
        self.mainImageView.image = image;
        self.imageTitle.text = [NSString stringWithFormat:@"%@", imageTitle];
        self.imageCreator.text = [NSString stringWithFormat:@"%@", imageCreator];
    }
}

- (void)dataSelected:(CellData *)datacell
{
    if (datacell)
    {
        [self showdataSelected:datacell];
    }
}

- (void)showdataSelected:(CellData *)Selected
{
    if ([Selected.title isEqualToString:@"Advisor"]) {
        
        _tableView.hidden = NO;
        aboutimage.hidden = YES;
        selectclasses.hidden = YES;
        tbstring = @"A";
        [_delegate movePanelToOriginalPosition];

        
        ClassCalendar *class = [[ClassCalendar alloc]init];
        
        AppDelegate *appDelegate =(AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        if(![appDelegate.classes count] == 0) {
        
        NSString *strdata = @"";
        for (int i =0; i < [appDelegate.classes count]; i++) {
            if (i == 0) {
                strdata = [NSString stringWithFormat:@"%@",[appDelegate.classes objectAtIndex:i]];
            } else {
                strdata = [NSString stringWithFormat:@"%@,%@",strdata,[appDelegate.classes objectAtIndex:i]];
            }
        }
        
        
        BOOL yesno = [class checkClassesAgainstString:strdata];
        if (yesno) {
            NSMutableArray *array = [class getClassesForAnaylsis];
            for (int i = 0; i < [array count]; i++) {
                NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:[array objectAtIndex:i]];
                NSString *key = [unarchiver decodeObjectForKey:@"Key"];
                if ([key isEqualToString:@"Y"]) {
                    NSLog(@"You have a major in %@",[unarchiver decodeObjectForKey:@"Major"]);
                } else {
                    NSLog(@"You could have a major in %@ if you took the following classes:",[unarchiver decodeObjectForKey:@"Major"]);
                    NSMutableArray *theclasses = [unarchiver decodeObjectForKey:@"Data"];
                    for (int i = 0; i < [theclasses count]; i++) {
                        NSLog(@"%d) %@",i+1,[theclasses objectAtIndex:i]);
                    }
                }
                [unarchiver finishDecoding];
            }
        }
        NSMutableArray *array = [class getClassesForAnaylsis];
        data = array;
        [data retain];
        
            [_tableView reloadData];

        } else {
            data = nil;
            [_tableView reloadData];
            UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"You have no classes selected. Please go to Menu then Classes and pick the classes you have taken or current taking." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [av show];
        }

        about.hidden = YES;

    }
    if ([Selected.title isEqualToString:@"Classes"]) {
        _tableView.hidden = NO;
        aboutimage.hidden = YES;
        selectclasses.hidden = NO;
        tbstring = @"C";
        about.hidden = YES;

        [_delegate movePanelToOriginalPosition];
        [_tableView reloadData];
        //AppDelegate *appDelegate =(AppDelegate *)[[UIApplication sharedApplication] delegate];
        //NSLog(@"cl %@",appDelegate.classes);

    }
    if ([Selected.title isEqualToString:@"About"]) {
        _tableView.hidden = YES;
        aboutimage.hidden = NO;
        about.hidden = NO;

        selectclasses.hidden = YES;
        [_delegate movePanelToOriginalPosition];
        
    }
    if ([Selected.title isEqualToString:@"Options"]) {
        title.titleLabel.text = @"Options";
        _tableView.hidden = YES;
        aboutimage.hidden = YES;
         selectclasses.hidden = YES;
        [_delegate movePanelToOriginalPosition];
        
    }
}

#pragma mark -
#pragma mark Default System Code

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
