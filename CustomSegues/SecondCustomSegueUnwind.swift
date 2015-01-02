//
//  SecondCustomSegueUnwind.swift
//  CustomSegues
//
//  Created by Brad Woodard on 1/2/15.
//  Copyright (c) 2015 Brad Woodard. All rights reserved.
//

import UIKit

class SecondCustomSegueUnwind: UIStoryboardSegue {
    
    override func perform() {
        
        // Declare local variables for views
        var firstVCView = destinationViewController.view as UIView!
        var thirdVCView = sourceViewController.view as UIView!
        
        // Set a local variable for screen height
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // Set initial state of firstVCView (off-screen and scaled down)
        firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, screenHeight)
        firstVCView.transform = CGAffineTransformScale(firstVCView.transform, 0.0001, 0.0001)
        
        // Add firstVCView the app's window
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, aboveSubview: thirdVCView)
        
        // Perform the animation
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            thirdVCView.transform = CGAffineTransformScale(thirdVCView.transform, 0.0001, 0.0001)
            thirdVCView.frame = CGRectOffset(thirdVCView.frame, 0.0, -screenHeight)
            
            firstVCView.transform = CGAffineTransformIdentity
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, -screenHeight)
        }) { (Finished) -> Void in
            self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
   
}
