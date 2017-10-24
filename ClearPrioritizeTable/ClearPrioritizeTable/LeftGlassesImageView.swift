//
//  LeftGlassesImageView.swift
//  ClearPrioritizeTable
//
//  Created by 蔡浩铭 on 2017/10/24.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit


class LeftGlassesImageView: UIImageView {
    let gradientLayer: CAGradientLayer = {
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.startPoint = CGPoint.init(x: 0.0, y: 0.4)
        gradientLayer.endPoint   = CGPoint.init(x: 1.0, y: 0.6)
        
        

        let colors = [
            UIColor.clear.cgColor,
            UIColor.white.cgColor,
            UIColor.white.cgColor,
            UIColor.clear.cgColor
        ]
        
        gradientLayer.colors = colors
        
        //Color locations的设置：
        /*
         以X，Y，Z三种颜色为例，location的值范围可以在[0,1]之间,超出了就看不到，并不是无效
         如果设置[0.1,0.2,0.3],那么
         在0.1，0.2，0.3处的颜色分别是X,Y,Z
         至于0-0.1是X，0.3-1是Z
         0.1-0.2是X->Y渐变的颜色
         0.2-0.3是Y->Z渐变的颜色
         */
        
        let locations: [NSNumber] = [0.2,0.21,0.29,0.3]
        gradientLayer.locations = locations
        
        return gradientLayer
        
    }()
    
    override func layoutSubviews() {
        layer.borderColor = UIColor.green.cgColor
        gradientLayer.frame = CGRect(
            x: -100,
            y: 0,
            width: bounds.size.width ,
            height: bounds.size.height)
        
        layer.addSublayer(gradientLayer)
        layer.masksToBounds = true
        
    }
    
    
    override func didMoveToWindow() {
        super.didMoveToWindow()
        
        let gradientAnimation = CABasicAnimation.init(keyPath: "locations")
        
        gradientAnimation.fromValue = [0.2,0.21,0.29,0.3]
        gradientAnimation.toValue = [0.9,0.91,0.99,1.0]
        gradientAnimation.duration = 1.0
        gradientAnimation.repeatCount = 20
        
        gradientLayer.add(gradientAnimation, forKey: nil)
    }
}
