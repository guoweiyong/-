//
//  UIButton+VerificationCode.swift
//  VerificationCode
//
//  Created by x on 2017/12/19.
//  Copyright © 2017年 HLB. All rights reserved.
//

import UIKit

extension UIButton {
    
    /// 发送验证码修改button的标题的方法
    ///
    /// - Parameters:
    ///   - time: 总时间
    ///   - sendVCmessage: 发送验证码的回调
    func sendVerificationCode(time:Int, sendVCmessage:()->()) -> Void {
        
        var count = time
        
        //1.创建一个GCD定时器
        let timer = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags.init(rawValue: 0), queue: DispatchQueue?.init(DispatchQueue.global()))//在异步线程执行
        
        //2.设置定时器时间
        //第一个参数:计时器什么时候开始执行
        //第二个参数:隔多久计时器执行一次
        /*
         case seconds(Int) 秒
         
         case milliseconds(Int) 毫秒 10^3
         
         case microseconds(Int) 微妙 10^6
         
         case nanoseconds(Int) 纳秒 10^9
         */
        timer.scheduleRepeating(deadline: DispatchTime.now(), interval: DispatchTimeInterval.milliseconds(1000))
        
        //3.设置定时器执行事件
        timer.setEventHandler { 
            //3.1判断计数
            count -= 1
            if count <= 0 {
                DispatchQueue.main.async {
                    self.isEnabled = true
                    self.setTitle("获取验证码", for: UIControlState.normal)
                    timer.cancel()//销毁计时器
                }
            }else {
                DispatchQueue.main.async {
                    self.isEnabled = false
                    self.setTitle(String.init(format: "%d", count), for: UIControlState.normal)
                }
            }
        }
        
        //4.启动计时器
        timer.activate()
        
        //5.执行获取验证码代码
        sendVCmessage()
    }
}
