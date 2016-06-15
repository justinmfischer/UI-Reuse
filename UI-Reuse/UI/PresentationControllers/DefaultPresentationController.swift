//
//  UI-Reuse
//
//  Created by Justin Fischer on 6/10/16.
//  Copyright © 2016 Fischer, Justin. All rights reserved.
//

import UIKit

enum DefaultBackgroundStyle {
    case BlurEffects
    case Dimming
    
    init() {
        self = .Dimming
    }
}

class DefaultPresentationController: UIPresentationController {
    let backgroundStyle: DefaultBackgroundStyle
    let sizeOfFrameInsetOfPresentedViewInContainerView: CGSize
    
    init(backgroundStyle: DefaultBackgroundStyle = .Dimming, presentedViewController: UIViewController, presentingViewController: UIViewController, sizeOfFrameInsetOfPresentedViewInContainerView: CGSize = CGSizeZero) {
        
        self.backgroundStyle = backgroundStyle
        self.sizeOfFrameInsetOfPresentedViewInContainerView = sizeOfFrameInsetOfPresentedViewInContainerView
        
        super.init(presentedViewController: presentedViewController, presentingViewController: presentingViewController)
    }
    
    lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.containerView!.bounds
        blurEffectView.alpha = 1.0
        
        return blurEffectView
        }()
    
    lazy var dimmingView: UIView = {
        let dimmingView = UIView(frame: self.containerView!.bounds)
        dimmingView.backgroundColor = UIColor.blackColor()
        dimmingView.alpha = 0.0
        
        return dimmingView
        }()
    
    override func presentationTransitionWillBegin() {
        if self.backgroundStyle == .Dimming {
            self.containerView!.addSubview(self.dimmingView)
        } else {
            self.containerView!.addSubview(self.blurEffectView)
        }
        
        if let transitionCoordinator = self.presentingViewController.transitionCoordinator() {
            transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                
                if self.backgroundStyle == .Dimming {
                    self.dimmingView.alpha = 0.6
                }
                
                }, completion: { (context) -> Void in
                    
            })
        }
    }
    
    override func dismissalTransitionWillBegin()  {
        if let transitionCoordinator = self.presentingViewController.transitionCoordinator() {
            transitionCoordinator.animateAlongsideTransition({(context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                if self.backgroundStyle == .Dimming {
                    self.dimmingView.alpha = 0.0
                }
                
                }, completion: { (context) -> Void in
            })
        }
    }
    
    override func presentationTransitionDidEnd(completed: Bool)  {
        if (!completed) {
            self.remove()
        }
    }
    
    override func dismissalTransitionDidEnd(completed: Bool) {
        self.remove()
    }
    
    func remove() {
        if self.backgroundStyle == .Dimming {
            self.dimmingView.removeFromSuperview()
        } else {
            self.blurEffectView.removeFromSuperview()
        }
    }
    
    override func frameOfPresentedViewInContainerView() -> CGRect {
        var frame = self.containerView!.bounds;
            frame = CGRectInset(frame, sizeOfFrameInsetOfPresentedViewInContainerView.width, sizeOfFrameInsetOfPresentedViewInContainerView.height)
        
        return frame
    }
}