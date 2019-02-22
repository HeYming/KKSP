//
//  UIButton+Extension.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/23.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import Foundation
import UIKit

private var clickIntervalKey = "clickIntervalKey"

extension UIButton {
    var clickInterval: NSNumber? {
        set {
            objc_setAssociatedObject(self, &clickIntervalKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &clickIntervalKey) as? NSNumber
        }
    }
    
    open override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        self.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + (clickInterval?.doubleValue != nil ? (clickInterval?.doubleValue)! : 0.5)) {
            self.isUserInteractionEnabled = true
        }
        super.sendAction(action, to: target, for: event)
    }
    
    //视图扩展
    public func set(frame:CGRect,title:String,font:UIFont,fontColor:UIColor,state:UIControl.State) {
        self.frame = frame;
        self.setTitle(title, for: state)
        self.setTitleColor(fontColor, for: state)
        self.titleLabel?.font = font
    }
    
    
}

