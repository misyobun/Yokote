//
//  MSBDataImporterTests.m
//  ToiletMap
//
//  Created by 伊藤ソフトデザイン on 2014/06/14.
//  Copyright (c) 2014年 misyobun. All rights reserved.
//

#import "MSBCoreDataBasedTest.h"


@interface MSBDataImporterTests : MSBCoreDataBasedTest

@end

@implementation MSBDataImporterTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
}

- (void)testImportData
{
    [importer import];
    XCTAssertEqual(1, [[MSBLocation allObjects] count]);
}


@end
