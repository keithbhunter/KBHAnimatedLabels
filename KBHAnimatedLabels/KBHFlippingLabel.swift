//
//  KBHFlippingLabel.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/1/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

public class KBHFlippingLabel: KBHLabel {
    
    public enum FlipDirection {
        case Vertical, Horizontal
    }
    
    public var direction: FlipDirection = .Horizontal
    
    
    override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        flipLabels()
    }
    
    private func flipLabels() {
        for i in 0..<text.characters.count {
            let keyPath = direction == .Horizontal ? "transform.rotation.y" : "transform.rotation.x"
            let flip = CABasicAnimation(keyPath: keyPath)
            flip.fromValue = 0
            flip.toValue = 2 * M_PI
            flip.duration = 1
            flip.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            flip.beginTime = CACurrentMediaTime() + (CFTimeInterval(i) / 10)
            flip.removedOnCompletion = true
            labels[i].layer.addAnimation(flip, forKey: nil)
        }
    }
    
}
