//
//  BaseNavigationController.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/10/18.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.tintColor =  UIColor.black
        self.navigationBar.barTintColor = UIColor.white
        
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
    }
    

}


extension BaseNavigationController
{
    override func pushViewController(_ viewController: UIViewController, animated: Bool)
    {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
