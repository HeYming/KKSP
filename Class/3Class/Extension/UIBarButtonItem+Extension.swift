//
//  UIBarButtonItem+Extension.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/10/22.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    public func itemWithImageName(imageName:String,highImageName:String,target:Any,action:Selector) -> UIBarButtonItem {
        let btn = UIButton();
        btn.setImage(UIImage.init(named: imageName), for: .normal)
        btn.setBackgroundImage(UIImage.init(named: highImageName), for: UIControl.State.highlighted)
        btn.adjustsImageWhenHighlighted = true
        btn.setSize(size: btn.currentBackgroundImage?.size ?? CGSize.zero)
        btn.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: btn)
    }
    
    
    
    
    
    
}
