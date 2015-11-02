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

    
    // MARK: Animate
    
    public func animate() {
        animateForDuration(1)
    }
    
    public func animateForDuration(duration: Double, numberOfTimes: Int = 1, timingFunction: CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)) {
        animateForDuration(duration, numberOfTimes: numberOfTimes, timingFunction: timingFunction, removeOnCompletion: true)
    }
    
    private func animateForDuration(duration: Double, numberOfTimes: Int, timingFunction: CAMediaTimingFunction, removeOnCompletion: Bool) {
        for i in 0..<text.characters.count {
            let keyPath = direction == .Horizontal ? "transform.rotation.y" : "transform.rotation.x"
            let flip = CABasicAnimation(keyPath: keyPath)
            flip.fromValue = 0
            flip.toValue = Double(numberOfTimes) * 2 * M_PI
            flip.duration = duration
            flip.timingFunction = timingFunction
            flip.beginTime = CACurrentMediaTime() + (CFTimeInterval(i) / 10)  // stagger animations so they don't all start at once
            flip.removedOnCompletion = removeOnCompletion
            labels[i].layer.addAnimation(flip, forKey: nil)
        }
    }
    
}
