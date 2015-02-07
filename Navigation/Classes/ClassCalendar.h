

#import <Foundation/Foundation.h>

@interface ClassCalendar : NSObject {
    //The metadata contain the results
    NSMutableArray *metadata;
    //Store the temp classes before going into the results metadata
    NSMutableArray *tempnotclassess;
}
//Cleans the memory
-(void)cleanArray;
//Returns the metadata
-(NSMutableArray *)getClassesForAnaylsis;
//Checks the classes against the data string
-(BOOL)checkClassesAgainstString:(NSString *)thedata;
//Function search for string in the substring and if not add to tempnotclassess
-(BOOL)dStE:(NSString *)str IS:(NSString *)data;
//Runs the program to see if the string contains substrings
-(BOOL)areAllClassesAccounted:(NSString *)str andData:(NSString *)thedata;
////Function search for string in the substring to check
-(BOOL)dStEFD:(NSString *)str IS:(NSString *)data;
//Function to puts results in metadata if it is a full major
-(void)isAMajor:(NSString *)str;
//Function to puts results in metadata if it is not a full major and pulls an array in it
-(void)isNotAMajor:(NSString *)str classes:(NSMutableArray *)array;
//Setting the @properties of the metadata so it is not removed from the memory
@property (nonatomic,retain) NSMutableArray *metadata;

@end
