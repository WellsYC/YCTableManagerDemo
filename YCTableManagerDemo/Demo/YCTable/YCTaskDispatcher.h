//
//  YCTaskDispatcher.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/29.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,YCTaskExecuteMode) {
    YCTaskExecuteModeDefault,
    YCTaskExecuteModeCommom,
};

typedef NS_ENUM(NSUInteger,YCTaskExecuteState) {
    YCTaskExecuteStateRunning,
    YCTaskExecuteStateSuspend,
};

typedef void(^RunLoopTask)(void);
typedef BOOL(^CheckIsCancel)(void);

@interface YCTask : NSObject
@property(nonatomic,copy)RunLoopTask        taskBlock;
@property(nonatomic,copy)CheckIsCancel      isCancel;
@property(nonatomic,copy)NSString           *taskID;

- (instancetype)initWithTaskIdentifier:(NSString *)taskID  taskBlock:(RunLoopTask)taskBlock isCancel:(CheckIsCancel)isCancel;
- (void)exccute;

@end

@interface YCTaskDispatcher : NSObject

@property(nonatomic,assign)NSInteger              maximunQueueLenght;

+ (instancetype)commomDispatcher;
+ (instancetype)defaultDispatcher;
- (instancetype)initWithExecuteMode:(YCTaskExecuteMode)executeMode;

- (void)addTaskIdentifier:(NSString *)taskID taskBlock:(RunLoopTask)taskBlock;
- (void)addTask:(YCTask *)task;
- (void)cancelTask:(NSString *)taskID;
@end
