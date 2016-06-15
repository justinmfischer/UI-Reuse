//
//  Card.swift
//  UI-Reuse
//
//  Created by Justin Fischer on 6/15/16.
//  Copyright © 2016 Fischer, Justin. All rights reserved.
//

import UIKit

class Card: UIViewController, UIViewControllerTransitioningDelegate {
    var shouldDismiss: (() -> ())?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.modalPresentationStyle = .Custom
        self.transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup() {

    }
    
    @IBAction func close(sender: AnyObject) {
        self.shouldDismiss?()
    }
    
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        if (presented == self) {
            return DefaultPresentationController(backgroundStyle: DefaultBackgroundStyle.Dimming, presentedViewController: presented, presentingViewController: presenting, sizeOfFrameInsetOfPresentedViewInContainerView: CGSize(width: 0, height: 0))
        }
        
        return nil
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (presented == self) {
            return SlideDownTransition(isPresenting: true)
        } else {
            return nil
        }
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if (dismissed == self) {
            return SlideDownTransition(isPresenting: false)
        } else {
            return nil
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

