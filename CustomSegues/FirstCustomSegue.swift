//
//  FirstCustomSegue.swift
//  CustomSegues
//
//  Created by Brad Woodard on 1/2/15.
//  Copyright (c) 2015 Brad Woodard. All rights reserved.
//

import UIKit

class FirstCustomSegue: UIStoryboardSegue {
    
    override func perform() {
        // Assign the source and destination views to local variables
        var firstVCView = self.sourceViewController.view as UIView!
        var secondVCView = self.destinationViewController.view as UIView!
        
        // Get screen width and height
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        // Specify the initial position of the destination view
        secondVCView.frame = CGRectMake(0.0, screenHeight, screenWidth, screenHeight)
        
        // Access the app's key window and insert the destination view above the source view
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(secondVCView, aboveSubview: firstVCView)
        
        // Animate the transition
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, -screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, -screenHeight)
        }) { (Finished) -> Void in
            self.sourceViewController.presentViewController(self.destinationViewController as UIViewController, animated: false, completion: nil)
        }
    }
}