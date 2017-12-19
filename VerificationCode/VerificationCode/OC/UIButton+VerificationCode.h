//
//  UIButton+VerificationCode.h
//  VerificationCode
//
//  Created by x on 2017/12/19.
//  Copyright © 2017年 HLB. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^finish)();
@interface UIButton (VerificationCode)

/**
 获取验证码

 @param time <#time description#>
 @param callBack <#callBack description#>
 */
- (void)sendVerificationCodeMessage:(int)time getVerificationCode:(finish)callBack;

@end
