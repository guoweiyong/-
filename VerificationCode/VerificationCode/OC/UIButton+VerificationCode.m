//
//  UIButton+VerificationCode.m
//  VerificationCode
//
//  Created by x on 2017/12/19.
//  Copyright © 2017年 HLB. All rights reserved.
//

#import "UIButton+VerificationCode.h"

@implementation UIButton (VerificationCode)

- (void)sendVerificationCodeMessage:(int)time getVerificationCode:(finish)callBack {
    
    __block int count = time;
    
    //1.创建一个计时器
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //创建定时器对象
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    //设置定时器的时间
    //第一个参数: 定时器什么时候开始
    //第二个参数:定时器几秒执行一次
    //第三个参数:定时器出发允许的延迟值
    /*
     开始时间可以设置
     第一个参数:什么时间开始
     第二个参数: 延迟时间多少
     */
    
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC);//NSEC_PER_SEC 单位是纳米
    dispatch_source_set_timer(timer, start, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        count -= 1;
        if (count <= 0) {
            self.enabled = YES;
            dispatch_async(dispatch_get_main_queue(), ^{
                //取消定时器
                dispatch_cancel(timer);
                [self setTitle:@"获取验证码" forState:UIControlStateNormal];
            });
        }else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:@"%d",count] forState:UIControlStateNormal];
                self.enabled = NO;
            });
        }
    });
    dispatch_resume(timer);
    
    //验证码
    if (callBack) {
        callBack();
    }
}
@end
