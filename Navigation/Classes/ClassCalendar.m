

#import "ClassCalendar.h"

@implementation ClassCalendar
@synthesize metadata;//synthesize the metadata

-(NSMutableArray *)getClassesForAnaylsis{
    //Return metadata to theclass that is calling it
    return metadata;
}
-(BOOL)checkClassesAgainstString:(NSString *)thedata {
    //Init the NSMutableArray temp array
    tempnotclassess = [[NSMutableArray alloc] init];
    //Init the NSMutableArray metadata array
    metadata = [[NSMutableArray alloc] init];
    /*
     Instructions:
     
     if ([self areAllClassesAccounted:@"All the classes that are mandatory and split by a ,|All the classes or other classes that are split by a ," andData:thedata]) {
     [self isAMajor:@"Computer Science"]; <-- If data has all classes then inputs you have a major.
     } else {
     [self isNotAMajor:@"Computer Science" classes:tempnotclassess]; <-- If data has npt all classes then inputs you do not have a major and inputs an array of the classes you would need to take.
     }
     [self cleanArray]; <-- Cleans up the memory before comparing next class
     
     */
    //Check the computer science
    /*
     if ([self areAllClassesAccounted:@"COMP 363,COMP 163,COMP 264,COMP 271,COMP 313,COMP 317,MATH 161,MATH 162|COMP 150orCOMP 170,COMP 374orCOMP 372,COMP 390orCOMP 391" andData:thedata]) {
     [self isAMajor:@"Computer Science"];
     } else {
     [self isNotAMajor:@"Computer Science" classes:tempnotclassess];
     }
     [self cleanArray];
     
     //Check the computer software
     if ([self areAllClassesAccounted:@"COMP 363,COMP 163,COMP 264,COMP 271,COMP 313,COMP 317,MATH 131,MATH 132|COMP 150orCOMP 170,COMP 374orCOMP 372,COMP 390orCOMP 391" andData:thedata]) {
     [self isAMajor:@"Computer Software"];
     } else {
     [self isNotAMajor:@"Computer Software" classes:tempnotclassess];
     }
     [self cleanArray];
     */
    
    //NSString *str = @"“Required”[10:19],BIOL 101-3,BIOL 111-1,BIOL 102-3,BIOL 112-1,BIOL 251-3,BIOL 265-3,BIOL 282-3,#1|BIOL 251-1|BIOL 266-1|BIOL 283-1<>”Biology Electives”[60:19],$|BIOL 300-1|BIOL 302-4|BIOL 303-1|BIOL 304-3|BIOL 310-3|BIOL 313-3|BIOL 314-3|BIOL 315-4|BIOL 316-4|BIOL 317-3|BIOL 319-3|BIOL 320-3|BIOL 323-4|BIOL 325-3|BIOL 326-4|BIOL 327-4|BIOL 328-3|BIOL 335-4|BIOL 341-4|BIOL 342-4|BIOL 345-3|BIOL 346-3|BIOL 350-4|BIOL 352-3|BIOL 354-3|BIOL 358-3|BIOL 360-3|BIOL 362-3|BIOL 363-4|BIOL 364-4|BIOL 366-3|BIOL 366L-2|BIOL 376-4|BIOL 368-4|BIOL 369-3|BIOL 370-4|BIOL 371-3|BIOL 371L-1|BIOL 372-4|BIOL 373-3|BIOL 374-3|BIOL 375-4|BIOL 376-3|BIOL 377-3|BIOL 380-3|BIOL 382-3|BIOL 383-3|BIOL 385-4|BIOL 387-3|BIOL 388-3|BIOL 389-3|BIOL 390-4|BIOL 391-5|BIOL 393-3|BIOL 394-1|BIOL 395-?[1-4]|BIOL 396-3|BIOL 397H-3|BIOL 398-?[1-3]|BIOL 399-?[1-3]<>”Biology Laboratory”[20],BIOL 111,BIOL 112,#1|BIOL 252|BIOL 266|BIOL 283,#2|BIOL 210|BIOL 252| BIOL 266|BIOL 283|BIOL 313|BIOL 342|BIOL 360|BIOL 366|BIOL 373|BIOL 374|BIOL 390|BIOL 395|BIOL 396|BIOL 397|BIOL 398<>”Chemistry”[12:16],CHEM 101-3,CHEM 111-1,CHEM 102-3,CHEM 112-1,CHEM 223-3,CHEM 225-1,CHEM 224-3,CHEM 226-1,CHEM 105*CHEM 106,CHEM 221*CHEM 222<>”Mathematics”[4:6],MATH 131*MATH 161,MATH 132*MATH 162<>”Physics”[8],PHYS 111*PHYS 113,PHYS 131*PHYS 133,PHYS 112*PHYS 114,PHYS 132*PHYS 134";
    
    // NSString *str = @"“Introductory Courses”[4:12]$#4|HIST 101-3|HIST 102-3|HIST 106-3|HIST 203-3|HIST 204-3|HIST 208-3|HIST 209-3|HIST 210-3|HIST 211-3|HIST 212-3|HIST 213-3 <>”Methods Course”[1:3]HIST 291-3 <>“Required Areas: 300-Level Pre-1700 European History”[1:3] #1|HIST 300(Ottoman Empire)-3|HIST 300(Emperors Bishops & Barbarians)-3|HIST 300B-3|HIST 307-3|HIST 324 <>“Required Areas: 300-Level Post-1700 European History”[1:3]#1|HIST 300C(European Nationalism)-3|HIST 300C(Concentration Camps)-3|HIST 304|HIST 321-3|HIST 324-3|HIST 335-3|HIST 340-3<>”Required Areas: 300-Level US History”[1:3]#1|HIST 300D-3|HIST 386-3|HIST 394-3|<>”Required Areas: 300-Level Africa, Asia, Latin America, or Middle East”[1:3]#1|HIST 300E(China since 1949)-3|HIST 300E(Modern Vietnamese History)-3|HIST 313|HIST 342A|HIST 345|HIST 380A<>”Elective Courses”[3:9]$#3|HIST 300(Ottoman Empire)-3|HIST 300(Emperors Bishops & Barbarians)-3|HIST 300B-3|HIST 307-3|HIST 324|HIST 300C(European Nationalism)-3|HIST 300C(Concentration Camps)-3|HIST 304|HIST 321-3|HIST 324-3|HIST 335-3|HIST 340-3|HIST 300D-3|HIST 386-3|HIST 394-3|HIST 300E(China since 1949)-3|HIST 300E(Modern Vietnamese History)-3|HIST 313|HIST 342A|HIST 345|HIST 380A";
    
    if ([self areAllClassesAccounted:@"Foundation Courses,THTR 253-3,DANC 250-3,DANC 270-3,DANC 240-1[]Applied Course,DANC 341-8|DANC 343-8,DANC 312-2|DANC 314-2,DANC 322-4|DANC 324-4[]Synthesis,DANC 323-2,DANC 360-3,DANC 370-3,DANC 394-1" andData:thedata]) {
        [self isAMajor:@"Dance Major"];
    } else {
        [self isNotAMajor:@"Dance Major" classes:tempnotclassess];
    }
    [self cleanArray];
    
    
    if ([self areAllClassesAccounted:@"'Biology Courses: Required',BIOL 101-3,BIOL 111-1,BIOL 102-3,BIOL 112-1,BIOL 251-3,BIOL 265-3,BIOL 282-3,1!BIOL 252-1*BIOL 266-1*BIOL 283-1[]'Chemistry',1!CHEM 101-3*CHEM 105-3*CHEM 106-3,CHEM 111-1,1!CHEM 102-3,CHEM 105-3,CHEM 106-3,CHEM 112-1,1!CHEM 223-3*CHEM 221-3*CHEM 222-3,CHEM 225-1,1!CHEM 224-3*CHEM 221-3*CHEM 222-3,CHEM 226-1[]'Mathematics',MATH 131-3|MATH 161-4,MATH 132-3|MATH 162-4[]'Physics',PHYS 111-3|PHYS 113-4,PHYS 131-1|PHYS 133-1,PHYS 112-3|PHYS 114-4,PHYS 132-1|PHYS 134[]'Electives',10#BIOL 101-3*BIOL 102-3*BIOL 109-3*BIOL 110-3*BIOL 111-1*BIOL 112-1*BIOL 152-4*BIOL 153-4*BIOL 195-3*BIOL 205-4*BIOL 209-3*BIOL 210-2*BIOL 215-3*BIOL 240-3*BIOL 241-3*BIOL 242-4*BIOL 243-4*BIOL 251-3*BIOL 252-1*BIOL 265-3*BIOL 266-1*BIOL 280-3*BIOL 282-3*BIOL 283-1*BIOL 296-1,9#BIOL 300-1*BIOL 302-4*BIOL 303-1*BIOL 304-3*BIOL 310-3*BIOL 313-3*BIOL 314-3*BIOL 315-4*BIOL 316-4*BIOL 317-3*BIOL 319-3*BIOL 320-3*BIOL 323-4*BIOL 325-3*BIOL 326-4*BIOL 327-4*BIOL 328-3*BIOL 335-4*BIOL 341-4*BIOL 342-4*BIOL 345-3*BIOL 346-3*BIOL 350-4*BIOL 352-3*BIOL 354-3*BIOL 358-3360-3*BIOL 362-3*BIOL 363-4*BIOL 364-4*BIOL 366-4*BIOL 366L-2*BIOL 367-4*BIOL 368-4*BIOL 369-3*BIOL 370-4*BIOL 371-3*BIOL 371L-1*BIOL 372-4*BIOL 373-3*BIOL 374-3*BIOL 375-4*BIOL 376-3*BIOL 377-3*BIOL 380-3*BIOL 382-3*BIOL 383-3*BIOL 385-4*BIOL 387-3*BIOL 388-3*BIOL 389-3*BIOL 390-4*BIOL 391-5*BIOL 393-3*BIOL 394-1*BIOL 395-1*BIOL 396-3*BIOL 397H-3*BIOL 398-1*BIOL 399-1[]'Laboratory Requirements',BIOL 111-1,BIOL 112-1,1!BIOL 252-1*BIOL 266-2*BIOL 283-1,2!BIOL 210-1*BIOL 252-1*BIOL 266-1*BIOL 283-1*BIOL 313-1*BIOL 342-1*BIOL 360-1*BIOL 366-1*BIOL 373-1*BIOL 374-1*BIOL 390-1*BIOL 395-1*BIOL 396-1*BIOL 397-1*BIOL 398-1" andData:thedata]) {
        [self isAMajor:@"Biology Major"];
    } else {
        [self isNotAMajor:@"Biology Major" classes:tempnotclassess];
    }
    [self cleanArray];
    
   
    if ([self areAllClassesAccounted:@"'Object Oriented Choice',COMP 170-3[]'COMP 372 or COMP 374',COMP 372-3|COMP 374-3[]'Practicum',COMP 390-3,COMP 398-3,COMP 391-1[]'Design and Analysis of Computer Algorithms',COMP 363-3[]'Computer Science Electives',COMP 312-3,ISOM 349-3,MATH 331-3,1!COMP 300-3*COMP 305-3*COMP 309-3*COMP 312-3*COMP 313-3*COMP 314-1*COMP 35-2*COMP 316-1*COMP 317-3*COMP 319-1[]'Ancillary Math',MATH 161-4,MATH 162-4[]'Major Residency',COMP 163-3,COMP 170-3,COMP 264-3,COMP 271-3,COMP 312-3,COMP 313-3,COMP 317-3,COMP 372-3,COMP 398-3" andData:thedata]) {
     [self isAMajor:@"Computer Science"];
     } else {
     [self isNotAMajor:@"Computer Science" classes:tempnotclassess];
     }
     [self cleanArray];
    
    
    if ([self areAllClassesAccounted:@"'Major Residency',PHYS 125-4,PHYS 135-1,PHYS 126-3,PHYS 126F-1,PHYS 136-1,PHYS 235-3,PHYS 237-1,PHYS 238-1,PHYS 301-3,PHYS 303-3,PHYS 303L-1,PHYS 310-3,PHYS 310L-1,PHYS 314-3,PHYS 328-3,PHYS 351-3,PHYS 361-3[]'Mathematics',MATH 161-4,MATH 162-4,MATH 263-4,MATH 264-3[]'Computational Courses',1!COMP 170-3*MATH 215-3" andData:thedata]) {
        [self isAMajor:@"Physics Major"];
    } else {
        [self isNotAMajor:@"Physics Major" classes:tempnotclassess];
    }
    [self cleanArray];
    
    
    if ([self areAllClassesAccounted:@"'Courses Required',CHEM 105-5,CHEM 106-4,CHEM 221-4,CHEM 222-4,CHEM 212-3,CHEM 214-1,CHEM 301-4,CHEM 302-3,CHEM 303-1,CHEM 370-3,CHEM 314-4,CHEM 340-3,CHEM 341-1[]'Math Courses',MATH 161-4,MATH 162-4,MATH 263-4[]'Physics Courses Required',PHYS 111K-3,PHYS 112K-3,PHYS 111L-1,PHYS 112L-1" andData:thedata]) {
        [self isAMajor:@"Chemistry Major"];
    } else {
        [self isNotAMajor:@"Chemistry Major" classes:tempnotclassess];
    }
    [self cleanArray];
    
    if ([self areAllClassesAccounted:@"'Biology',BIOL 101-3,BIOL 282-3,BIOL 283-1,BIOL 387-3,BIOL 388-3[]'Chemistry',CHEM 101-3|CHEM 105-4,CHEM 102-3|CHEM 106-4,CHEM 223-3|CHEM 221-4,CHEM 224-3|CHEM 222-4,CHEM 361-3[]'Computer Science',COMP 163-3,COMP 170-3,COMP 271-3,COMP 383-4[]'Mathematics and Statistics',MATH 131-3|MATH 161-4,MATH 132-3|MATH 162-4,STAT 335-3,STAT 337-4|STAT 336-3[]'Extras',1!BIOL 390-4*BIOL 391-5*CHEM 365-3*COMP 363-3[]'Research',BIOL 398-1|BIOL 399-1" andData:thedata]) {
        [self isAMajor:@"Bioinformatics Major"];
    } else {
        [self isNotAMajor:@"Bioinformatics Major" classes:tempnotclassess];
    }
    
    if ([self areAllClassesAccounted:@"'Physics',PHYS 125-4,PHYS 135-1,PHYS 126-3,PHYS 126F-1,PHYS 136-1,PHYS 235-3,PHYS 237-1,PHYS 301-3,PHYS 328-3,PHYS 314-3,PHYS 351-3[]'Biology',BIOL 101-3,BIOL 111-1,BIOL 102-3,BIOL 112-1,BIOL 251-3,BIOL 282-3,BIOL 366-3[]'Mathematics',MATH 161-4,MATH 162-4,MATH 263-4,MATH 264-3[]'Chemistry',CHEM 101-3*CHEM 111-1$CHEM 105-4,CHEM 102-3*CHEM 112-1$CHEM 106-4,CHEM 223-3*CHEM 225-1$CHEM 221-4,CHEM 224-3*CHEM 226-1$CHEM 222-4" andData:thedata]) {
        [self isAMajor:@"Bio Physics Major"];
    } else {
        [self isNotAMajor:@"Bio Physics Major" classes:tempnotclassess];
    }
    [self cleanArray];

    
     /*
     if ([self areAllClassesAccounted:@"" andData:thedata]) {
     [self isAMajor:@""];
     } else {
     [self isNotAMajor:@"" classes:tempnotclassess];
     }
     [self cleanArray];
     if ([self areAllClassesAccounted:@"" andData:thedata]) {
     [self isAMajor:@""];
     } else {
     [self isNotAMajor:@"" classes:tempnotclassess];
     }
     [self cleanArray];
     if ([self areAllClassesAccounted:@"" andData:thedata]) {
     [self isAMajor:@""];
     } else {
     [self isNotAMajor:@"" classes:tempnotclassess];
     }
     [self cleanArray];
     if ([self areAllClassesAccounted:@"" andData:thedata]) {
     [self isAMajor:@""];
     } else {
     [self isNotAMajor:@"" classes:tempnotclassess];
     }
     [self cleanArray];
     
     
     */
    
    
    return YES;
}
-(void)isAMajor:(NSString *)str {
    
    
     //Creates a new data object
     NSMutableData *data = [[NSMutableData alloc] init];
     //Creates a new NSKeyedArchiver object for archiving results
     NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
     //Creates a key to let program know that your a full major
     [archiver encodeObject:@"Y" forKey:@"Key"];
     //Creates a new string to let the program know what major it is
     [archiver encodeObject:str forKey:@"Major"];
     //Finish encoding the NSKeyedArchiver
     [archiver finishEncoding];
     //Add results to metadata for later
     [metadata addObject:data];
     
}
-(void)isNotAMajor:(NSString *)str classes:(NSMutableArray *)array {
    
     //Creates a new data object
     NSMutableData *data = [[NSMutableData alloc] init];
     //Creates a new NSKeyedArchiver object for archiving results
     NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
     //Creates a key to let program know that your not a full major
     [archiver encodeObject:@"N" forKey:@"Key"];
     //Creates a new string to let the program know what major it is
     [archiver encodeObject:str forKey:@"Major"];
     //Add an array of class strings
     [archiver encodeObject:array forKey:@"Data"];
     [archiver finishEncoding];
     //Add results to metadata for later
     [metadata addObject:data];
    
}
-(void)cleanArray {
    //Set tempnotclassess to NULL
    tempnotclassess = NULL;
    //Init tempnotclassess from NULL
    tempnotclassess = [[NSMutableArray alloc] init];
}
-(BOOL)areAllClassesAccounted:(NSString *)str andData:(NSString *)thedata {
    
    
    NSArray *parts = [str componentsSeparatedByString:@"[]"];
    NSLog(@"NM: %@",parts);
    NSMutableArray *classNeedToBeTaken = [[NSMutableArray alloc]init];

    for (int i = 0; i < [parts count]; i++) {
        NSLog(@"PART: %@",[parts objectAtIndex:i]);
        
        NSArray *subparts = [[parts objectAtIndex:i] componentsSeparatedByString:@","];
        
        //NSLog(@"%@",[subparts objectAtIndex:0]);
        

        for (int i = 1; i < [subparts count]; i++) {
            
            if ([[subparts objectAtIndex:i] rangeOfString:@"!"].location != NSNotFound) {
                //NSLog(@"!");
                NSArray *data = [[subparts objectAtIndex:i] componentsSeparatedByString:@"!"];
                
                NSString *numberofclasses = [data objectAtIndex:0];
                NSInteger numberoftotalclasses = [numberofclasses intValue];
                NSInteger startclass = 0;
                
                NSArray *classes = [[data objectAtIndex:1] componentsSeparatedByString:@"*"];
                
                for (int i = 0; i < [classes count]; i++) {
                    NSArray *class = [[classes objectAtIndex:i] componentsSeparatedByString:@"-"];
                    if ([self dStE:[class objectAtIndex:0] IS:thedata]) {
                        startclass++;
                    } else {
                        
                    }
                }
                
                if (startclass >= numberoftotalclasses) {
                    //NSLog(@"All Credit Set For %@", [subparts objectAtIndex:i]);
                } else {
                    for (int i = 0; i < [classes count]; i++) {
                        [classNeedToBeTaken addObject:[classes objectAtIndex:i]];
                    }
                }
                
            } else if ([[subparts objectAtIndex:i] rangeOfString:@"#"].location != NSNotFound) {
                NSArray *data = [[subparts objectAtIndex:i] componentsSeparatedByString:@"#"];

                NSString *credithours = [data objectAtIndex:0];
                NSInteger hours = [credithours intValue];
                NSInteger hoursearned = 0;
                NSArray *classes = [[data objectAtIndex:1] componentsSeparatedByString:@"*"];
                
                for (int i = 0; i < [classes count]; i++) {
                    NSArray *class = [[classes objectAtIndex:i] componentsSeparatedByString:@"-"];
                    if ([self dStE:[class objectAtIndex:0] IS:thedata]) {
                        NSInteger newhour = [[class objectAtIndex:1] intValue];
                        hoursearned += newhour;
                    } else {
                        
                    }
                }
                
                if (hoursearned >= hours) {
                    //NSLog(@"All Credit Set For %@ %ld", [subparts objectAtIndex:i], (long)hoursearned);
                } else {
                    for (int i = 0; i < [classes count]; i++) {
                        [classNeedToBeTaken addObject:[classes objectAtIndex:i]];
                    }
                }
                
            } else if ([[subparts objectAtIndex:i] rangeOfString:@"|"].location != NSNotFound) {
                NSArray *data = [[subparts objectAtIndex:i] componentsSeparatedByString:@"|"];

                NSArray *classone = [[data objectAtIndex:0] componentsSeparatedByString:@"-"];
                NSArray *classtwo = [[data objectAtIndex:1] componentsSeparatedByString:@"-"];

                if ([self dStE:[classtwo objectAtIndex:0] IS:thedata] || [self dStE:[classone objectAtIndex:0] IS:thedata]) {
                    
                } else {
                    NSString *str = [NSString stringWithFormat:@"%@ or %@",[data objectAtIndex:0],[data objectAtIndex:1] ];
                    [classNeedToBeTaken addObject:str];
                    
                }
                
            } else if ([[subparts objectAtIndex:i] rangeOfString:@"$"].location != NSNotFound) {
                //NSArray *data = [[subparts objectAtIndex:i] componentsSeparatedByString:@"$"];

                
            } else {
                
                NSArray *class = [[subparts objectAtIndex:i] componentsSeparatedByString:@"-"];
                if ([self dStE:[class objectAtIndex:0] IS:thedata]) {
                    
                } else {
                    [classNeedToBeTaken addObject:[subparts objectAtIndex:i]];
                }
                
            }
            
        }
        
      
    }
    tempnotclassess = classNeedToBeTaken;
    
    if (classNeedToBeTaken.count != 0) {
        return false;
    } else {
        return true;
    }
    
    
    
    /*
     //creates a new boolean value to return all function is done
     BOOL thereturn = true;
     //Creates an array of the split values
     NSArray *parts = [str componentsSeparatedByString:@"|"];
     //Gets first string from the array of split strings
     NSString *stringone = [parts objectAtIndex:0];
     //Gets second string from the array of split strings
     NSString *stringtwo = [parts objectAtIndex:1];
     //Creates an array of split strings
     NSArray *ar = [stringone componentsSeparatedByString:@","];
     //For loop to run though the mandatory classes from first half of the data string
     for (int i = 0; i < [ar count]; i++) {
     //Gets temp string from array at index
     NSString *temp = [ar objectAtIndex:i];
     //Returns a boolean from other function
     BOOL tempreturn = [self dStE:temp IS:thedata];
     //If statement to test if tempturn is true or false and do oppsite
     if(!tempreturn) {
     //Sets the thereturn boolean to false
     thereturn = false;
     }
     }
     //Creates an array of split strings
     NSArray *or = [stringtwo componentsSeparatedByString:@","];
     //For loop to run though the mandatory classes from first half of the data string
     for (int i = 0; i < [or count]; i++) {
     //Gets temp string from array at index
     NSString *temp = [or objectAtIndex:i];
     //Creates an array of split strings
     NSArray *classes = [temp componentsSeparatedByString:@"or"];
     //Gets classone string from array at index
     NSString *classone = [classes objectAtIndex:0];
     //Gets classtwo string from array at index
     NSString *classtwo = [classes objectAtIndex:1];
     //If statement to test if tempturn is true or false and do oppsite
     if(!([self dStEFD:classone IS:thedata] || [self dStEFD:classtwo IS:thedata])) {
     //If statement to test if tempturn is true or false and do oppsite
     if (![self dStEFD:classone IS:thedata]) {
     //Add classone to tempnotclassess array
     //NSLog(@"Missing Class:%@",str);
     [tempnotclassess addObject:classone];
     //Sets the thereturn boolean to false
     thereturn = false;
     }
     //If statement to test if tempturn is true or false and do oppsite
     if (![self dStEFD:classtwo IS:thedata]) {
     //Add classone to tempnotclassess array
     //NSLog(@"Missing Class:%@",str);
     [tempnotclassess addObject:classtwo];
     //Sets the thereturn boolean to false
     thereturn = false;
     }
     }
     
     }
     
     */
    //Returns thereturn boolean value
    return false;
}
-(BOOL)dStEFD:(NSString *)str IS:(NSString *)data {
    //If statement checks if the string is in the main string data
    if ([data rangeOfString:str].location == NSNotFound) {
        //Sets the thereturn boolean to false
        return false;
    } else {
        //Sets the thereturn boolean to true
        return true;
    }
    return nil;
}
-(BOOL)dStE:(NSString *)str IS:(NSString *)data {
    //If statement checks if the string is in the main string data
    if ([data rangeOfString:str].location == NSNotFound) {
        //Add str to tempnotclassess array
        //NSLog(@"Missing Class:%@",str);
        [tempnotclassess addObject:str];
        //Sets the thereturn boolean to false
        return false;
    } else {
        //Sets the thereturn boolean to true
        return true;
    }
    return nil;
}

@end
