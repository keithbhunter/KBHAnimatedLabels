//
//  KBHSpringLabel.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/2/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

public class KBHWaveLabel: KBHLabel {
    
    private var originalFrames = [CGRect]()
    
    
    // MARK: Animate
    
    public func animate() {
        animateWithDamping(5)
    }
    
    public func animateWithDamping(damping: Double) {
        animateWithDamping(damping, removeOnCompletion: true)
    }
    
    private func animateWithDamping(damping: Double, removeOnCompletion: Bool) {
        guard damping >= 0 else { return }  // damping MUST be >= 0
        
        if originalFrames.count != labels.count {
            // Ensure that originalFrames is the same capacity as labels
            originalFrames = [CGRect](count: labels.count, repeatedValue: CGRectZero)
        }
        
        for i in 0..<text.characters.count {
            let label = self.labels[i]
            originalFrames[i] = label.frame
            let delay = Double(i) / 10
            
            UIView.animateWithDuration(0.1, delay: delay, options: [.CurveEaseIn], animations: { () -> Void in
                // Animate to where the spring animation will begin so it doesn't look jumpy
                label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y - 25, label.frame.width, label.frame.height)
            }, completion: { finished in
                // Start the spring animation
                let wave = CASpringAnimation(keyPath: "position.y")
                wave.damping = CGFloat(damping)
                wave.fromValue = label.layer.position.y
                wave.toValue = label.layer.position.y + 25
                wave.duration = wave.settlingDuration
                wave.beginTime = CACurrentMediaTime()  // stagger animations so they don't all start at once
                wave.removedOnCompletion = removeOnCompletion
                wave.delegate = self
                label.layer.addAnimation(wave, forKey: nil)
                label.frame = self.originalFrames[i]
            })
        }
    }
    
}
