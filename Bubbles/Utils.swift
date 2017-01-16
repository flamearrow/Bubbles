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
        let screenWidth = screenRect.size.width;
        let screenHeight = screenRect.size.height;
        
        // create a random bubble with diameter ranges from 200-400
        return Bubble(center: CGPoint(x:CGFloat.random(max: screenWidth), y:CGFloat.random(max: screenHeight)), diameter:CGFloat.random(max: 200)+200)
    }
    
    static func distance(point1:CGPoint, point2:CGPoint) -> CGFloat {
        let xDist = point1.x - point2.x
        let yDist = point1.y - point2.y
        return sqrt(xDist * xDist + yDist * yDist)
    }

}
