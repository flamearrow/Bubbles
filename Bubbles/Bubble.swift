//
//  Bubble.swift
//  Bubbles
//
//  Created by Chen Cen on 1/15/17.
//  Copyright © 2017 Chen Cen. All rights reserved.
//

import Foundation
import UIKit

class Bubble {
    var center:CGPoint
    var diameter:CGFloat
    var bezierPath:UIBezierPath
    
    init(center:CGPoint, diameter:CGFloat) {
        self.center = center
        self.diameter = diameter
        self.bezierPath = UIBezierPath(ovalIn: CGRect(center: center, diameter:diameter))
    }
    
    public func overLaps(anotherBubble: Bubble) -> Bool {
        let distance = Utils.distance(point1: self.center, point2: anotherBubble.center)
        return distance < (self.diameter/2 + anotherBubble.diameter/2)
    }
}
