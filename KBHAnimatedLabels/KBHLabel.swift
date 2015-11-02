//
//  KBHLabel.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/1/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

public class KBHLabel: UIView {
    
    private var _labels = [UILabel]()
    public var labels: [UILabel] { return _labels }
    public var text: String {
        get { return getText() }
        set { setText(newValue) }
    }
    
    
    // MARK: Init
    
    public init(frame: CGRect, text: String) {
        super.init(frame: frame)
        setText(text)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK: Text Accessors
    
    private func getText() -> String {
        var t = ""
        for label in _labels where label.text != nil {
            t += label.text!
        }
        return t
    }
    
    private func setText(text: String) {
        removeLabels()
        addLabelsForText(text)
    }
    
    
    // MARK: Labels
    
    private func removeLabels() {
        for label in _labels {
            label.removeFromSuperview()
        }
        _labels = []
    }
    
    private func addLabelsForText(text: String) {
        let charWidth = frame.size.width / CGFloat(text.characters.count)
        for i in 0..<text.characters.count {
            let index = text.startIndex.advancedBy(i)
            let label = UILabel(frame: CGRectMake(CGFloat(i) * charWidth, 0, charWidth, frame.size.height))
            label.text = String(text[index])
            label.textAlignment = .Center
            addSubview(label)
            _labels.append(label)
        }
    }
    
}

