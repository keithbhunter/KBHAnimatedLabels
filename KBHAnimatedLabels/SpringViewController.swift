//
//  SpringViewController.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/2/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

final class SpringViewController: UIViewController {
    
    private let darkOrangeColor = UIColor(red: 241/255, green: 81/255, blue: 45/255, alpha: 1.0)
    private let lightOrangeColor = UIColor(red: 242/255, green: 159/255, blue: 55/255, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = AnimationsTableViewController.Animations.Spring.stringValue()
        
        let gradient = CAGradientLayer()
        gradient.colors = [lightOrangeColor.CGColor, darkOrangeColor.CGColor];
        gradient.frame = view.frame
        view.layer.insertSublayer(gradient, atIndex: 0)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let springLabel = WaveLabel(frame: CGRectMake(8, 8, view.frame.size.width - 16, view.frame.size.height - 16), text: "Some Text")
        springLabel.textColor = .whiteColor()
        springLabel.font = .boldSystemFontOfSize(24)
        view.addSubview(springLabel)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}


final class WaveLabel: KBHWaveLabel {
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        animate()
    }
    
}
