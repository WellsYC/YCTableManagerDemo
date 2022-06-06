//
//  YCTaskDispatcher.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/29.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import "YCTaskDispatcher.h"

@implementation YCTask
- (instancetype)initWithTaskIdentifier:(NSString *)taskID  taskBlock:(RunLoopTask)taskBlock isCancel:(CheckIsCancel)isCancel{
    if (self = [super init]) {
        _taskBlock = taskBlock;
        _isCancel = isCancel;
        _taskID = taskID;
    }
    return self;
}
- (void)exccute{
    self.taskBlock();
}

@end

@interface YCTaskDispatcher()
@property(nonatomic,assign)YCTaskExecuteMode       executeMode;
@property(nonatomic,assign)YCTaskExecuteState      executeState;

@property(nonatomic,strong)NSMutableDictionary          *tasks;
@property(nonatomic,strong)NSMutableArray               *taskKeys;
@property(nonatomic,assign)CFRunLoopObserverRef         observer;
@end

@implementation YCTaskDispatcher

+ (instancetype)commomDispatcher{
    return [[self alloc] initWithExecuteMode:YCTaskExecuteModeCommom];
}
+ (instancetype)defaultDispatcher{
    return [[self alloc] initWithExecuteMode:YCTaskExecuteModeDefault];
}
- (instancetype)initWithExecuteMode:(YCTaskExecuteMode)executeMode{
    if (self = [super init]) {
        _executeMode = executeMode;
        _maximunQueueLenght = 30;
    }
    return self;
}
- (instancetype)init{
    if (self = [super init]) {
        _executeMode = YCTaskExecuteModeCommom;
        _maximunQueueLenght = 30;
    }
    return self;
}

#pragma mark -
- (void)addTaskIdentifier:(NSString *)taskID taskBlock:(RunLoopTask)taskBlock isCancel:(CheckIsCancel)isCancel{
    YCTask *task = [[YCTask alloc] initWithTaskIdentifier:taskID taskBlock:taskBlock isCancel:isCancel];
    [self addTask:task];
}
- (void)addTaskIdentifier:(NSString *)taskID taskBlock:(RunLoopTask)taskBlock{
    YCTask *task = [[YCTask alloc] initWithTaskIdentifier:taskID taskBlock:taskBlock isCancel:nil];
    [self addTask:task];
}
- (void)addTask:(YCTask *)task{
    if (task.taskID == nil) return;
    
    [self.tasks setValue:task forKey:task.taskID];
    [self.taskKeys addObject:task.taskID];
    if (self.executeState == YCTaskExecuteStateSuspend) {
        [self start];
    }
}

- (void)cancelTask:(NSString *)taskID{
    if (taskID == nil) return;
    if (self.tasks[taskID] == nil) return;
    // delete
    [self _removeTask:taskID];
}

- (void)_executeTask{
    NSString *taskID = self.taskKeys.firstObject;
    // empty
    if (taskID == nil) return;
    
    YCTask *task = self.tasks[taskID];
    if (task.isCancel) {
        if (task.isCancel()){
            [self.tasks removeObjectForKey:taskID];
            [self.taskKeys removeObject:taskID];
            if (self.tasks.count == 0&&self.executeState == YCTaskExecuteStateRunning) {
                [self invaliate];
            }else{
                [self _executeTask];
            }
        }
    }
    
    [task exccute];
    [self _removeTask:taskID];
}

- (void)_removeTask:(NSString *)taskID{
    if (taskID == nil) return;
    [self.tasks removeObjectForKey:taskID];
    [self.taskKeys removeObject:taskID];
    
    if (self.tasks.count == 0&&self.executeState == YCTaskExecuteStateRunning) {
        [self invaliate];
    }
}

#pragma mark -
- (void)start{
    CFRunLoopRef  mainRunLoop = CFRunLoopGetMain();
    CFOptionFlags activities = kCFRunLoopBeforeWaiting|kCFRunLoopExit;
    self.observer = CFRunLoopObserverCreateWithHandler(NULL, activities, YES, NSIntegerMax - 999, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        [self _executeTask];
    });
    CFRunLoopMode mode = (self.executeMode == YCTaskExecuteModeDefault)?kCFRunLoopCommonModes:kCFRunLoopDefaultMode;
    CFRunLoopAddObserver(mainRunLoop, self.observer, mode);
    self.executeState = YCTaskExecuteStateRunning;
}
- (void)reset{
    [self.tasks removeAllObjects];
    [self.taskKeys removeAllObjects];
    if (self.executeState == YCTaskExecuteStateRunning) {
        [self invaliate];
    }
}
- (void)invaliate{
    CFRunLoopMode mode = (self.executeMode == YCTaskExecuteModeDefault)?kCFRunLoopCommonModes:kCFRunLoopDefaultMode;
    CFRunLoopRemoveObserver(CFRunLoopGetMain(), self.observer, mode);
    self.executeState = YCTaskExecuteStateSuspend;
}

- (void)dealloc{
    CFRelease(self.observer);
}

#pragma mark -
- (NSMutableDictionary *)tasks{
    if (!_tasks) {
        _tasks = [NSMutableDictionary dictionary];
    }
    return _tasks;
}
- (NSMutableArray *)taskKeys{
    if (!_taskKeys) {
        _taskKeys = [NSMutableArray array];
    }
    return _taskKeys;
}
@end
