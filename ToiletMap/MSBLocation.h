//
//  MSBLocation.h
//  ToiletMap
//
//  Created by 伊藤ソフトデザイン on 2014/06/14.
//  Copyright (c) 2014年 misyobun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MSBLocation : NSManagedObject

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * imageURL;

+ (NSArray *)allObjects;

+ (MSBLocation *)nearestLocationOf:(CLLocation *)locationFrom level:(NSInteger)level;

@end
