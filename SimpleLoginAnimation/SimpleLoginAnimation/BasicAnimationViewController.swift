//
//  BasicAnimationViewController.swift
//  SimpleLoginAnimation
//
//  Created by 蔡浩铭 on 2017/10/25.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import Foundation
import UIKit
import CoreFoundation
import QuartzCore


class BasicAnimationViewController: UIViewController,CAAnimationDelegate {
    
    var animationView :UIView? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100))
        animationView?.backgroundColor = UIColor.blue
        self.view.addSubview(animationView!)
        
        
        let tapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(self.tapGestureRecognizerAction(sender:)))
        animationView?.addGestureRecognizer(tapGestureRecognizer)

        self.automaticallyAdjustsScrollViewInsets = false
        
    }
    
    func tapGestureRecognizerAction(sender:UITapGestureRecognizer){
        let animation = CABasicAnimation.init(keyPath: "position")
        animation.byValue = CGPoint.init(x: 100, y: 0)
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        let newPoint = CGPoint.init(x: (animationView?.frame.origin.x)! + 100, y: (animationView?.frame.origin.y)!)
        animation.setValue(newPoint, forKey:"endPoint")
        animation.setValue(animationView, forKey: "sender")
        animation.delegate = self
        animationView?.layer.add(animation, forKey: "basicAnimation")
    }
    
    //view并没有移动，移动的是view的layer
    //动作相应区域还是原来的，但是显示颜色块的区域移动了，layer在view上移动了100
    //如果想移动view去到layer原来的位置，必须对view和layer同时移动
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        let endPoint = anim.value(forKey: "endPoint") as! CGPoint
//        let theView = anim.value(forKey: "sender") as! UIView
//        theView.layer.position = endPoint
        print(NSStringFromCGRect((animationView?.frame)!))
        print(NSStringFromCGRect((animationView?.layer.frame)!))
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
