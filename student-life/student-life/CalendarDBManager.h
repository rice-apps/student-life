//
//  CalendarDBManager.h
//  student-life
//
//  Created by Jeffrey Xiong on 3/16/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface CalendarDBManager : NSObject

//@property (nonatomic, strong) NSMutableArray *dictColumnNames;
@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertedRowID;

-(instancetype)initWithDatabaseFilename:(NSString *)dbFile;
-(NSArray *)loadDataFromDB:(NSString *)query;
-(void)executeQuery:(NSString *)query;

@end
