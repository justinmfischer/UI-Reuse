//
//  Image.swift
//  UI-Reuse
//
//  Created by Justin Fischer on 6/10/16.
//  Copyright © 2016 Fischer, Justin. All rights reserved.
//

import UIKit

@IBDesignable class Image: UIImageView {
    lazy var gradient: CAGradientLayer = { return CAGradientLayer() }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    func setup() {
        self.gradient.colors = [self.startColor.CGColor, self.endColor.CGColor]
        self.gradient.locations = [0.35, 1.00]
        
        self.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.layer.borderWidth = 1
        self.layer.masksToBounds = true
        self.layer.addSublayer(self.gradient)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.gradient.frame = self.layer.bounds
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    
    }

    @IBInspectable dynamic var cornerRadius: CGFloat = 2 {
        didSet { self.layer.cornerRadius = self.cornerRadius }
    }
    
    @IBInspectable dynamic var startColor: UIColor = UIColor.clearColor() {
        didSet { self.gradient.colors = [self.startColor.CGColor, self.endColor.CGColor] }
    }
    
    @IBInspectable dynamic var endColor: UIColor = UIColor.lightGrayColor() {
        didSet { self.gradient.colors = [self.startColor.CGColor, self.endColor.CGColor] }
    }
}
