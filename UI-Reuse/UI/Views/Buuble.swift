//
//  Buuble.swift
//  UI-Reuse
//
//  Created by Justin Fischer on 6/16/16.
//  Copyright © 2016 Fischer, Justin. All rights reserved.
//

import UIKit

@IBDesignable class Bubble: UIView {
    
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
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let HEIGHTOFPOPUPTRIANGLE:CGFloat = 5.0
        let WIDTHOFPOPUPTRIANGLE:CGFloat = 10.0
        let borderRadius:CGFloat = 8.0
        let strokeWidth:CGFloat = 1.0
        
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextTranslateCTM(context, 0.0, self.bounds.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        
        let currentFrame: CGRect = self.bounds
        CGContextSetLineJoin(context, CGLineJoin.Round)
        CGContextSetLineWidth(context, strokeWidth)
        CGContextSetStrokeColorWithColor(context, self.color.CGColor)
        CGContextSetFillColorWithColor(context, self.color.CGColor)

        CGContextBeginPath(context)
        CGContextMoveToPoint(context, borderRadius + strokeWidth + 0.5, strokeWidth + HEIGHTOFPOPUPTRIANGLE + 0.5)
        CGContextAddLineToPoint(context, round(currentFrame.size.width / 8.0 - WIDTHOFPOPUPTRIANGLE / 2.0) + 0.5, HEIGHTOFPOPUPTRIANGLE + strokeWidth + 0.5)
        CGContextAddLineToPoint(context, round(currentFrame.size.width / 8.0) + 0.5, strokeWidth + 0.5)
        CGContextAddLineToPoint(context, round(currentFrame.size.width / 8.0 + WIDTHOFPOPUPTRIANGLE / 2.0) + 0.5, HEIGHTOFPOPUPTRIANGLE + strokeWidth + 0.5)
        
        CGContextAddArcToPoint(context, currentFrame.size.width - strokeWidth - 0.5, strokeWidth + HEIGHTOFPOPUPTRIANGLE + 0.5, currentFrame.size.width - strokeWidth - 0.5, currentFrame.size.height - strokeWidth - 0.5, borderRadius - strokeWidth)
        CGContextAddArcToPoint(context, currentFrame.size.width - strokeWidth - 0.5, currentFrame.size.height - strokeWidth - 0.5, round(currentFrame.size.width / 2.0 + WIDTHOFPOPUPTRIANGLE / 2.0) - strokeWidth + 0.5, currentFrame.size.height - strokeWidth - 0.5, borderRadius - strokeWidth)
        CGContextAddArcToPoint(context, strokeWidth + 0.5, currentFrame.size.height - strokeWidth - 0.5, strokeWidth + 0.5, HEIGHTOFPOPUPTRIANGLE + strokeWidth + 0.5, borderRadius - strokeWidth)
        CGContextAddArcToPoint(context, strokeWidth + 0.5, strokeWidth + HEIGHTOFPOPUPTRIANGLE + 0.5, currentFrame.size.width - strokeWidth - 0.5, HEIGHTOFPOPUPTRIANGLE + strokeWidth + 0.5, borderRadius - strokeWidth)
        CGContextClosePath(context)
        CGContextDrawPath(context, CGPathDrawingMode.FillStroke)
    }
    
    @IBInspectable dynamic var color: UIColor = UIColor.lightGrayColor() {
        didSet { self.setNeedsDisplay() }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
    }
}