//
//  MSBLocationTests.m
//  ToiletMap
//
//  Created by 伊藤ソフトデザイン on 2014/06/14.
//  Copyright (c) 2014年 misyobun. All rights reserved.
//

#import "MSBCoreDataBasedTest.h"

@interface MSBLocationTests : MSBCoreDataBasedTest

@end

@implementation MSBLocationTests

- (void)setUp
{
    [super setUp];
    [importer import];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCanGetCLLocation
{
    MSBLocation *location = [[MSBLocation allObjects] lastObject];
    XCTAssertEqual(35.949591, location.clLocation.coordinate.latitude);
    XCTAssertEqual(136.182136, location.clLocation.coordinate.longitude);
}

- (void)testNearestLocationOfNearestLocation
{
    CLLocation *nearLocation = [[CLLocation alloc] initWithLatitude:35.949591 longitude:136.182136];
    XCTAssertNotNil([MSBLocation nearestLocationOf:nearLocation level:5]);
}

- (void)testNearestLocationOfFarLocation
{
    CLLocation *farLocation = [[CLLocation alloc] initWithLatitude:36.949591 longitude:136.182136];
    XCTAssertNil([MSBLocation nearestLocationOf:farLocation level:1]);
}

- (void)testLevelValue1
{
    MSBLocation *location = [MSBLocation create];
    location.sourceName = @"鯖江市トイレマップ";
    XCTAssertEqual(1, location.levelValue);
}

- (void)testLevelValue2
{
    MSBLocation *location = [MSBLocation create];
    location.sourceName = @"鯖江コンビニ情報";
    XCTAssertEqual(2, location.levelValue);
}


@end
