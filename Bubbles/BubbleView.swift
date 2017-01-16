//  Created by Chen Cen on 1/15/17.
//  Copyright © 2017 Chen Cen. All rights reserved.
//

import UIKit

class BubbleView: UIView {
    private struct FoundBubbleStates {
        static let FOUND = 0
        static let NOT_FOUNND = 1
    }
    
    private struct Constants {
        static let GAVE_UP_LIMIT = 10
    }
    
    private var bubbles = [Bubble]() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        for bubble in bubbles {
            bubble.bezierPath.stroke()
        }
    }
    
    func maybeAddBubble(center:CGPoint) {
        if findBubble(center) == FoundBubbleStates.NOT_FOUNND {
            // create a bubble
            addBubble(center)
        }
    }
    
    func clearBubbles() {
        bubbles.removeAll()
    }
    
    func maybePopBubble(center:CGPoint) {
        
    }
    
    private func addBubble(_ center:CGPoint) {
        var newBubble = Utils.randBubble()
        var count = 0
        while overLaps(newBubble) {
            count += 1
            if count > Constants.GAVE_UP_LIMIT {
                return
            }
            newBubble = Utils.randBubble()
        }
        bubbles.append(newBubble)
    }
    
    private func overLaps(_ newBubble:Bubble) -> Bool {
        for bubble in bubbles {
            if newBubble.overLaps(anotherBubble: bubble) {
                return true
            }
        }
        return false
    }

    // Would return nil or a bubble
    func findBubble(_ point:CGPoint) -> Int {
        for bubble in bubbles {
            if bubble.bezierPath.contains(point) {
                return FoundBubbleStates.FOUND
            }
        }
        return FoundBubbleStates.NOT_FOUNND
    }

}
