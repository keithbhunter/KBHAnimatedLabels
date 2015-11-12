//
//  SpringViewController.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/12/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

final class SpringViewController: AnimationViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let spring = KBHSpringingLabel(frame: CGRectMake(8, 8, view.frame.size.width - 16, view.frame.size.height - 16), text: "Some Text")
        spring.textColor = .whiteColor()
        spring.font = UIFont.boldSystemFontOfSize(24)
        view.addSubview(spring)
        animatedLabel = spring
    }
    
    override func colorForBackground() -> UIColor {
        return UIColor(red: 48/255, green: 142/255, blue: 96/255, alpha: 1)
    }
    
    override func typeOfAnimation() -> AnimationsTableViewController.Animations {
        return .Spring
    }
    
}
