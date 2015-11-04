//
//  AnimationsTableViewController.swift
//  KBHAnimatedLabels
//
//  Created by Keith Hunter on 11/2/15.
//  Copyright © 2015 Keith Hunter. All rights reserved.
//

import UIKit

final class AnimationsTableViewController: UITableViewController {
    
    enum Animations: Int {
        case Flip
        case Spin
        case Spring
        case Total
        
        func stringValue() -> String {
            switch self {
            case Flip: return "Flip"
            case Spin: return "Spin"
            case Spring: return "Spring"
            default: return "Total"
            }
        }
    }
    
    
    // MARK: UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animations"
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    
    
    // MARK: Table View DataSource and Delegate
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Animations.Total.rawValue
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let animation = Animations(rawValue: indexPath.row) else { fatalError("Unexpected index path: \(indexPath.row)") }
        let cell = tableView.dequeueReusableCellWithIdentifier("Basic", forIndexPath: indexPath)
        cell.textLabel?.text = animation.stringValue()
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let animation = Animations(rawValue: indexPath.row) else { fatalError("Unexpected index path: \(indexPath.row)") }
        performSegueWithIdentifier(animation.stringValue(), sender: nil)
    }
    
}
