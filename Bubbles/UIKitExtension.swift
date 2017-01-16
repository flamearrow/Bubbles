//
//  UIKitExtension.swift
//  Bubbles
//
//  Created by Chen Cen on 1/15/17.
//  Copyright © 2017 Chen Cen. All rights reserved.
//

import UIKit

extension CGRect {
    init(center:CGPoint, diameter:CGFloat) {
        let origin = CGPoint(x:center.x - diameter / 2, y:center.y - diameter / 2)
        self.init(origin: origin, size: CGSize(width: diameter, height: diameter))
    }
}

extension CGFloat {
    static func random(max:Int) -> CGFloat {
        return CGFloat(arc4random() % UInt32(max))
    }
    
    static func random(max:CGFloat) -> CGFloat {
        return CGFloat(arc4random() % UInt32(max))
    }
}
