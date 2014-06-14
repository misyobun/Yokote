//
//  MSBAppDelegate.h
//  ToiletMap
//
//  Created by 高橋直人 on 2014/06/14.
//  Copyright (c) 2014年 misyobun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
