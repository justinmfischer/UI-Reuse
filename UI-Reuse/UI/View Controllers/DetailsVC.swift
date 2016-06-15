//
//  DetailsVC.swift
//  UI-Reuse
//
//  Created by Fischer, Justin on 06/10/16.
//  Copyright © 2016 Fischer, Justin. All rights reserved.
//

import UIKit

class DetailsVC: BaseVC {
    
    @IBOutlet var content: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setup() {
        super.setup()
    }
    
    @IBAction func tapAddContent(sender: AnyObject) {
        self.view.addSubview(self.content)
        
        self.content.translatesAutoresizingMaskIntoConstraints = false
        self.content.anchorAllEdgesToSuperview()
        
        super.toggleCTA()
    }

    @IBAction func tapRemoveContent(sender: AnyObject) {
        self.content.removeFromSuperview()
        
        super.toggleCTA()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

