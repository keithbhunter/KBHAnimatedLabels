//
//  UIGradientViewController.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/4/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    var animatedLabel: KBHAnimatable?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = typeOfAnimation().stringValue()
        view.backgroundColor = colorForBackground()
    }
    
    func colorForBackground() -> UIColor {
        return .whiteColor()
    }
    
    func typeOfAnimation() -> AnimationsTableViewController.Animations {
        fatalError("typeOfAnimation() was not overridden!")
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        animatedLabel?.animate()
    }
    
}
