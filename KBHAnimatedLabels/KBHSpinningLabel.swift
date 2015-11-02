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
    
    /// The direction that the text will spin when animated.
    public var direction: SpinDirection = .Right
    
    
    // MARK: Animate
    
    public func animate() {
        animateForDuration(1)
    }
    
    public func animateForDuration(duration: Double, numberOfTimes: Int = 1, timingFunction: CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)) {
        animateForDuration(duration, numberOfTimes: numberOfTimes, timingFunction: timingFunction, removeOnCompletion: true)
    }
    
    private func animateForDuration(duration: Double, numberOfTimes: Int, timingFunction: CAMediaTimingFunction, removeOnCompletion: Bool) {
        for i in 0..<text.characters.count {
            let toValue = Double(numberOfTimes) * 2 * M_PI
            let spin = CABasicAnimation(keyPath: "transform.rotation.z")
            spin.fromValue = 0
            spin.toValue = direction == .Right ? toValue : -(toValue)
            spin.duration = duration
            spin.timingFunction = timingFunction
            spin.beginTime = CACurrentMediaTime() + (CFTimeInterval(i) / 10)  // stagger animations so they don't all start at once
            spin.removedOnCompletion = removeOnCompletion
            labels[i].layer.addAnimation(spin, forKey: nil)
        }
    }
    
}
