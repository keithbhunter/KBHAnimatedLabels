//
//  KBHFlippingLabel.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/1/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

public class KBHFlippingLabel: KBHLabel {
    
    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        flipLabels()
    }
    
    private func flipLabels() {
        for i in 0..<text.characters.count {
            let spin = CABasicAnimation(keyPath: "transform.rotation.y")
            spin.fromValue = 0
            spin.toValue = 2 * M_PI
            spin.duration = 1
            spin.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            spin.beginTime = CACurrentMediaTime() + (CFTimeInterval(i) / 10)
            spin.removedOnCompletion = true
            labels[i].layer.addAnimation(spin, forKey: nil)
        }
    }
    
}
