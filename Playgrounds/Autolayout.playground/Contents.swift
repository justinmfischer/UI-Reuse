

import UIKit

let width: CGFloat = 900
let height: CGFloat = 900
let options = NSLayoutFormatOptions(rawValue: UInt(0))
let metrics = ["padding" : 60]

let size = CGSize(width: width, height: height)

let drawingView = UIView(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: width, height: height)))
    drawingView.backgroundColor = #colorLiteral(red: 0.4324733615, green: 0.2484211922, blue: 0.6400775909, alpha: 1)

let bankOverlay = UIImageView(image: UIImage(named: "BOfAOverlay"))
    bankOverlay.translatesAutoresizingMaskIntoConstraints = false;

    drawingView.addSubview(bankOverlay)

let views = ["drawing" : drawingView, "overlay" : bankOverlay]
var constraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[overlay]-padding-|", options: options, metrics: metrics, views: views)

    drawingView.addConstraints(constraints)

    constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:[overlay]-padding-|", options: options, metrics: metrics, views: views)

    drawingView.addConstraints(constraints)
    drawingView.layoutIfNeeded()

UIGraphicsBeginImageContext(size)

    drawingView.layer.render(in: UIGraphicsGetCurrentContext()!)

let snapshot = UIGraphicsGetImageFromCurrentImageContext()

UIGraphicsEndImageContext()
