//
//  KBHAnimatedLabel.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/4/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

public protocol KBHAnimatable {
    
    /// Any object implementing KBHAnimatable should use this in front of any key used in setValue(_, forKey:). Example: setValue(index, forKey: animationKey + "index")
    var animationKey: String { get }
    
    /// True if the animatable is animating; false otherwise.
    var isAnimating: Bool { get }
    
    
    /// Kick off the animation of the animatable. Objects implementing KBHAnimatable should use this method to add any animations.
    func animate()
    
}


public extension KBHAnimatable {
    
    var animationKey: String { return "KBHAnimatable." }
    
}
