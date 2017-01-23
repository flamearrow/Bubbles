//
//  Bubble.swift
//  Bubbles
//
//  Created by Chen Cen on 1/15/17.
//  Copyright © 2017 Chen Cen. All rights reserved.
//

import Foundation
import UIKit

class Bubble: Hashable {
    var center:CGPoint
    var diameter:CGFloat
    var bezierPath:UIBezierPath
    var fillColor:UIColor
    
    init(center:CGPoint, diameter:CGFloat, color:UIColor) {
        self.center = center
        self.diameter = diameter
        self.fillColor = color
        self.bezierPath = UIBezierPath(ovalIn: CGRect(center: center, diameter:diameter))
    }
    
    public func draw() {
        self.fillColor.setFill()
        self.bezierPath.fill()
    }
    
    public func overLaps(anotherBubble: Bubble) -> Bool {
        let distance = Utils.distance(point1: self.center, point2: anotherBubble.center)
        return distance < (self.diameter/2 + anotherBubble.diameter/2)
    }
    
    public func printBubbleInfo() {
        let left = center.x - diameter
        let right = center.x + diameter
        let top = center.y - diameter
        let bottom = center.y + diameter
        print("center: \(center.x), \(center.y)")
        print("left, \(left)")
        print("right, \(right)")
        print("top, \(top)")
        print("bottom, \(bottom)")
        print("---")        
    }
    
    public func outsideScreen() -> Bool {
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        let left = center.x - diameter
        let right = center.x + diameter
        let top = center.y - diameter
        let bottom = center.y + diameter
//        print("center: \(center.x), \(center.y)")
//        print("left, \(left)")
//        print("right, \(right)")
//        print("top, \(top)")
//        print("bottom, \(bottom)")
//        print("---")

        return left < 0 || right > screenWidth || top < 0 || bottom > screenHeight
    }
    
    var hashValue: Int {
        return self.center.x.hashValue ^ self.center.y.hashValue ^ self.diameter.hashValue ^ self.fillColor.hashValue
    }
    
    static func ==(lhs: Bubble, rhs: Bubble) -> Bool {
        return lhs === rhs || lhs.hashValue == rhs.hashValue
    }
}
