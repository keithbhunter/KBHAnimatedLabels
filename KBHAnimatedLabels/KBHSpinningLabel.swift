//
//  KBHSpinningLabel.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/2/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

public class KBHSpinningLabel: KBHLabel, KBHAnimatable {
    
    public enum SpinDirection {
        case Left, Right
    }
    
    
    /// True if the label is animating; false otherwise.
    public var isAnimating: Bool { return _isAnimating }
    private var _isAnimating = false
    
    /// The direction that the text will spin when animated. Defaults to Right.
    public var spinDirection: SpinDirection = .Right
    
    /// A timing function for the animation to use. Defaults to kCAMediaTimingFunctionEaseOut.
    public var timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    
    /// Total time the spin animation will take. Defaults to 1 second.
    public var duration: CFTimeInterval = 1
    
    /// The number of times each letter will spin during the duration. This number must be greater than 0. Defaults to 1.
    public var numberOfSpins: Int = 1
    
    private let spinKey = "spin"
    
    
    // MARK: Animate
    
    public func animate() {
        guard numberOfSpins > 0 && !_isAnimating else { return }
        _isAnimating = true
        
        for i in 0..<text.characters.count {
            let toValue = Double(numberOfSpins) * 2 * M_PI
            let spin = CABasicAnimation(keyPath: "transform.rotation.z")
            spin.fromValue = 0
            spin.toValue = spinDirection == .Right ? toValue : -(toValue)
            spin.duration = duration
            spin.timingFunction = timingFunction
            spin.beginTime = CACurrentMediaTime() + (CFTimeInterval(i) / 10)  // stagger animations so they don't all start at once
            spin.setValue(i, forKey: animationKey + spinKey)
            spin.delegate = self
            labels[i].layer.addAnimation(spin, forKey: nil)
        }
    }
    
    public override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if let i = anim.valueForKey(animationKey + spinKey) as? Int where i == labels.count - 1 {
            // the animation on the last label finished
            _isAnimating = false
        }
    }
    
}
