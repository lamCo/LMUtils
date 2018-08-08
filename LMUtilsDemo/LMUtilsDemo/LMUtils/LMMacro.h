//
//  LMMacro.h
//  LMUtilsDemo
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#ifndef LMMacro_h
#define LMMacro_h

#pragma mark - Custom Log
///=============================================================================
/// @name  Custom Log
///=============================================================================
#ifdef DEBUG

//输入 文件 + 函数名 + 代码行数 + 自定义内容
#define LMLog(s, ...) NSLog(@"<%@ (%d)>%s  %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent],__LINE__,__FUNCTION__,[NSString stringWithFormat:(s), ##__VA_ARGS__])

#else

#define LMLog(s, ...)

#endif

// 测试代码执行时间
#define     LMTIME_TRACE_START  CFTimeInterval startTraceTime = CACurrentMediaTime();

#define     LMTIME_TRACE_END     LMLog(@"cost time = %f", CACurrentMediaTime() - startTraceTime);
/////

//控制台打印rect
#define     LMLog_Rect(t,r)           LMLog(@"%@ Rect : %@",t,NSStringFromCGRect(r));

//控制台打印point
#define     LMLog_Point(t,p)          LMLog(@"%@ Point : %@",t,NSStringFromCGPoint(p));

//控制台打印size
#define     LMLog_Size(t,s)           LMLog(@"%@ Size : %@",t,NSStringFromCGSize(s));

//控制台打印当前线程是否主线程
#define     LMLog_MainThread          LMLog(@"Current Thread is %@",[NSThread isMainThread] ? @"Main Thread" : @"child Thread");

//控制台打印当前设备bounds
#define     LMLog_Screen_Bounds      LMLog_Rect(@"📣📣📣MainScreen.bounds", UIScreen.mainScreen.bounds)

//控制台打印当前app本地配置信息
#define     LMLog_Bundle_Info        LMLog(@"📣📣📣MainBundle.info = %@",[[NSBundle mainBundle] infoDictionary])

//控制台打印当前app沙河路径
#define     LMLog_Document_Path       LMLog(@"📣📣📣Document.Path = %@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject])


///=============================================================================
/// @name  DEFINE GETTER
///=============================================================================

// 安全使用String 的getter方法
#ifndef kLM_SAFE_GET_STRING_PROPERTY
#define kLM_SAFE_GET_STRING_PROPERTY(_getter_)\
- (NSString *)_getter_ {\
    if (_##_getter_) {\
        if (![_##_getter_ isKindOfClass:[NSNull class]]) {\
            return _##_getter_;\
        }\
    }\
    return @"";\
}\

#endif


// 安全使用容器的getter方法 适用于懒初始化容器类,
#ifndef kLM_SAFE_GET_OBJ_PROPERTY
#define kLM_SAFE_GET_OBJ_PROPERTY(_getter_,_type_)\
- (_type_ *)_getter_ {\
    if (!_##_getter_) {\
        _##_getter_ = [_type_ new];\
    }\
    return _##_getter_;\
}\

#endif


///=============================================================================
/// @name   RAC WEAK-STRONG-SELF
///=============================================================================
// RAC WEAK-STRONG-SELF
#pragma mark - Weak & Strong Self

#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif


#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

#endif /* LMMacro_h */
