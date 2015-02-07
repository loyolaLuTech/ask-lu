

#import "CellData.h"

@implementation CellData

+ (id)itemWithTitle:(NSString *)title withImage:(UIImage *)image withCreator:(NSString *)creator
{
    return [[self alloc] initWithTitle:(NSString *)title withImage:(UIImage *)image withCreator:(NSString *)creator];
}

- (id)initWithTitle:(NSString *)title withImage:(UIImage *)image withCreator:(NSString *)creator
{
    if ((self = [super init]))
    {
        _title = title;
        _image = image;
        _creator = creator;
    }
    
    return self;
}

@end
