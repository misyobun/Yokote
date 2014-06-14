//
//  MSBDataImporter.m
//  ToiletMap
//
//  Created by 伊藤ソフトデザイン on 2014/06/14.
//  Copyright (c) 2014年 misyobun. All rights reserved.
//

#import "MSBDataImporter.h"
#import "MSBAppDelegate.h"
#import "MSBLocation.h"


@implementation MSBDataImporter

static MSBDataImporter *sharedDataImporter = nil;

+ (MSBDataImporter *)sharedDataImporter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDataImporter = [self new];
    });
    return sharedDataImporter;
}

// http://www3.city.sabae.fukui.jp/xml/toilet/001,Nishiyama Park (Central Square）,西山公園(中央広場),6,5,,1,1,,,,,35.949591,136.182136,http://www3.city.sabae.fukui.jp/xml/toilet/0101.jpg,http://www3.city.sabae.fukui.jp/xml/toilet/0102.jpg,http://www3.city.sabae.fukui.jp/xml/toilet/0103.jpg,http://www3.city.sabae.fukui.jp/xml/toilet/0104.jpg


- (void)import
{
    NSManagedObjectContext *context = [MSBAppDelegate currentManagedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"MSBLocation" inManagedObjectContext:context];
    MSBLocation *location = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    location.name = @"西山公園(中央広場)";
    location.latitude = @35.949591;
    location.longitude = @136.182136;

    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

@end
