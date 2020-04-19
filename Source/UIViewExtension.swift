//
//  UIViewCallBackExtension.swift
//  CallBackExtension
//
//  Created by Kishan on 19/04/20.
//  Copyright © 2020 Kishan. All rights reserved.
//

import UIKit

typealias GestureCallBackClosure = (_ sender: UITapGestureRecognizer) -> Void

extension UIView {
    
    // To add UITapGesture to UIView.
    func addTapGesture(_ callBack : @escaping GestureCallBackClosure) {
        let tap = UITapGestureRecognizer()
        self.addGestureRecognizer(tap)

        self.isUserInteractionEnabled = true
        tap.callBackTarget(closure: callBack)
    }
}

