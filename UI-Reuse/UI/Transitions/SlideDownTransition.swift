//
//  UI-Reuse
//
//  Created by Justin Fischer on 6/10/16.
//  Copyright © 2016 Fischer, Justin. All rights reserved.
//

import UIKit

class SlideDownTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let isPresenting :Bool
    let duration :NSTimeInterval = 0.6
    
    init(isPresenting: Bool) {
        self.isPresenting = isPresenting
        
        super.init()
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return self.duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning)  {
        if isPresenting {
            animatePresentationWithTransitionContext(transitionContext)
        }
        else {
            animateDismissalWithTransitionContext(transitionContext)
        }
    }
    
    func animatePresentationWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {
        let presentedController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let presentedControllerView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let containerView = transitionContext.containerView()
        
        presentedControllerView.frame = transitionContext.finalFrameForViewController(presentedController)
        presentedControllerView.center.y -= containerView!.bounds.size.height
        
        containerView!.addSubview(presentedControllerView)
        
        UIView.animateWithDuration(self.duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: .AllowUserInteraction, animations: {
            presentedControllerView.center.y += containerView!.bounds.size.height
            }, completion: {(completed: Bool) -> Void in
                transitionContext.completeTransition(completed)
        })
    }
    
    func animateDismissalWithTransitionContext(transitionContext: UIViewControllerContextTransitioning) {
        let presentedControllerView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let containerView = transitionContext.containerView()
        
        UIView.animateWithDuration(self.duration, animations: { () -> Void in
            presentedControllerView.center.y += containerView!.bounds.size.height
            }, completion: {(completed: Bool) -> Void in
                transitionContext.completeTransition(completed)
        })
    }
}
