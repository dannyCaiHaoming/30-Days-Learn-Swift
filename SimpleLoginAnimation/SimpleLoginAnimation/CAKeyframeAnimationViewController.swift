//
//  CAKeyframeAnimationViewController.swift
//  SimpleLoginAnimation
//
//  Created by 蔡浩铭 on 2017/10/25.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit
import QuartzCore
import coreg

class CAKeyframeAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let animationView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        animationView.backgroundColor = UIColor.green
        self.view.addSubview(animationView)
        
        let keyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")
        
        //线段的位置移动
//        keyframeAnimation.values = [    CGPoint.init(x: 10, y: 100),
//                                        CGPoint.init(x: 30, y: 100),
//                                        CGPoint.init(x: 60, y: 120),
//                                        CGPoint.init(x: 60, y: 100),
//                                        CGPoint.init(x: 106, y: 210),
//                                        CGPoint.init(x: 106, y: 410),
//                                        CGPoint.init(x: 300, y: 310)
//                                   ]
//        //弧线位置移动
//        let path = CGPathCreateMutable()
//        CGPathMoveToPoint(path, nil, 50, 50)
//        CGPathAddCurveToPoint(path, nil, 50, 50, 700, 300, 30, 500)
//        keyframeAnimation.path = path
        
        keyframeAnimation.duration = 5
        animationView.layer.add(keyframeAnimation, forKey: "keyframeAnimation")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
