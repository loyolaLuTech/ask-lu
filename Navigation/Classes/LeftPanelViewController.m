
#import "LeftPanelViewController.h"

#import "CellData.h"

@interface LeftPanelViewController ()

@property (nonatomic, weak) IBOutlet UITableView *myTableView;
@property (nonatomic, weak) IBOutlet UITableViewCell *cellMain;

@property (nonatomic, strong) NSMutableArray *arrayOfdata;

@end

@implementation LeftPanelViewController

#pragma mark -
#pragma mark View Did Load/Unload

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupAnimalsArray];
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

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
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
#pragma mark Array Setup

- (void)setupAnimalsArray
{
    NSArray *data = @[
    [CellData itemWithTitle:@"Advisor" withImage:nil withCreator:@"Asking Lu"],
    [CellData itemWithTitle:@"Classes" withImage:nil withCreator:@"Change your selected classes"],
    [CellData itemWithTitle:@"About" withImage:nil withCreator:@"Learn about Ask Lu by LuTEC"]
    ];
    
    self.arrayOfdata = [NSMutableArray arrayWithArray:data];
    
    [self.myTableView reloadData];
}

#pragma mark -
#pragma mark UITableView Datasource/Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrayOfdata count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellMainNibID = @"cellMain";
    
    _cellMain = [tableView dequeueReusableCellWithIdentifier:cellMainNibID];
    if (_cellMain == nil) {
        [[NSBundle mainBundle] loadNibNamed:@"MainCellLeft" owner:self options:nil];
    }
    
    UIImageView *mainImage = (UIImageView *)[_cellMain viewWithTag:1];
    
    UILabel *imageTitle = (UILabel *)[_cellMain viewWithTag:2];
    UILabel *creator = (UILabel *)[_cellMain viewWithTag:3];
    
    if ([_arrayOfdata count] > 0)
    {
        CellData *currentRecord = [self.arrayOfdata objectAtIndex:indexPath.row];
        mainImage.image = currentRecord.image;
        imageTitle.text = [NSString stringWithFormat:@"%@", currentRecord.title];
        imageTitle.textColor = [UIColor whiteColor];
        creator.textColor = [UIColor whiteColor];
        creator.text = [NSString stringWithFormat:@"%@", currentRecord.creator];
    }
    _cellMain.backgroundColor = [UIColor clearColor];
    return _cellMain;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellData *currentRecord = [self.arrayOfdata objectAtIndex:indexPath.row];
    [_delegate dataSelected:currentRecord];
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
