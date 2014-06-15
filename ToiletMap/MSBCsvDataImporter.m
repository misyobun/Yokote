//
//  MSBCsvDataImporter.m
//  ToiletMap
//
//  Created by 伊藤ソフトデザイン on 2014/06/14.
//  Copyright (c) 2014年 misyobun. All rights reserved.
//

#import "MSBCsvDataImporter.h"
#import "MSBLocation.h"
#import "MSBAppDelegate.h"


@interface NSString(CSV)
@end

@implementation NSString(CSV)

- (NSString *)removeDoubleQuate
{
    return [self stringByReplacingOccurrencesOfString:@"\"" withString:@""];
}

@end


@implementation MSBCsvDataImporter

- (void)import
{
    NSString *filename = [[NSBundle mainBundle] pathForResource:@"DataSource" ofType:@"csv"];
    NSString *fileContext = [NSString stringWithContentsOfFile:filename encoding:NSShiftJISStringEncoding error:NULL];
    int lineNo = 0;
    NSArray *attributes;
    for (NSString *line in [fileContext componentsSeparatedByString:@"\n"]) {
        if (lineNo == 0) {
            attributes = [line componentsSeparatedByString:@","];
        } else {
            NSArray *data = [line componentsSeparatedByString:@","];
            MSBLocation *location = [MSBLocation create];
            int index = 0;
            for (NSString *attribute in attributes) {
                NSString *attribute2 = [attribute removeDoubleQuate];
                NSString *value = [[data objectAtIndex:index] removeDoubleQuate];
                
                NSArray *attributesNames = @[@"name（拠点名）", @"address（住所）", @"Latitude（緯度）", @"Longitude（経度）", @"OpenData（利用しているオープンデータ）"];
                switch ([attributesNames indexOfObject:attribute2]) {
                case 0:
                    location.name = value;
                    break;
                case 1:
                    location.address = value;
                    break;
                case 2:
                    location.latitude = [NSNumber numberWithDouble:[value doubleValue]];
                    break;
                case 3:
                    location.longitude = [NSNumber numberWithDouble:[value doubleValue]];
                    break;
                case 4:
                    location.sourceName = value;
                    break;
                }
                index++;
            }
            if (location.sourceName == nil) {
                NSLog(@"%@", line);
                NSLog(@"%@", location);
            }
        }
        lineNo++;
    }
    NSManagedObjectContext *context = [MSBAppDelegate currentManagedObjectContext];
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

@end

