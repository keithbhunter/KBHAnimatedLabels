//
//  SpringViewController.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/2/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

final class WaveViewController: AnimationViewController {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let waveLabel = KBHWaveLabel(frame: CGRectMake(8, 8, view.frame.size.width - 16, view.frame.size.height - 16), text: "Some Text")
        waveLabel.textColor = .whiteColor()
        waveLabel.font = .boldSystemFontOfSize(24)
        view.addSubview(waveLabel)
        animatedLabel = waveLabel
    }
    
    override func colorsForGradient() -> [CGColor]? {
        return [UIColor(red: 242/255, green: 159/255, blue: 55/255, alpha: 1.0).CGColor, UIColor(red: 241/255, green: 81/255, blue: 45/255, alpha: 1.0).CGColor]
    }
    
    override func typeOfAnimation() -> AnimationsTableViewController.Animations {
        return .Wave
    }
    
}
