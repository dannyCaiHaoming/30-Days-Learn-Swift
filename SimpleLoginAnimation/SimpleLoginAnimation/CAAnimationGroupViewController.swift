//
//  CAAnimationGroupViewController.swift
//  SimpleLoginAnimation
//
//  Created by 蔡浩铭 on 2017/10/25.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit
import QuartzCore

class CAAnimationGroupViewController: UIViewController {

    
    var animationView :UIView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animationView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        animationView?.backgroundColor = UIColor.black
        self.view.addSubview(animationView!)
        
        
        //x d动画
        let xAnimation = CABasicAnimation.init(keyPath: "position")
        xAnimation.byValue = CGPoint.init(x: 100, y: 0)
        
        //y 动画
        let yAnimation = CABasicAnimation.init(keyPath: "position")
        yAnimation.byValue = CGPoint.init(x: 0, y: 100)
        
        let sAnimation = CABasicAnimation.init(keyPath: "transform.scale")
        sAnimation.fromValue = 0.5
        sAnimation.toValue = 1.0
        
        let xScaleAnimation = CABasicAnimation.init(keyPath: "transform.rotation.x")
        xScaleAnimation.byValue = M_PI * 3
        xScaleAnimation.duration = 2.0
        
        let yScaleAnimation = CABasicAnimation.init(keyPath: "transform.rotation.y")
        yScaleAnimation.byValue = M_PI * 2.5
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.duration = 4.0
        groupAnimation.repeatCount = 2
        groupAnimation.animations = [xAnimation,yAnimation,sAnimation,xScaleAnimation,yScaleAnimation]
        
        animationView?.layer.add(groupAnimation, forKey: "animationGroup")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
