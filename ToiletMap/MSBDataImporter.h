//
//  MSBDataImporter.h
//  ToiletMap
//
//  Created by 伊藤ソフトデザイン on 2014/06/14.
//  Copyright (c) 2014年 misyobun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSBDataImporter : NSObject

+ (MSBDataImporter *)sharedDataImporter;

- (void)import;

@end
