//
//  FirstCustomSegueUnwind.swift
//  CustomSegues
//
//  Created by Brad Woodard on 1/2/15.
//  Copyright (c) 2015 Brad Woodard. All rights reserved.
//

import UIKit

class FirstCustomSegueUnwind: UIStoryboardSegue {
    
    override func perform() {
        // Assign the source and destination views to local variables
        var secondVCView = self.sourceViewController.view as UIView!
        var firstVCView = self.destinationViewController.view as UIView!
        
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // Add the first view controller to the window's subviews
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, aboveSubview: secondVCView)
        
        // Animate the movement between the views
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, screenHeight)
        }) { (Finished) -> Void in
            self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
   
}
