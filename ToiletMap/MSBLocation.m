//
//  MSBLocation.m
//  ToiletMap
//
//  Created by 伊藤ソフトデザイン on 2014/06/14.
//  Copyright (c) 2014年 misyobun. All rights reserved.
//

#import "MSBLocation.h"
#import "MSBAppDelegate.h"

@interface MSBLocation()
{
    NSFetchedResultsController *_fetchedResultsController;
}
@end


@implementation MSBLocation

@dynamic latitude;
@dynamic name;
@dynamic longitude;
@dynamic imageURL;
@dynamic address;
@dynamic sourceName;


+ (MSBLocation *)create
{
    NSManagedObjectContext *context = [MSBAppDelegate currentManagedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"MSBLocation" inManagedObjectContext:context];
    return [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
}

+ (NSArray *)allObjects
{
    NSManagedObjectContext *context = [MSBAppDelegate currentManagedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];

    NSEntityDescription *entity = [NSEntityDescription entityForName:@"MSBLocation" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];

    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];

    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context sectionNameKeyPath:nil cacheName:@"MSBLocation.allObjects"];
	NSError *error = nil;
	if (![fetchedResultsController performFetch:&error]) {
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    return fetchedResultsController.fetchedObjects;
}

+ (MSBLocation *)nearestLocationOf:(CLLocation *)locationFrom level:(NSInteger)level
{
    MSBLocation *nearestLocation = nil;
    CLLocationDistance nearestDistance = MAXFLOAT;
    for (MSBLocation *location in [self allObjects]) {
        CLLocationDistance distance = [location.clLocation distanceFromLocation:locationFrom];
        if (distance < nearestDistance) {
            nearestDistance = distance;
            nearestLocation = location;
        }
    }
    if (nearestDistance > NEAR_DISTANCE) {
        nearestLocation = nil;
    }
    return nearestLocation;
}

- (CLLocation *)clLocation
{
    return [[CLLocation alloc] initWithLatitude:[self.latitude doubleValue] longitude:[self.longitude doubleValue]];
}



@end
