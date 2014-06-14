//
//  MSBCsvDataImporterTest.m
//  ToiletMap
//
//  Created by 伊藤ソフトデザイン on 2014/06/14.
//  Copyright (c) 2014年 misyobun. All rights reserved.
//

#import "MSBCoreDataBasedTest.h"
#import "MSBCsvDataImporter.h"


@interface MSBCsvDataImporterTest : MSBCoreDataBasedTest

@end

@implementation MSBCsvDataImporterTest

- (void)setUp
{
    [super setUp];
    importer = [MSBCsvDataImporter new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    [importer import];
    XCTAssertEqual(1959, [[MSBLocation allObjects] count]);
}

@end
