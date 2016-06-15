//
//  Button.swift
//  UI-Reuse
//
//  Created by Justin Fischer on 6/10/16.
//  Copyright © 2016 Fischer, Justin. All rights reserved.
//

import UIKit

@IBDesignable class Button: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    func setup() {
        self.applyStyle()
    }
    
    func applyStyle() {
        self.setBackgroundImage(UIImage(named: "Button-Chevron", inBundle: NSBundle(forClass: self.dynamicType), compatibleWithTraitCollection: nil), forState: UIControlState.Normal)
        self.backgroundColor = UIColor.lightGrayColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        self.applyStyle()
    }
    
    @IBInspectable dynamic var fontSize: CGFloat = 22 {
        didSet { self.titleLabel?.font = UIFont.defaultFontThin(fontSize) }
    }
}

