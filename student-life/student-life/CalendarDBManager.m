//
//  CalendarDBManager.m
//  student-life
//
//  Created by Jeffrey Xiong on 3/16/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//

#import "CalendarDBManager.h"
@interface CalendarDBManager()

@property (nonatomic, strong) NSString *documentsDirectory;
@property (nonatomic, strong) NSString *dbFilename;
@property (nonatomic, strong) NSMutableDictionary *dictResults;

-(void)copyDatabaseIntoDocumentsDirectory;
-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable;

@end

@implementation CalendarDBManager

-(instancetype)initWithDatabaseFilename:(NSString *)dbFile{
    /*
        Initializes database from document directory
     */
    self = [super init];
    if (self){
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        self.documentsDirectory = [paths objectAtIndex:0];
        self.dbFilename = dbFile;
        [self copyDatabaseIntoDocumentsDirectory];
    }
    return self;
}

-(void)copyDatabaseIntoDocumentsDirectory{
    /* 
        Copies database file from app bundle to documents directory
     */
    // Sets destination
    NSString *destinationPath = [self.documentsDirectory stringByAppendingPathComponent:self.dbFilename];
    // Checks if file exists at destination, if not
    if (![[NSFileManager defaultManager] fileExistsAtPath:destinationPath]){
        // Sets source path
        NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.dbFilename];
        NSError *error;
        // Copies from source to destination
        [[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:destinationPath error:&error];
        if (error != nil){
            // Error
            NSLog(@"%@", [error localizedDescription]);
        }
    }
}

-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable{
    // Initialize database and path
    sqlite3 *sqlite3Database;
    NSString *dbPath = [self.documentsDirectory stringByAppendingPathComponent:self.dbFilename];
    
    // Initialize results dictionary
    if (self.dictResults != nil){
        [self.dictResults removeAllObjects];
        self.dictResults = nil;
    }
    self.dictResults = [[NSMutableDictionary alloc] init];
    
    // Initialize column names dictionary
    if (self.dictColumnNames != nil){
        [self.dictColumnNames removeAllObjects];
        self.dictColumnNames = nil;
    }
    self.dictColumnNames = [[NSMutableDictionary alloc] init];
    
    // Open database
    BOOL openDatabaseResult = sqlite3_open([dbPath UTF8String], &sqlite3Database);
    if (openDatabaseResult == SQLITE_OK) {
        sqlite3_stmt *compiledStatement;
        BOOL prepareStatementResult = sqlite3_prepare(sqlite3Database, query, -1, &compiledStatement, NULL);
        if (prepareStatementResult == SQLITE_OK) {
            if (!queryExecutable){
            
            }
        }
    }
    
    
    
}

@end

