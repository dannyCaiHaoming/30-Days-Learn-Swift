//
//  GraphView.swift
//  Flo
//
//  Created by 蔡浩铭 on 2017/10/26.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit
import QuartzCore
import CoreGraphics

@IBDesignable class GraphView: UIView {

    
    private struct Constants {
        static let cornerRadiusSize = CGSize(width: 8.0, height: 8.0)
        static let margin: CGFloat = 20.0
        static let topBorder: CGFloat = 60
        static let bottomBorder: CGFloat = 50
        static let colorAlpha: CGFloat = 0.3
        static let circleDiameter: CGFloat = 5.0
    }
    
    @IBInspectable var startColor: UIColor = UIColor.red
    @IBInspectable var endColor: UIColor = UIColor.green
    
    

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath.init(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: Constants.cornerRadiusSize)
        path.addClip()
        
        // 2
        let context = UIGraphicsGetCurrentContext()!
        let colors = [startColor.cgColor, endColor.cgColor]
        
        // 3
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        // 4
        let colorLocations: [CGFloat] = [0.0, 1.0]
        
        // 5
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)!
        // 6
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: bounds.height)
        context.drawLinearGradient(gradient,
                                   start: startPoint,
                                   end: endPoint,
                                   options: [])
        
        let graphPoints = [4,2,6,4,5,8,3]
        let width = rect.width
        let heigh = rect.height
        //calculate the x point
        let margin = Constants.margin
        let graphWidth = width - margin * 2 - 4
        let columnXPoint = { (column:Int) -> CGFloat in
            let spacing = graphWidth / CGFloat(graphPoints.count - 1)
            return CGFloat(column) * spacing + margin + 2
        }
        //calculate the y point
        let topBorder = Constants.topBorder
        let bottomBorder = Constants.bottomBorder
        let graphHeight = rect.height - topBorder - bottomBorder
        let maxValue = graphPoints.max()!
        let columnYPoint = { (graphPoint:Int) -> CGFloat in
            let y = CGFloat(graphPoint) / CGFloat(maxValue) * graphHeight
            return graphHeight + topBorder - y
        }
        
        UIColor.white.setFill()
        UIColor.white.setStroke()
        
        let graphPath = UIBezierPath()
        
        graphPath.move(to: CGPoint.init(x: columnXPoint(0), y: columnYPoint(graphPoints[0])))
        for i in 1..<graphPoints.count {
            let nextPoint = CGPoint.init(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
            graphPath.addLine(to: nextPoint)
        }
        graphPath.stroke()
        
        
        context.saveGState()
        
        let clippingPath = graphPath.copy() as! UIBezierPath
        
        clippingPath.addLine(to: CGPoint.init(x: columnXPoint(graphPoints.count - 1), y: heigh))
        clippingPath.addLine(to: CGPoint.init(x: columnXPoint(0), y: heigh))
        
        clippingPath.close()
        
        clippingPath.addClip()
        
//        UIColor.green.setFill()
        
        
        
        let rectPath = UIBezierPath.init(rect: rect)
        
        rectPath.fill()
        
        let highestYPoint = columnYPoint(maxValue)
        let graphStartPoint = CGPoint.init(x: margin, y: highestYPoint)
        let graphEndPoint = CGPoint.init(x: margin, y: heigh)
        
        context.drawLinearGradient(gradient, start: graphStartPoint, end: graphEndPoint, options: [])
        
        context.restoreGState()
        
        
        for i in 0..<graphPoints.count {
            var point = CGPoint.init(x: columnXPoint(i), y: columnYPoint(graphPoints[i]))
            point.x -= Constants.circleDiameter / 2
            point.y -= Constants.circleDiameter / 2
            
            let circle = UIBezierPath.init(ovalIn: CGRect.init(origin: point, size: CGSize.init(width: Constants.circleDiameter, height: Constants.circleDiameter)))
            circle.fill()
        }
        
        
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint.init(x: margin, y: graphHeight + topBorder))
        linePath.addLine(to: CGPoint.init(x: graphWidth + margin, y: graphHeight + topBorder))
        
        linePath.move(to: CGPoint.init(x: margin, y: graphHeight / 2 + topBorder))
        linePath.addLine(to: CGPoint.init(x: graphWidth + margin, y: graphHeight / 2 + topBorder))
        
        linePath.move(to: CGPoint.init(x: margin, y: topBorder))
        linePath.addLine(to: CGPoint.init(x: graphWidth + margin, y: topBorder))
        linePath.lineWidth = 1.0
        linePath.stroke()
        
        

    }
    


}
