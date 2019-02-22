//
//  BaseViewController.swift
//  KKSP
//
//  Created by 李荣贵 on 2018/10/11.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit
import PKHUD

class BaseViewController: UIViewController,UIScrollViewDelegate {
    lazy var navBar = WRCustomNavigationBar.CustomNavigationBar()
    let hud = HUD.self
    var userModel : UserModel = {
        var model = UserModel()
        model.readModel()
        return model;
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setupNavBar()
        navigationController?.navigationBar.isHidden = true
        automaticallyAdjustsScrollViewInsets = false
    }
    
    fileprivate func setupNavBar()
    {
        view.addSubview(navBar)
        // 设置自定义导航栏背景图片
        navBar.barBackgroundImage = UIImage(named: "millcolorGrad")
        // 设置自定义导航栏背景颜色
        // navBar.backgroundColor = MainNavBarColor
        // 设置自定义导航栏标题颜色
        navBar.titleLabelColor = .white
        // 设置自定义导航栏左右按钮字体颜色
        navBar.wr_setTintColor(color: .white)
        
        if self.navigationController?.children.count != 1 {
            navBar.wr_setLeftButton(title: "<<", titleColor: UIColor.white)
        }
    }
    
    @objc fileprivate func back()
    {
        _ = navigationController?.popViewController(animated: true)
    }
    
    public func popVC () {
        self.navigationController?.popViewController(animated: true)
    }
    
    //关闭键盘
    public func CloseKeyBoard(){
        self.view.endEditing(true)
    }
    
}
