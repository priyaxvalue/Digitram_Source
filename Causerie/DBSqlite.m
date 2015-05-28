

#import "DBSqlite.h"
#define DB_Name @"Causerie.sqlite"
@implementation DBSqlite

static DBSqlite *dbManager;

+(DBSqlite *)dbManager
{
    @try{
        if (dbManager == nil) {
            dbManager = [[DBSqlite alloc] init];
        }
        return dbManager;
    }
    @catch (NSException *exception) {
    }
    
}
-(NSString *) sqlliteapppath
{
    //application path for sqlite
    @try{
        NSString *apppath = [[NSBundle mainBundle] bundlePath];
        apppath = [ apppath stringByAppendingPathComponent:DB_Name];
        NSLog(@"The Location of Database is...%@",apppath);
        
        return apppath;
    }
    @catch (NSException *exception) {
    }
    
}
-(NSString *) doccumentspath
{
    //document path for sqlite
    @try{
        NSArray *ary = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *docpath = [ary objectAtIndex:0];
        docpath = [docpath stringByAppendingPathComponent:DB_Name];
        return docpath;
    }
    @catch (NSException *exception) {
    }
    
}
-(void)copysqllitetodocuments
{
    //check whether sqlite is present
    //if not present create sqlite
    @try{
        NSString *apppath = [self sqlliteapppath];
        NSString *docpath = [self doccumentspath];
        
        NSFileManager *fl = [NSFileManager defaultManager];
        if(![fl fileExistsAtPath:docpath])
        {
            BOOL s = [fl copyItemAtPath : apppath toPath : docpath error:nil];
            if(s){
            }
            else {
            }
        }
    }
    @catch (NSException *exception) {
    }
}
-(id)init {
    
    if (self = [super init])
    {
        @try{
            [self sqlliteapppath];
            [self doccumentspath];
            [self copysqllitetodocuments];
            NSString *databasePath = [self doccumentspath];
            NSLog(@"mjjeje Database path : %@", databasePath) ;
            if (sqlite3_open([databasePath UTF8String], &_database) != SQLITE_OK)
            {
                
                NSLog(@"Returning nil") ;
                return nil;
            }
            else
            {
                NSLog(@"DB Open") ;
            }
            
        }
        @catch (NSException *exception)
        {
            //      NSLog(@"NewCoSqlite-init %@:%@", [exception name], [exception reason]);
        }
        
    }
    
    return self;
}

-(NSMutableArray *) selectStatement:(NSString *)query
{
    NSLog(@"Select Query ") ;
    //select statement
    @try{
        NSString *statementAsString = [[NSString alloc] initWithFormat:@"%@",query];
        const char *statement = [statementAsString UTF8String];
        NSMutableArray *rows;
        sqlite3_stmt *compiledStatement;
        if (sqlite3_prepare(_database, statement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            rows = [[NSMutableArray alloc] init];
            NSMutableArray *keys;
            NSMutableArray *objects;
            NSDictionary *row;
            BOOL isNull;
            while (sqlite3_step(compiledStatement) == SQLITE_ROW)
            {
                keys = [[NSMutableArray alloc] init];
                objects = [[NSMutableArray alloc] init];
                int columnCount = sqlite3_column_count(compiledStatement);
                for (int i = 0; i < columnCount; i++)
                {
                    isNull = NO;
                    if (sqlite3_column_type(compiledStatement, i) == SQLITE_TEXT)
                    {
                        NSString *column = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_name(compiledStatement, i)];
                        
                        if ([column isEqualToString:@"created"] || [column isEqualToString:@"timestamp"] || [column isEqualToString:@"modified"]) {
                            
                            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                            [formatter setDateFormat:@"dd/mm/yyyy HH:mm:ss"];
                            
                            NSString *dateAsString = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(compiledStatement, i)];
                            NSDate *date = [formatter dateFromString:dateAsString];
                            
                            [objects addObject:date];
                            
                        }
                        else
                        {
                            NSString *string = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(compiledStatement, i)];
                            [objects addObject:string];
//                            NSLog(@"Object :::: %@", objects) ;
                            
                        }
                        
                        
                    }
                    else if (sqlite3_column_type(compiledStatement, i) == SQLITE_INTEGER)
                    {
                        
                        NSNumber *number = [[NSNumber alloc] initWithInt:sqlite3_column_int(compiledStatement, i)];
                        [objects addObject:number];
                        
                    }
                    else if (sqlite3_column_type(compiledStatement, i) == SQLITE_FLOAT)
                    {
                        
                        NSNumber *number = [[NSNumber alloc] initWithDouble:sqlite3_column_double(compiledStatement, i)];
                        [objects addObject:number];
                        
                        
                    }
                    else if (sqlite3_column_type(compiledStatement, i) == SQLITE_NULL)
                    {
                        
                        isNull = YES;
                        
                    }
                    else
                    {
                        
                        sqlite3_finalize(compiledStatement);
                        
                        return nil;
                    }
                    
                    if (!isNull)
                    {
                        NSString *column = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_name(compiledStatement, i)];
                        [keys addObject:column];
//                        NSLog(@"Keys : %@", keys) ;
                    }
                }
                row = [[NSDictionary alloc] initWithObjects:objects forKeys:keys];
                [rows addObject:row];
            }
            sqlite3_finalize(compiledStatement);
            
        }
        else
        {
            
            
            return nil;
        }
        NSMutableArray *result;
        if ([rows count] == 0)
        {
            result = nil;
        }
        else if ([[rows objectAtIndex:0] count] == 0)
        {
            result = nil;
        }
        else
        {
            NSRange range = NSMakeRange(0, [rows count]);
            result = [[NSMutableArray alloc] initWithArray:[rows subarrayWithRange:range]];
        }
        return result;
    }
    @catch (NSException *exception) {
        NSLog(@"SQLiteManager-selectStatement %@:%@", [exception name], [exception reason]);
    }
    
    
}
-(BOOL)insertStatement:(NSString *)iquery
{
    //insert statement
    @try{
        const char *statement = [iquery UTF8String];
        NSLog(@"Statement : %s", statement) ;
        sqlite3_stmt *compiledStatement;
        BOOL succ;
        if (sqlite3_prepare(_database, statement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            NSLog(@"Entered ======= ") ;
            if (sqlite3_step(compiledStatement)!= SQLITE_DONE)
            {
                NSLog(@"Sq_____ lite Error Msg is %s",sqlite3_errmsg(_database));

                succ=FALSE;
            }else
            {
                NSLog(@"True") ;

                succ=TRUE;
            }
            
        }
        else
        {
            NSLog(@"False") ;
        }
        sqlite3_finalize(compiledStatement);
        if(succ){
            return TRUE;
        }else{
            return FALSE;
        }
        
        
    }
    @catch (NSException *exception) {
        NSLog(@"Exception : %@", exception) ;
    }
    
    
}

- (int) GetArticlesCount : ( NSString *) query
{
    int count = 0;
    
    {
        
        const char* sqlStatement = [ query UTF8String];
        sqlite3_stmt *statement;
        
        if( sqlite3_prepare_v2(_database, sqlStatement, -1, &statement, NULL) == SQLITE_OK )
        {
            //Loop through all the returned rows (should be just one)
            while( sqlite3_step(statement) == SQLITE_ROW )
            {
                count = sqlite3_column_int(statement, 0);
            }
            int primaryKey = (int)sqlite3_last_insert_rowid(_database);
            
            NSLog(@"The Primary key from db = %d",primaryKey);
        }
        else
        {
            //NSLog( @"Failed from sqlite3_prepare_v2. Error is:  %s", sqlite3_errmsg(compiledatabase) );
        }
        
        // Finalize and close database.
        sqlite3_finalize(statement);
    }
    return count ;
}

-(BOOL)deleteStatement:(NSString *)dquery
{
    NSLog(@"Delete Statement") ;
    //delete Statement
    @try{
        NSLog(@"DQuery : %@", dquery) ;
        const char *statement = [dquery UTF8String];
        NSLog(@"Delete Statement : %s", statement) ;

        sqlite3_stmt *compiledStatement;
        BOOL succ;
        if (sqlite3_prepare(_database, statement, -1, &compiledStatement, NULL) == SQLITE_OK)    {
            if (sqlite3_step(compiledStatement) != SQLITE_DONE)
            {
                NSLog(@"False") ;
                succ=FALSE;
            }
            else{
                NSLog(@"True") ;
                succ=TRUE;
            }
            
        }
        else
        {
            NSLog(@"False false") ;
        }
        
        sqlite3_finalize(compiledStatement);
    }
    @catch (NSException *exception) {
    }
    
    
}
-(BOOL)updateStatement:(NSString *)uquery
{
    NSLog(@"Update Statement:") ;
    //update Statement
    @try{
        const char *statement = [uquery UTF8String];
        sqlite3_stmt *compiledStatement;
        BOOL succ;
        if (sqlite3_prepare(_database, statement, -1, &compiledStatement, NULL) == SQLITE_OK)
        {
            if (sqlite3_step(compiledStatement) != SQLITE_DONE)
            {
                
                NSLog(@"uquery: %@", uquery);
                succ=FALSE;
            }else
            {
                NSLog(@"Updated") ;
                succ=TRUE;
            }
            
        }
        else
        {
            
            NSLog(@"FFFFFFF") ;
        }
        sqlite3_finalize(compiledStatement);
        if(succ){
            return TRUE;
        }else{
            return FALSE;
        }
        
    }
    @catch (NSException *exception) {
    }
    
}


@end
