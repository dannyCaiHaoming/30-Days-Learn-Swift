//
//  PushButtonView.swift
//  Flo
//
//  Created by 蔡浩铭 on 2017/10/26.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit



@IBDesignable class PushButtonView: UIButton {
    
    
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true
    
    private struct Constants{
        static let plusLineWidth: CGFloat = 3.0
        static let plusButtonScale: CGFloat = 0.6
        static let halfPointShift: CGFloat = 0.0
    }
    
    private var halfWidth: CGFloat{
        return bounds.width / 2
    }
    
    private var halfHeight: CGFloat{
        return bounds.height / 2
    }
    
    
    
  
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let path = UIBezierPath.init(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = Constants.plusLineWidth
        
        plusPath.move(to: CGPoint.init(
            x: halfWidth - halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        
        plusPath.addLine(to: CGPoint.init(
            x: halfWidth + halfPlusWidth + Constants.halfPointShift,
            y: halfHeight + Constants.halfPointShift))
        
        
        
        if isAddButton {
            plusPath.move(to: CGPoint.init(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight - halfPlusWidth + Constants.halfPointShift))
            plusPath.addLine(to: CGPoint.init(
                x: halfWidth + Constants.halfPointShift,
                y: halfHeight + halfPlusWidth + Constants.halfPointShift))

        }
        

        
        UIColor.white.setStroke()
        plusPath.stroke()
    }


}
