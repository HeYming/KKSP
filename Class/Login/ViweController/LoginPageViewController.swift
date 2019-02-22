//
//  LoginPageViewController.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/10/23.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit


class LoginPageViewController: BaseViewController {
    lazy var scr_view:UIScrollView = {
        let scr = UIScrollView()
        scr.showsVerticalScrollIndicator = false;
        scr.isScrollEnabled = true;
        scr.delegate = self;
        return scr
    }()
    
    lazy var view_root:UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createNaviView()
        self.createMainView()
    }
}

//View
extension LoginPageViewController {
    func createNaviView() {
        navBar.wr_setBackgroundAlpha(alpha: 0)
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = false
    }
    
    func createMainView() {
        self.view.addSubview(scr_view)
        scr_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(SafeStateBarHeight)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.snp.bottom).offset(-(50+SafeBottomHeight))
        }
        scr_view.addSubview(view_root)
        
        view_root.snp.makeConstraints { (make) in
            make.edges.equalTo(self.scr_view)
            make.width.equalTo(self.scr_view)
        }
        
        let btn_close = UIButton(type: .custom)
        btn_close.frame = CGRect(x: 10, y: SafeStateBarHeight+20, width: 30, height: 30)
        btn_close.setImage(UIImage(named: "關閉"), for: .normal)
        btn_close.whenTapped {
            self.dismiss(animated: true, completion: nil)
        }
        view_root.addSubview(btn_close);
        btn_close.snp.makeConstraints { (make) in
            make.left.equalTo(view_root).offset(10)
            make.top.equalTo(view_root).offset(20)
            make.width.height.equalTo(30)
        }
        
        let lab_login = UILabel.init()
        lab_login.set(frame: CGRect(x: 0, y: 100+SafeStateBarHeight, width: Screen_Width, height: 50), font: font_40, textColor: UIColor.black, alignment: .center, backgoundColor: UIColor.clear)
        lab_login.text = "登錄"
        view_root.addSubview(lab_login)
        lab_login.snp.makeConstraints { (make) in
            make.left.equalTo(view_root)
            make.right.equalTo(view_root)
            make.top.equalTo(btn_close.snp.bottom).offset(50)
            make.height.equalTo(50)
        }
        
        let view_email = self.createBtnView(image: UIImage(named: "mail") ?? UIImage(), title: "使用電子郵件")
        view_email.backgroundColor = UIColor.colorWithRGB(r: 51, g: 51, b: 51)
        view_root.addSubview(view_email)
        view_email.snp.makeConstraints { (make) in
            make.left.equalTo(view_root).offset(50)
            make.right.equalTo(view_root).offset(-50)
            make.top.equalTo(lab_login.snp.bottom).offset(50)
            make.height.equalTo(49)
        }
        view_email.whenTapped {
            let vc = LoginEmailViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
//        let view_facebook = self.createBtnView(image: UIImage.init(named: "Facebook") ?? UIImage(), title: "Facebook")
//        view_facebook.backgroundColor = UIColor.init(red: 57, green: 89, blue: 159, alpha: 1)
//        view_root.addSubview(view_facebook)
//        view_facebook.snp.makeConstraints { (make) in
//            make.left.equalTo(view_root).offset(50)
//            make.right.equalTo(view_root).offset(-50)
//            make.top.equalTo(view_email.snp.bottom).offset(50)
//            make.height.equalTo(49)
//        }
//        view_facebook.whenTapped {
//            //        FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] initWithFrame:CGRectMake(-BMFScreenWidth, -BMFScreenHeight, 0, 0)];
//            //        loginButton.readPermissions = @[@"public_profile", @"email"];
//            //        loginButton.delegate = self;
//            //        [loginButton sendActionsForControlEvents:UIControlEventTouchUpInside];
//        }
        let view_google = self.createBtnView(image: UIImage(named: "google") ?? UIImage(), title: "Google")
        view_google.backgroundColor = UIColor.colorWithRGB(r: 237, g: 238, b: 243)
        view_root.addSubview(view_google)
        view_google.snp.makeConstraints { (make) in
            make.left.equalTo(view_root).offset(50)
            make.right.equalTo(view_root).offset(-50)
            make.top.equalTo(view_email.snp.bottom).offset(50)
            make.height.equalTo(49)
        }
//        [GIDSignIn sharedInstance].clientID = @"610358636061-fkjeid5m09lg89uen227dlpbt3v3cerq.apps.googleusercontent.com";
//        [GIDSignIn sharedInstance].uiDelegate = self;
//        [GIDSignIn sharedInstance].delegate = self;
//        [google bk_whenTapped:^{
//            [[GIDSignIn sharedInstance] signOut];
//            [[GIDSignIn sharedInstance] signIn];
//            }];
//        let view_weibo = self.createBtnView(image: UIImage(named: "weibo") ?? UIImage(), title: "微博")
//        view_weibo.backgroundColor = UIColor.colorWithRGB(r: 255, g: 216, b: 121)
//        view_root.addSubview(view_weibo)
//        view_weibo.snp.makeConstraints { (make) in
//            make.left.equalTo(view_root).offset(50)
//            make.right.equalTo(view_root).offset(-50)
//            make.top.equalTo(view_google.snp.bottom).offset(50)
//            make.height.equalTo(49)
//        }
//
//        let view_weixin = self.createBtnView(image: UIImage(named: "weixin") ?? UIImage(), title: "微信")
//        view_weixin.backgroundColor = UIColor.colorWithRGB(r: 91, g: 185, b: 107)
//        view_root.addSubview(view_weixin)
//        view_weixin.snp.makeConstraints { (make) in
//            make.left.equalTo(view_root).offset(50)
//            make.right.equalTo(view_root).offset(-50)
//            make.top.equalTo(view_weixin.snp.bottom).offset(50)
//            make.height.equalTo(49)
//        }
        
        view_root.snp.makeConstraints { (make) in
            make.bottom.equalTo(view_google.snp.bottom)
        }
        
    }
}


//Action
extension LoginPageViewController {
    //创建按钮视图
    func createBtnView(image:UIImage,title:String) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Screen_Width-100, height: 49))
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        img.center = CGPoint(x: 33, y: 24.5)
        img.image = image
        view.addSubview(img)
        
        let lab = UILabel()
        lab.set(frame: CGRect(x: 0, y: 0, width: Screen_Width-100, height: 49), font: font_15, textColor: UIColor.white, alignment: .center, backgoundColor: .clear)
        lab.text = title
        view.addSubview(lab)
        
        if title == "微博" || title == "Google" {
            lab.textColor = .black
        }
        return view
    }
    
}

//Delegate
extension LoginPageViewController {
    
}


