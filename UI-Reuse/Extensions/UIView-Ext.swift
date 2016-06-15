
import UIKit

extension UIView {
    
    func anchorAllEdgesToSuperview() {
        self.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 9.0, *) {
            addSuperviewConstraint(topAnchor.constraintEqualToAnchor(superview?.topAnchor))
            addSuperviewConstraint(leftAnchor.constraintEqualToAnchor(superview?.leftAnchor))
            addSuperviewConstraint(bottomAnchor.constraintEqualToAnchor(superview?.bottomAnchor))
            addSuperviewConstraint(rightAnchor.constraintEqualToAnchor(superview?.rightAnchor))
        }
        else {
            for attribute : NSLayoutAttribute in [.Left, .Top, .Right, .Bottom] {
                anchorToSuperview(attribute)
            }
        }
    }
    
    func anchorToSuperview(attribute: NSLayoutAttribute) {
        addSuperviewConstraint(NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .Equal, toItem: superview, attribute: attribute, multiplier: 1.0, constant: 0.0))
    }
    
    func addSuperviewConstraint(constraint: NSLayoutConstraint) {
        superview?.addConstraint(constraint)
    }
}
