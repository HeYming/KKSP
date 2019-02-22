//
//  UIView+Category.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/18.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import Foundation
import UIKit

private var loadingAnimationKey = "loadingAnimationKey"


extension UIView {
    //  MARK:   -   渐变色
    /// 水平渐变色, 左 ---> 右
    open func gradientLayerHorizontal(_ startColor: UIColor, _ endColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.layer.bounds
        
        //  分段设置渐变色
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.cornerRadius = self.layer.cornerRadius
        
        self.layer .insertSublayer(gradientLayer, at: 0)
    }
    
    
    //  MARK:   -   获取当前view的Controller
    func getCurrentController() -> UIViewController {
        var next = self.next
        while next != nil {
            if (next?.isKind(of: UIViewController.classForCoder()))! {
                return (next as? UIViewController)!
            }
            next = next?.next
        }
        return UIViewController()
    }
    
    //  MAKR:   - 根据字符串寻找子view
    func subViewOfClassName(_ className: String) -> UIView? {
        for subView: UIView in self.subviews {
            
            let viewType = String(describing: type(of: subView))
//            LogOut("\(viewType)")
            if viewType == className {
                return subView
            }
            
            let resFound = subView.subViewOfClassName(className)
            if resFound != nil {
                return resFound
            }
        }
        return nil
    }
    
    func setSize(size:CGSize) {
        var frame = self.frame
        frame.size = size
        self.frame = frame
    }
    
    public func KW()-> CGFloat {
        return self.frame.width
    }
    
    public func KH()-> CGFloat {
        return self.frame.height
    }
    
    public func KX()-> CGFloat {
        return self.frame.origin.x
    }
    
    public func KY()-> CGFloat {
        return self.frame.origin.y
    }
    
    
    
}
