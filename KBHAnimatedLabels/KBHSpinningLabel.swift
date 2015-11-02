//
//  KBHSpinningLabel.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/2/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

public class KBHSpinningLabel: KBHLabel {
    
    public enum SpinDirection {
        case Left, Right
    }
    
    public var direction: SpinDirection = .Right
    
    
    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        spinLabels()
    }
    
    private func spinLabels() {
        for i in 0..<text.characters.count {
            let toValue = 2 * M_PI
            let spin = CABasicAnimation(keyPath: "transform.rotation.z")
            spin.fromValue = 0
            spin.toValue = direction == .Right ? toValue : -(toValue)
            spin.duration = 1
            spin.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            spin.beginTime = CACurrentMediaTime() + (CFTimeInterval(i) / 10)
            spin.removedOnCompletion = true
            labels[i].layer.addAnimation(spin, forKey: nil)
        }
    }
    
}
