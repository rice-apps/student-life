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
@property (nonatomic, strong) NSMutableArray *arrResults;

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
    
    // Sets destination
    NSString *destinationPath = [self.documentsDirectory stringByAppendingPathComponent:self.dbFilename];
    // Checks if file exists at destination, if not
    if (![[NSFileManager defaultManager] fileExistsAtPath:destinationPath]){
        
        // Sets source path
        NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self.dbFilename];
        NSError *error;
        
        // Copies from source to destination
        [[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:destinationPath error:&error];
        
        // Error handling
        if (error != nil){
            NSLog(@"%@", [error localizedDescription]);
        }
    }
}

-(void)runQuery:(const char *)query isQueryExecutable:(BOOL)queryExecutable {

    // Initialize database and path
    sqlite3 *sqlite3Database;
    NSString *dbPath = [self.documentsDirectory stringByAppendingPathComponent:self.dbFilename];
    
    // Initialize results dictionary
    if (self.arrResults != nil){
        [self.arrResults removeAllObjects];
        self.arrResults = nil;
    }
    self.arrResults = [[NSMutableArray alloc] init];
    
    // Initialize column names dictionary
//    if (self.dictColumnNames != nil){
//        [self.dictColumnNames removeAllObjects];
//        self.dictColumnNames = nil;
//    }
//    self.dictColumnNames = [[NSMutableArray alloc] init];
    
    // Open database
    BOOL openDatabaseResult = sqlite3_open([dbPath UTF8String], &sqlite3Database);
    
    if (openDatabaseResult == SQLITE_OK) {
        
        sqlite3_stmt *compiledStatement;
        
        // Load data from database to memory
        BOOL prepareStatementResult = sqlite3_prepare(sqlite3Database, query, -1, &compiledStatement, NULL);
        
        if (prepareStatementResult == SQLITE_OK) {
            
            // Check if query is non-executable
            if (!queryExecutable) {
                
                // Initialize row
                NSMutableDictionary *dictDataRow;
                
                // Loop through results and add to results array
                while (sqlite3_step(compiledStatement) == SQLITE_ROW) {
                    
                    // Initialize array that stores results row by row
                    dictDataRow = [[NSMutableDictionary alloc] init];
                    // Get number of columns
                    int totalColumns = sqlite3_column_count(compiledStatement);
                    for (int i = 0; i < totalColumns; i++){
                        // Store data
                        char *dbDataAsChars = (char *)sqlite3_column_text(compiledStatement, i);
                        char *dbTitleAsChars = (char *)sqlite3_column_name(compiledStatement, i);
                        
                        if (dbDataAsChars != NULL) {
                            [dictDataRow setObject:[NSString stringWithUTF8String:dbDataAsChars] forKey:[NSString stringWithUTF8String:dbTitleAsChars]];
                        }
                        
                    }
                    // Store row
                    if (dictDataRow.count > 0) {
                        [self.arrResults addObject:dictDataRow];
                    }
                }
            }
            else {
                // Execute query
                int executeQueryResults = sqlite3_step(compiledStatement);
                if (executeQueryResults == SQLITE_DONE) {
                    // Keep affected rows
                    self.affectedRows = sqlite3_changes(sqlite3Database);
                    // Keep affected ID
                    self.lastInsertedRowID = sqlite3_last_insert_rowid(sqlite3Database);
                    
                }
                // Query cannot execute
                else {
                    NSLog(@"DB Error: %s", sqlite3_errmsg(sqlite3Database));
                }
            }
        }
        // Database cannot open
        else {
            NSLog(@"DB Error: %s", sqlite3_errmsg(sqlite3Database));
        }
        // Release compiled statement
        sqlite3_finalize(compiledStatement);
    }
    // Close database
    sqlite3_close(sqlite3Database);
}
-(NSArray *)loadDataFromDB:(NSString *)query{
    [self runQuery:[query UTF8String] isQueryExecutable:NO];
    
    return (NSArray *)self.arrResults;
}
-(void)executeQuery:(NSString *)query{
    NSLog(@"executable");
    [self runQuery:[query UTF8String] isQueryExecutable:YES];

}

@end

