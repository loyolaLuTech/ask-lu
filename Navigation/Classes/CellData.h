
@interface CellData : NSObject

+ (id)itemWithTitle:(NSString *)title withImage:(UIImage *)image withCreator:(NSString *)creator;
- (id)initWithTitle:(NSString *)title withImage:(UIImage *)image withCreator:(NSString *)creator;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) UIImage  *image;
@property (nonatomic, copy) NSString *creator;

@end