//
//  ViewController.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/1/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    private let darkBlueColor = UIColor(red: 35/255, green: 58/255, blue: 89/255, alpha: 1.0)
    private let lightBlueColor = UIColor(red: 71/255, green: 154/255, blue: 184/255, alpha: 1.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.colors = [lightBlueColor.CGColor, darkBlueColor.CGColor];
        gradient.frame = view.frame
        view.layer.insertSublayer(gradient, atIndex: 0)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let flippingLabel = KBHFlippingLabel(frame: CGRectMake(8, 8, view.frame.size.width - 16, view.frame.size.height - 16), text: "Some Text")
        flippingLabel.textColor = .whiteColor()
        flippingLabel.font = .boldSystemFontOfSize(24)
        view.addSubview(flippingLabel)
    }

}

