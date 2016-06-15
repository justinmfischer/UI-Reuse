//
//  BaseVC.swift
//  UI-Reuse
//
//  Created by Fischer, Justin on 06/10/16.
//  Copyright © 2016 Fischer, Justin. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    @IBOutlet var CTA: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup() {
        
    }
    
    func alert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func toggleCTA() {
        guard let cta = self.CTA else {
            return
        }
        
        cta.hidden = (cta.hidden == true) ? false : true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

