

#import <QuartzCore/QuartzCore.h>
#import "MainViewController.h"
#import "CenterViewController.h"
#import "LeftPanelViewController.h"

#define CENTER_TAG 1
#define LEFT_PANEL_TAG 2
#define RIGHT_PANEL_TAG 3

#define CORNER_RADIUS 4

#define SLIDE_TIMING .25
#define PANEL_WIDTH 60

@interface MainViewController () <CenterViewControllerDelegate, UIGestureRecognizerDelegate
>

@property (nonatomic, strong) CenterViewController *centerViewController;
@property (nonatomic, strong) LeftPanelViewController *leftPanelViewController;
@property (nonatomic, assign) BOOL showingLeftPanel;
@property (nonatomic, assign) BOOL showingRightPanel;
@property (nonatomic, assign) BOOL showPanel;
@property (nonatomic, assign) CGPoint preVelocity;

@end

@implementation MainViewController

#pragma mark -
#pragma mark View Did Load/Unload

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
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
#pragma mark Setup View

-(void)setupView {
    
	self.centerViewController = [[CenterViewController alloc] initWithNibName:@"CenterViewController" bundle:nil];
	self.centerViewController.view.tag = CENTER_TAG;
	self.centerViewController.delegate = self;
	[self.view addSubview:self.centerViewController.view];
	[self addChildViewController:_centerViewController];
	[_centerViewController didMoveToParentViewController:self];
	
	[self setupGestures];
}

-(void)showCenterViewWithShadow:(BOOL)value withOffset:(double)offset {
	if (value) {
		[_centerViewController.view.layer setCornerRadius:CORNER_RADIUS];
		[_centerViewController.view.layer setShadowColor:[UIColor blackColor].CGColor];
		[_centerViewController.view.layer setShadowOpacity:0.8];
		[_centerViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
        
	} else {
		[_centerViewController.view.layer setCornerRadius:0.0f];
		[_centerViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
	}
}

-(void)resetMainView {
	// remove left and right views, and reset variables, if needed
    
	if (_leftPanelViewController != nil) {
		[self.leftPanelViewController.view removeFromSuperview];
		self.leftPanelViewController = nil;
		_centerViewController.leftButton.tag = 1;
		self.showingLeftPanel = NO;
	}
    /*
	if (_rightPanelViewController != nil) {
		[self.rightPanelViewController.view removeFromSuperview];
		self.rightPanelViewController = nil;
		_centerViewController.rightButton.tag = 1;
		self.showingRightPanel = NO;
	}
    */
	// remove view shadows
	[self showCenterViewWithShadow:NO withOffset:0];
}

-(UIView *)getLeftView {
	// init view if it doesn't already exist
	if (_leftPanelViewController == nil)
	{
		// this is where you define the view for the left panel
		self.leftPanelViewController = [[LeftPanelViewController alloc] initWithNibName:@"LeftPanelViewController" bundle:nil];
		self.leftPanelViewController.view.tag = LEFT_PANEL_TAG;
		self.leftPanelViewController.delegate = _centerViewController;
        
		[self.view addSubview:self.leftPanelViewController.view];
        
		[self addChildViewController:_leftPanelViewController];
		[_leftPanelViewController didMoveToParentViewController:self];
        
		_leftPanelViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	}
    
	self.showingLeftPanel = YES;
    
	// setup view shadows
	[self showCenterViewWithShadow:YES withOffset:-2];
    
	UIView *view = self.leftPanelViewController.view;
	return view;
}

-(UIView *)getRightView {
    /*
	// init view if it doesn't already exist
	if (_rightPanelViewController == nil)
	{
		// this is where you define the view for the right panel
		self.rightPanelViewController = [[RightPanelViewController alloc] initWithNibName:@"RightPanelViewController" bundle:nil];
		self.rightPanelViewController.view.tag = RIGHT_PANEL_TAG;
		self.rightPanelViewController.delegate = _centerViewController;
		
		[self.view addSubview:self.rightPanelViewController.view];
		
		[self addChildViewController:self.rightPanelViewController];
		[_rightPanelViewController didMoveToParentViewController:self];
		
		_rightPanelViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	}
	self.showingRightPanel = YES;
    
	// setup view shadows
	[self showCenterViewWithShadow:YES withOffset:2];
    
	UIView *view = self.rightPanelViewController.view;
	return view;
     */
    return nil;
}

#pragma mark -
#pragma mark Swipe Gesture Setup/Actions

#pragma mark - setup

-(void)setupGestures {
	UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(movePanel:)];
	[panRecognizer setMinimumNumberOfTouches:1];
	[panRecognizer setMaximumNumberOfTouches:1];
	[panRecognizer setDelegate:self];
    
	[_centerViewController.view addGestureRecognizer:panRecognizer];
}

-(void)movePanel:(id)sender {
	[[[(UITapGestureRecognizer*)sender view] layer] removeAllAnimations];
    
	//CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
	CGPoint velocity = [(UIPanGestureRecognizer*)sender velocityInView:[sender view]];
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        UIView *childView = nil;
        
        if(velocity.x > 0) {
            if (!_showingRightPanel) {
                childView = [self getLeftView];
            }
        } else {
            /*
            if (!_showingLeftPanel) {
                childView = [self getRightView];
            }*/
			
        }
        // make sure the view we're working with is front and center
        [self.view sendSubviewToBack:childView];
        [[sender view] bringSubviewToFront:[(UIPanGestureRecognizer*)sender view]];
	}
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        
        if(velocity.x > 0) {
            // NSLog(@"gesture went right");
        } else {
            // NSLog(@"gesture went left");
        }
        
        if (!_showPanel) {
            [self movePanelToOriginalPosition];
        } else {
            if (_showingLeftPanel) {
                [self movePanelRight];
            }  else if (_showingRightPanel) {
                [self movePanelLeft];
            }
        }
	}
    /*
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateChanged) {
        
        if(velocity.x > 0) {
            // NSLog(@"gesture went right");
        } else {
            // NSLog(@"gesture went left");
        }
        
        // are we more than halfway, if so, show the panel when done dragging by setting this value to YES (1)
        _showPanel = abs([sender view].center.x - _centerViewController.view.frame.size.width/2) > _centerViewController.view.frame.size.width/2;
        
        // allow dragging only in x coordinates by only updating the x coordinate with translation position
        [sender view].center = CGPointMake([sender view].center.x + translatedPoint.x, [sender view].center.y);
        [(UIPanGestureRecognizer*)sender setTranslation:CGPointMake(0,0) inView:self.view];
        
        // if you needed to check for a change in direction, you could use this code to do so
        if(velocity.x*_preVelocity.x + velocity.y*_preVelocity.y > 0) {
            // NSLog(@"same direction");
        } else {
            // NSLog(@"opposite direction");
        }
        
        _preVelocity = velocity;
         
	}*/
}

#pragma mark -
#pragma mark Delegate Actions

-(void)movePanelLeft {
	UIView *childView = [self getRightView];
	[self.view sendSubviewToBack:childView];
    
	[UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
		 _centerViewController.view.frame = CGRectMake(-self.view.frame.size.width + PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
	 }
	 completion:^(BOOL finished) {
		 if (finished) {
			 
			 _centerViewController.rightButton.tag = 0;
		 }
	 }];
}

-(void)movePanelRight {
	UIView *childView = [self getLeftView];
	[self.view sendSubviewToBack:childView];
    
	[UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
		 _centerViewController.view.frame = CGRectMake(self.view.frame.size.width - PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
	 }
	 completion:^(BOOL finished) {
		 if (finished) {
			 _centerViewController.leftButton.tag = 0;
		 }
	 }];
}

-(void)movePanelToOriginalPosition {
	[UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
		 _centerViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	 }
	 completion:^(BOOL finished) {
		 if (finished) {
			 [self resetMainView];
		 }
	 }];
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
