//
//  MSBDataImporterTests.m
//  ToiletMap
//
//  Created by 伊藤ソフトデザイン on 2014/06/14.
//  Copyright (c) 2014年 misyobun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MSBAppDelegate.h"
#import "MSBDataImporter.h"
#import "MSBLocation.h"


@interface MSBDataImporterTests : XCTestCase
{
    MSBAppDelegate *appDelegate;
    NSManagedObjectContext *masterContext;
    NSManagedObjectContext *context;
    MSBDataImporter *importer;
}

@end

@implementation MSBDataImporterTests

- (void)setUp
{
    [super setUp];

    appDelegate = [[UIApplication sharedApplication] delegate];
    masterContext = appDelegate.managedObjectContext;
    context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    context.parentContext = masterContext;
    [MSBAppDelegate setCurrentManagedObjectContext:context];
    importer = [MSBDataImporter sharedDataImporter];
}

- (void)tearDown
{
    [context rollback];
    context = nil;
    [MSBAppDelegate setCurrentManagedObjectContext:nil];
    [masterContext rollback];
    [super tearDown];
}

- (void)testImportData
{
    [importer import];
    XCTAssertEqual(1, [[MSBLocation allObjects] count]);
}



@end
