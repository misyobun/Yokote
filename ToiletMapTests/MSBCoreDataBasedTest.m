//
//  MSBCoreDataBasedTest.m
//  ToiletMap
//
//  Created by 伊藤ソフトデザイン on 2014/06/14.
//  Copyright (c) 2014年 misyobun. All rights reserved.
//

#import "MSBCoreDataBasedTest.h"

@implementation MSBCoreDataBasedTest

- (void)setUp
{
    [super setUp];

    appDelegate = [[UIApplication sharedApplication] delegate];
    masterContext = appDelegate.managedObjectContext;
    context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    context.parentContext = masterContext;
    [MSBAppDelegate setCurrentManagedObjectContext:context];
    importer = [MSBDataImporter new];
}

- (void)tearDown
{
    [context rollback];
    context = nil;
    [MSBAppDelegate setCurrentManagedObjectContext:nil];
    [masterContext rollback];
    [super tearDown];
}


@end
