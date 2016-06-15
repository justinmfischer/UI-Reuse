//
//  MainVC.swift
//  UI-Reuse
//
//  Created by Fischer, Justin on 06/10/16.
//  Copyright © 2016 Fischer, Justin. All rights reserved.
//

import UIKit

class MainVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setup() {
        super.setup()
    }
    
    @IBAction func unwindToMainVC(segue: UIStoryboardSegue) {
        print("Unwind Segue: From \(segue.sourceViewController.title!) to Main")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

