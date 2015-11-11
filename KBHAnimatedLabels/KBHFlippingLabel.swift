//
//  KBHFlippingLabel.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/1/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

public class KBHFlippingLabel: KBHLabel, KBHAnimatable {
    
    public enum FlipDirection {
        case Vertical  // Flips over the x axis
        case Horizontal  // Flips over the y axis
    }
    
    
    /// True if the label is animating; false otherwise.
    public var isAnimating: Bool { return _isAnimating }
    private var _isAnimating = false

    /// The direction that the text will flip when animated. Defaults to Horizontal.
    public var direction: FlipDirection = .Horizontal
    
    /// A timing function for the animation to use. Defaults to kCAMediaTimingFunctionDefault.
    public var timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
    
    /// Total time the flip animation will take. Defaults to 1 second.
    public var duration: CFTimeInterval = 1
    
    /// The number of times each letter will spin during the duration. This number must be greater than 0. Defaults to 1.
    public var numberOfFlips: Int = 1
    
    private let indexKey = "index"

    
    // MARK: Animate
    
    public func animate() {
        guard numberOfFlips > 0 && !_isAnimating else { return }
        _isAnimating = true
        
        for i in 0..<text.characters.count {
            let keyPath = direction == .Horizontal ? "transform.rotation.y" : "transform.rotation.x"
            let flip = CABasicAnimation(keyPath: keyPath)
            flip.fromValue = 0
            flip.toValue = Double(numberOfFlips) * 2 * M_PI
            flip.duration = duration
            flip.timingFunction = timingFunction
            flip.beginTime = CACurrentMediaTime() + (CFTimeInterval(i) / 10)  // stagger animations so they don't all start at once
            flip.setValue(i, forKey: animationKey + indexKey)
            flip.delegate = self
            labels[i].layer.addAnimation(flip, forKey: nil)
        }
    }
    
    public override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        guard let i = anim.valueForKey(animationKey + indexKey) as? Int else { return }
        
        // the animation on the last label finished
        if i == labels.count - 1 {
            _isAnimating = false
        }
    }
    
}
