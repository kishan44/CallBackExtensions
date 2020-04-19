//
//  UIGestureExtension.swift

import UIKit


extension UITapGestureRecognizer {
    
    // To access object
    struct Keys {
        static var tapClosure: UInt8 = 0
    }
    
    func callBackTarget(closure: @escaping GestureCallBackClosure) {
        callBackTargetClosure = closure
    }

    func invokeCallBackClosure() {
        if let callBack = callBackTargetClosure {
            callBack(self)
        }
    }

    private var callBackTargetClosure: GestureCallBackClosure? {
        get {
            return objc_getAssociatedObject(self, &Keys.tapClosure) as? GestureCallBackClosure
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &Keys.tapClosure, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                addTarget(self, action: #selector(tapOnView(_:)))
            }
        }
    }

    @objc private func tapOnView(_ sender: UITapGestureRecognizer) {
        if let callBack = callBackTargetClosure {
            callBack(sender)
        }
    }
}
