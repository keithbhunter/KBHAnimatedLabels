//
//  SpinViewController.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/2/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

final class SpinViewController: UIViewController {
    
    private let darkPinkColor = UIColor(red: 231/255, green: 77/255, blue: 111/255, alpha: 1.0)
    private let lightPinkColor = UIColor(red: 251/255, green: 131/255, blue: 150/255, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = AnimationsTableViewController.Animations.Spin.stringValue()
        
        let gradient = CAGradientLayer()
        gradient.colors = [lightPinkColor.CGColor, darkPinkColor.CGColor];
        gradient.frame = view.frame
        view.layer.insertSublayer(gradient, atIndex: 0)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let spinningLabel = SpinningLabel(frame: CGRectMake(8, 8, view.frame.size.width - 16, view.frame.size.height - 16), text: "Some Text")
        spinningLabel.textColor = .whiteColor()
        spinningLabel.font = .boldSystemFontOfSize(24)
        spinningLabel.direction = .Right
        view.addSubview(spinningLabel)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}


final class SpinningLabel: KBHSpinningLabel {
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        animateForDuration(2, numberOfTimes: 3)
    }
    
}

