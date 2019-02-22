//
//  BaseTabBarController.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/10/17.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class BaseTabBarController: ESTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let v1 = BaseNavigationController.init(rootViewController: HomePageViewController())
        let v2 = BaseNavigationController.init(rootViewController:ClassifyPageViewController())
        let v3 = BaseNavigationController.init(rootViewController:VIPPageViewController())
        let v4 = BaseNavigationController.init(rootViewController:MinePageViewController())
        
        v1.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "首页"), selectedImage: UIImage(named: "首页_selected"))
        v2.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "分类"), selectedImage: UIImage(named: "分类_selected"))
        v3.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "VIP"), selectedImage: UIImage(named: "VIP_selected"))
        v4.tabBarItem = UITabBarItem.init(title: nil, image: UIImage(named: "我的"), selectedImage: UIImage(named: "我的_selected"))
        
        self.tabBar.shadowImage = nil
        self.tabBar.backgroundImage = UIImage()
        self.viewControllers = [v1, v2, v3, v4]
    }
    

}

