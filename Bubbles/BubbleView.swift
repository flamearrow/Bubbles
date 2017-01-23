//  Created by Chen Cen on 1/15/17.
//  Copyright © 2017 Chen Cen. All rights reserved.
//

import UIKit

class BubbleView: UIView {
    
    static let MAX_BUBBLES:Int = 5

    private struct FoundBubbleStates {
        static let FOUND = 0
        static let NOT_FOUNND = 1
    }
    
    private struct Constants {
        static let GAVE_UP_LIMIT = 10
    }
    
    private var bubbles = Set<Bubble>() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // fill up the screen with 5 bubbles
    public func clearAndRillBubbles() {
        self.clearBubbles()
        for _ in 0 ..< BubbleView.MAX_BUBBLES {
            addBubble(CGPoint(x: 1, y: 2), force: true)
        }
    }
    
    override func draw(_ rect: CGRect) {
        for bubble in bubbles {
            bubble.draw()
        }
    }
    
    func maybeAddBubble(center:CGPoint) {
        if let b = findBubble(center) as Bubble! {
            bubbles.remove(b)
        } else {
            addBubble(center, force: false)
        }
    }
    
    func clearBubbles() {
        bubbles.removeAll()
    }
    
    func maybePopBubble(center:CGPoint) {
        if let b = findBubble(center) as Bubble! {
            bubbles.remove(b)
        }
    }
    
    private func addBubble(_ center:CGPoint, force:Bool) {
        var newBubble = Utils.randBubble()
        var count = 0
        while invalid(newBubble) {
            count += 1
            if !force && count > Constants.GAVE_UP_LIMIT {
                return
            }
            newBubble = Utils.randBubble()
        }
        
        bubbles.insert(newBubble)
    }
    
    // new bubble should not overlap with other bubble
    // entire bubble should be inside screen
    private func invalid(_ newBubble:Bubble) -> Bool {
        if newBubble.outsideScreen() {
            return true
        }
        for bubble in bubbles {
            if newBubble.overLaps(anotherBubble: bubble) {
                return true
            }
        }
        return false
    }

    // Would return nil or a bubble
    func findBubble(_ point:CGPoint) -> Bubble? {
        for bubble in bubbles {
            if bubble.bezierPath.contains(point) {
                return bubble
            }
        }
        return nil
    }

}
