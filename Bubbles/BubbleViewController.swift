//
//  BubbleViewController.swift
//  Bubbles
//
//  Created by Chen Cen on 1/15/17.
//  Copyright © 2017 Chen Cen. All rights reserved.
//

import UIKit

class BubbleViewController: UIViewController {    
    @IBOutlet weak var bubbleView: BubbleView! {
        didSet {
            bubbleView.clearAndRillBubbles()
            
        }
    }
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
//        bubbleView.maybeAddBubble(center: sender.location(in: bubbleView))
        bubbleView.maybePopBubble(center: sender.location(in: bubbleView))
    }

    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
//        bubbleView.clearBubbles()
        bubbleView.clearAndRillBubbles()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
