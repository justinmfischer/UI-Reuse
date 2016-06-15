//
//  Label.swift
//  UI-Reuse
//
//  Created by Justin Fischer on 6/10/16.
//  Copyright © 2016 Fischer, Justin. All rights reserved.
//

import UIKit

@IBDesignable class Label: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setup()
    }
    
    func setup() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    
    }
    
    @IBInspectable dynamic var fontSize: CGFloat = 18 {
        didSet { self.font = UIFont.defaultFontBold(fontSize) }
    }
}

