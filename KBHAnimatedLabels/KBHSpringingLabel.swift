//
//  KBHSpringyLabel.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/12/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

public class KBHSpringingLabel: KBHLabel, KBHAnimatable {
    
    /// True if the label is animating; false otherwise.
    public var isAnimating: Bool { return _isAnimating }
    private var _isAnimating = false
    
    private var originalFrames = [CGRect]()
    private let growKey = "grow"
    private let springKey = "spring"
    
    
    // MARK: Animate
    
    public func animate() {
        guard !_isAnimating else { return }
        _isAnimating = true
        
        for i in 0..<text.characters.count {
            let grow = CABasicAnimation(keyPath: "transform.scale")
            grow.fromValue = 1
            grow.toValue = 1.5
            grow.duration = 0.1
            grow.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            grow.delegate = self
            grow.setValue(i, forKey: animationKey + growKey)
            labels[i].layer.addAnimation(grow, forKey: nil)
        }
    }
    
    public override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if let i = anim.valueForKey(animationKey + growKey) as? Int {
            let spring = CASpringAnimation(keyPath: "transform.scale")
            spring.damping = 5
            spring.fromValue = 1.5
            spring.toValue = 1
            spring.duration = spring.settlingDuration
            spring.setValue(i, forKey: animationKey + springKey)
            spring.delegate = self
            labels[i].layer.addAnimation(spring, forKey: nil)
        } else if let i = anim.valueForKey(animationKey + springKey) as? Int where i == labels.count - 1 {
            _isAnimating = false
        }
    }
    
}
