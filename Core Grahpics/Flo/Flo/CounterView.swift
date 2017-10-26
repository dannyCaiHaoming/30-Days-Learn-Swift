//
//  CounterView.swift
//  Flo
//
//  Created by 蔡浩铭 on 2017/10/26.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit

@IBDesignable class CounterView: UIView {


    private struct Constants {
        static let numberOfClasses = 8
        static let lineWidth: CGFloat = 5.0
        static let arcWidth: CGFloat = 70
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
    
    let pi:CGFloat = CGFloat(M_PI)
    
    
    
    @IBInspectable var counter: Int = 5
    @IBInspectable var outLineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.green
    
    

    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let center: CGPoint = CGPoint.init(x: bounds.width / 2, y: bounds.height / 2)
        
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        let startAngle: CGFloat = 3 / 4 * pi
        let endAngle :CGFloat = pi / 4
        //圆环的半径= 圆环外圈半径 - 圆环宽度 / 2
        let path = UIBezierPath.init(arcCenter: center, radius: radius / 2 - Constants.arcWidth / 2 , startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        if counter <= 0  {
            return
        }
        if counter > 8 {
            counter = 8
        }
        
        let angleDifference: CGFloat = 2 * pi - startAngle + endAngle
        let arcLengthPerGlass :CGFloat = angleDifference / CGFloat(Constants.numberOfClasses)
        
        let outLineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        
        let outlinePath = UIBezierPath.init(arcCenter: center, radius: radius / 2 - Constants.halfOfLineWidth, startAngle: startAngle, endAngle: outLineEndAngle, clockwise: true)
        
        outlinePath.addArc(withCenter: center, radius: radius / 2 - Constants.arcWidth + Constants.halfOfLineWidth, startAngle: outLineEndAngle, endAngle: startAngle, clockwise: false)
        
        outlinePath.close()
        
        outLineColor.setStroke()
        
        outlinePath.lineWidth = Constants.lineWidth
        outlinePath.stroke()
        
        
    }


}
