//
//  ViewController.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/1/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

final class FlipViewController: AnimationViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let flippingLabel = KBHFlippingLabel(frame: CGRectMake(8, 8, view.frame.size.width - 16, view.frame.size.height - 16), text: "Some Text")
        flippingLabel.textColor = .whiteColor()
        flippingLabel.font = .boldSystemFontOfSize(24)
        flippingLabel.direction = .Horizontal
        view.addSubview(flippingLabel)
        animatedLabel = flippingLabel
    }
    
    override func colorForBackground() -> UIColor {
        return UIColor(red: 71/255, green: 154/255, blue: 184/255, alpha: 1.0)
    }
    
    override func typeOfAnimation() -> AnimationsTableViewController.Animations {
        return .Flip
    }

}

