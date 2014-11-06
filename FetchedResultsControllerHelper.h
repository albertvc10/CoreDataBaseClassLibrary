#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>

@interface FetchedResultsControllerHelper : NSObject <NSFetchedResultsControllerDelegate>

- (instancetype)initWithTableView:(UITableView *)tableView andBlockToUpdateCells:(void(^)(NSIndexPath *indexPath))block;

@end
