//
//  UIButtonCallBackExtension.swift
//  CallBackExtension
//
//  Created by Kishan on 19/04/20.
//  Copyright © 2020 Kishan. All rights reserved.
//

import UIKit

extension UIButton {
    
    
    // To access object
    struct Keys {
        static fileprivate var buttonClosure: UInt8 = 0
    }
    
    // Typealias to handle button's callBacks
    typealias ButtonCallBackClosure = (_ sender: UIButton) -> Void
    
    
    // Public Callback Target
    func callBackTarget(closure: @escaping ButtonCallBackClosure) {
        callBackTargetClosure = closure
    }
    
    // Private instance of callback
    private var callBackTargetClosure: ButtonCallBackClosure? {
        get {
            return objc_getAssociatedObject(self, &Keys.buttonClosure) as? ButtonCallBackClosure
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &Keys.buttonClosure, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                addTarget(self, action: #selector(clickOnClosureButton(_:)), for: .touchUpInside)
            }
        }
    }
    
    // To Invoke callback block
    func invokeCallBackClosure() {
        if let callBack = callBackTargetClosure {
            callBack(self)
        }
    }
    
    // Touch inside action
    @objc private func clickOnClosureButton(_ sender: UIButton) {
        if let callBack = callBackTargetClosure {
            callBack(sender)
        }
    }
}
