//
//  ViewController.swift
//  VerificationCode
//
//  Created by x on 2017/12/19.
//  Copyright © 2017年 HLB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(btu);
        
    }


    func btuClick(btu:UIButton) -> Void {
        //swift:
//        btu.sendVerificationCode(time: 60) {
//            print("发送验证码的代码执行在这里");
//        }
        
        btu.sendVerificationCodeMessage(60) { 
            print("oc版发送验证码的代码执行在这里...");
        }
    }
    
    private lazy var btu:UIButton = {
        let btu = UIButton()
        btu.frame = CGRect(x: 50, y: 200, width: 120, height: 30)
        btu.layer.borderWidth = 1
        btu.layer.borderColor = UIColor.orange.cgColor
        btu.layer.cornerRadius = 4;
        btu.setTitle("获取验证码", for: UIControlState.normal);
        btu.setTitleColor(UIColor.black, for: UIControlState.normal)
        btu.addTarget(self, action: #selector(btuClick(btu:)), for: UIControlEvents.touchUpInside)
        
        return btu;
    }()
}

