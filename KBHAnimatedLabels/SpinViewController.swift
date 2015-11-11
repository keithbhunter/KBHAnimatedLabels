//
//  SpinViewController.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/2/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

final class SpinViewController: AnimationViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let spinningLabel = KBHSpinningLabel(frame: CGRectMake(8, 8, view.frame.size.width - 16, view.frame.size.height - 16), text: "Some Text")
        spinningLabel.textColor = .whiteColor()
        spinningLabel.font = .boldSystemFontOfSize(24)
        spinningLabel.direction = .Right
        view.addSubview(spinningLabel)
        animatedLabel = spinningLabel
    }
    
    override func colorForBackground() -> UIColor {
        return UIColor(red: 251/255, green: 131/255, blue: 150/255, alpha: 1.0)
    }
    
    override func typeOfAnimation() -> AnimationsTableViewController.Animations {
        return .Spin
    }
    
}

