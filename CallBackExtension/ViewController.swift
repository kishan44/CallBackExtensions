//
//  ViewController.swift
//  CallBackExtension
//
//  Created by Kishan on 19/04/20.
//  Copyright © 2020 Kishan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btnSample: UIButton!
    @IBOutlet weak var lblTappableText: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add tap gesture to view
        // Use [weak self] or [unowned self] to avoid retain cycle.
        self.view.addTapGesture {[unowned self] (gesture) in
            print(gesture.view ?? self.view as Any)
        }
        
        self.lblTappableText.addTapGesture {[unowned self] (gesture) in
            print(self.lblTappableText.text ?? "")
        }
        
        // Use [weak self] or [unowned self] to avoid retain cycle.
        btnSample.callBackTarget {(sender) in
            print(sender.titleLabel?.text ?? "")
        }
    }


}

