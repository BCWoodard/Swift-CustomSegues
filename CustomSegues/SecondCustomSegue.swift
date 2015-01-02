//
//  SecondCustomSegue.swift
//  CustomSegues
//
//  Created by Brad Woodard on 1/2/15.
//  Copyright (c) 2015 Brad Woodard. All rights reserved.
//

import UIKit

class SecondCustomSegue: UIStoryboardSegue {
    
    override func perform() {
        var firstVCView = sourceViewController.view as UIView!
        var thirdVCView = destinationViewController.view as UIView!
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(thirdVCView, belowSubview: firstVCView)
        
        // Scale the third view way down. Not to zero as this would have no effect
        thirdVCView.transform = CGAffineTransformScale(thirdVCView.transform, 0.0001, 0.001)
        
        // TWO-PART Animation: scale down the first (source) view and then scale up the third (destination) view
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            firstVCView.transform = CGAffineTransformScale(thirdVCView.transform, 0.001, 0.001)
        }) { (Finished) -> Void in
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                thirdVCView.transform = CGAffineTransformIdentity
            }, completion: { (Finished) -> Void in
                firstVCView.transform = CGAffineTransformIdentity
                self.sourceViewController.presentViewController(self.destinationViewController as UIViewController, animated: false, completion: nil)
            })
        }
    }
   
}
