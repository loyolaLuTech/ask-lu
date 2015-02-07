
#import "CRTableViewController.h"
#import "CRTableViewCell.h"
#import "AppDelegate.h"
@interface CRTableViewController ()

@end

@implementation CRTableViewController

@synthesize dataSource;

#pragma mark - Lifecycle
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        self.title = @"Loyola Classes";
        
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                        style:UIBarButtonSystemItemDone target:self action:@selector(done:)];
        self.navigationItem.rightBarButtonItem = rightButton;
        
        dataSource = [[NSArray alloc] initWithObjects:
                      @"COMP 363",
                      @"COMP 163",
                    @"COMP 264",@"COMP 271",@"COMP 313",@"COMP 317",@"MATH 161",@"MATH 162",@"COMP 150",@"COMP 170",@"COMP 374",@"COMP 372",@"COMP 390",@"COMP 391",
                      nil];

        AppDelegate *appDelegate =(AppDelegate *)[[UIApplication sharedApplication] delegate];
        if ([appDelegate.classes count] == 0) {
            selectedMarks = [NSMutableArray new];
        } else {
            selectedMarks = [[NSMutableArray alloc] initWithArray:appDelegate.classes];

        }
        
       //COMP 363,COMP 163,COMP 264,COMP 271,COMP 313,COMP 317,MATH 161,MATH 162|COMP 150orCOMP 170,COMP 374orCOMP 372,COMP 390orCOMP 391
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Methods
- (void)done:(id)sender
{
    AppDelegate *appDelegate =(AppDelegate *)[[UIApplication sharedApplication] delegate];
    //appDelegate.classes = selectedMarks;
    [appDelegate saveArray:selectedMarks];
    NSLog(@"%@", selectedMarks);
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - UITableView Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CRTableViewCellIdentifier = @"cellIdentifier";
    
    // init the CRTableViewCell
    CRTableViewCell *cell = (CRTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CRTableViewCellIdentifier];
    
    if (cell == nil) {
        cell = [[CRTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CRTableViewCellIdentifier];
    }
    
    // Check if the cell is currently selected (marked)
    NSString *text = [dataSource objectAtIndex:[indexPath row]];
    cell.isSelected = [selectedMarks containsObject:text] ? YES : NO;
    cell.textLabel.text = text;
    
    return cell;
}

#pragma mark - UITableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = [dataSource objectAtIndex:[indexPath row]];
    
    if ([selectedMarks containsObject:text])// Is selected?
        [selectedMarks removeObject:text];
    else
        [selectedMarks addObject:text];
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
