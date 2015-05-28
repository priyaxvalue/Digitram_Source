
#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface DBSqlite : NSObject
{
    sqlite3 *_database;
}
+(DBSqlite *)dbManager;
-(NSString *) sqlliteapppath;
-(NSString *) doccumentspath;
-(void)copysqllitetodocuments;
-(NSMutableArray *) selectStatement:(NSString *)query;
-(BOOL)insertStatement:(NSString *)iquery;
-(BOOL)deleteStatement:(NSString *)dquery;
-(BOOL)updateStatement:(NSString *)uquery;
- (int) GetArticlesCount : ( NSString *) query ;
@end
