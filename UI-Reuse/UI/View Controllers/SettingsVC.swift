//
//  SettingsVC.swift
//  UI-Reuse
//
//  Created by Fischer, Justin on 06/10/16.
//  Copyright © 2016 Fischer, Justin. All rights reserved.
//

import UIKit

class SettingsVC: BaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setup() {
        super.setup()
    }

    @IBAction func tapAddContent(sender: AnyObject) {
        guard let card = UIStoryboard(name: "Components", bundle: nil).instantiateViewControllerWithIdentifier("card") as? Card else {
            return
        }
        
        self.presentViewController(card, animated: true) { () -> Void in
            card.shouldDismiss = {() -> () in
                self.dismissViewControllerAnimated(true, completion: { () -> Void in })
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

