//
//  KBHSpringLabel.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/2/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

public class KBHWaveLabel: KBHLabel, KBHAnimatable {
    
    public enum WaveDirection {
        case Left, Right
    }
    
    
    private var originalFrames = [CGRect]()
    
    /// The direction the wave flows through the text. Defaults to Right.
    public var direction: WaveDirection = .Right
    
    /// The damping factor in the wave animation. Must be greater than or equal to 0. Higher numbers make the wave less spring-like. Defaults to 500.
    public var damping: CGFloat = 500
    
    /// The height of the wave. Defaults to 25.
    public var waveHeight: CGFloat = 25
    
    
    // MARK: Animate
    
    public func animate() {
        guard damping >= 0 else { return }  // damping MUST be >= 0
        
        // Ensure that originalFrames is the same capacity as labels
        if originalFrames.count != labels.count {
            originalFrames = [CGRect](count: labels.count, repeatedValue: CGRectZero)
        }
        
        for i in 0..<text.characters.count {
            let label = self.labels[i]
            originalFrames[i] = label.frame
            let delay = direction == .Right ? Double(i) / 10 : abs(Double(i - text.characters.count)) / 10  // controls left/right flow
            
            // stagger animations with delay so they don't all start at once
            UIView.animateWithDuration(0.1, delay: delay, options: [.CurveEaseOut], animations: { () -> Void in
                // Animate to where the spring animation will begin so it doesn't look jumpy
                label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y - self.waveHeight, label.frame.width, label.frame.height)
            }, completion: { finished in
                // Start the wave animation
                let wave = CASpringAnimation(keyPath: "position.y")
                wave.damping = self.damping
                wave.fromValue = label.layer.position.y
                wave.toValue = label.layer.position.y + self.waveHeight
                wave.duration = wave.settlingDuration
                label.layer.addAnimation(wave, forKey: nil)
                label.frame = self.originalFrames[i]
            })
        }
    }
    
}
