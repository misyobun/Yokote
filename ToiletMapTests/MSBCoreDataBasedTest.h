//
//  MSBCoreDataBasedTest.h
//  ToiletMap
//
//  Created by 伊藤ソフトデザイン on 2014/06/14.
//  Copyright (c) 2014年 misyobun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MSBAppDelegate.h"
#import "MSBDataImporter.h"
#import "MSBLocation.h"

@interface MSBCoreDataBasedTest : XCTestCase
{
    MSBAppDelegate *appDelegate;
    NSManagedObjectContext *masterContext;
    NSManagedObjectContext *context;
    MSBDataImporter *importer;
}

@end

