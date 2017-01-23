//
//  Utils.swift
//  Bubbles
//
//  Created by Chen Cen on 1/15/17.
//  Copyright © 2017 Chen Cen. All rights reserved.
//

import UIKit

class Utils: NSObject {
    
    static func randBubble() -> Bubble {
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        let screenHeight = screenRect.size.height
        
        // create a random bubble with diameter ranges from 100-250
        return Bubble(center: CGPoint(x:CGFloat.random(max: screenWidth), y:CGFloat.random(max: screenHeight)), diameter:CGFloat.random(max: 100)+150, color:randColor())
    }
    
    private static func randColor() -> UIColor {
        let color = UIColor(red: CGFloat.random(max: 255)/255, green: CGFloat.random(max: 255)/255, blue: CGFloat.random(max: 255)/255, alpha: CGFloat.random(max: 255)/510 + 0.5)
        return color
    }
    
    static func distance(point1:CGPoint, point2:CGPoint) -> CGFloat {
        let xDist = point1.x - point2.x
        let yDist = point1.y - point2.y
        return sqrt(xDist * xDist + yDist * yDist)
    }

}
