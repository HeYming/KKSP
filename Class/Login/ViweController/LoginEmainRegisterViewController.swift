//
//  LoginEmainRegisterViewController.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/11/21.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit

class LoginEmainRegisterViewController: BaseViewController {
    var str_email = ""
    //1 註冊 2 找回密碼 3 修改密碼
    var type : Int = 1
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
    
    lazy var lab_Email:UILabel = {
        let lab = UILabel()
        lab.set(frame: CGRect.zero, font: font_24, textColor: .black, alignment: .left, backgoundColor: .clear)
        lab.numberOfLines = 2
        return lab
    }()
    
    lazy var txf_code:UITextField = {
        let txf = UITextField()
        txf.set(frame: CGRect.zero, font: font_15, textColor: .black, alignment: .left, backgoundColor: .clear)
        txf.placeholder = "輸入驗證碼"
        return txf
    }()
    
    lazy var img_code:UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.colorWithRGB(r: 204, g: 204, b: 204)
        return img
    }()
    
    lazy var txf_pw:UITextField = {
        let txf = UITextField()
        txf.set(frame: CGRect.zero, font: font_15, textColor: .black, alignment: .left, backgoundColor: .clear)
        txf.placeholder = "輸入密碼（至少6位）"
        txf.isSecureTextEntry = true
        txf.clearButtonMode = .whileEditing
        return txf
    }()
    
    lazy var img_pw:UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.colorWithRGB(r: 204, g: 204, b: 204)
        return img
    }()
    
    lazy var btn_code:UIButton = {
        let btn = UIButton()
        btn.set(frame: CGRect.zero, title: "重新發送", font: font_15, fontColor: UIColor.colorWithRGB(r: 75, g: 166, b: 238), state: .normal)
        return btn
    }()
    
    lazy var btn_LoginSubmit:UIButton = {
        let btn = UIButton()
        btn.set(frame: CGRect.zero, title: "註冊", font: font_15, fontColor: UIColor.white, state: .normal)
        btn.backgroundColor = UIColor.colorWithRGB(r: 75, g: 166, b: 238)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        return btn
    }()
    
    var timer = Timer()
    var verificationCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createNaviView()
        if type == 3 {
            str_email = self.userModel.account ?? str_email
        }
        self.createMainView()
        if type == 3 {
            self.againGetCode()
        }
        if type == 1{
            self.StateTimer()
        }
    }

}

//View
extension LoginEmainRegisterViewController {
    func createNaviView() {
        navBar.wr_setBackgroundAlpha(alpha: 0)
    }
    
    func createMainView() {
        self.view.addSubview(scr_view)
        scr_view.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(SafeStateBarHeight)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-(50+SafeBottomHeight))
        }
        
        scr_view.addSubview(view_root)
        view_root.snp.makeConstraints { (make) in
            make.edges.equalTo(scr_view)
            make.width.equalTo(scr_view)
        }
        
        let closeBtn = UIButton(type: .custom)
        closeBtn.frame = CGRect(x: 10, y: SafeStateBarHeight+20, width: 30, height: 30);
        closeBtn.setImage(UIImage(named: "返回"), for: .normal)
        closeBtn.whenTapped {
            self.popVC()
        }
        view_root.addSubview(closeBtn)
        closeBtn.snp.makeConstraints { (make) in
            make.left.equalTo(view_root).offset(10)
            make.top.equalTo(view_root).offset(20)
            make.width.height.equalTo(30)
        }
        
        view_root.addSubview(lab_Email)
        lab_Email.text = "驗證碼已經發送至\(str_email)"
        lab_Email.snp.makeConstraints { (make) in
            make.left.equalTo(view_root).offset(34)
            make.top.equalTo(view_root.snp.top).offset(100)
            make.height.equalTo(70)
            make.right.equalTo(view_root).offset(-34)
        }
        
        view_root.addSubview(txf_code)
        txf_code.snp.makeConstraints { (make) in
            make.left.equalTo(lab_Email.snp.left)
            make.top.equalTo(lab_Email.snp.bottom).offset(40)
            make.height.equalTo(40)
            make.right.equalTo(view_root).offset(-150)
        }
        
        view_root.addSubview(img_code)
        img_code.snp.makeConstraints { (make) in
            make.left.equalTo(txf_code.snp.left)
            make.top.equalTo(txf_code.snp.bottom).offset(1)
            make.height.equalTo(0.5)
            make.right.equalTo(view_root.snp.right).offset(-50)
        }
        
        view_root.addSubview(btn_code)
        btn_code.snp.makeConstraints { (make) in
            make.left.equalTo(txf_code.snp.right).offset(16)
            make.top.equalTo(txf_code.snp.top)
            make.height.equalTo(40)
            make.width.equalTo(100)
        }
        btn_code.whenTapped {
            if self.btn_code.titleLabel?.text == "重新發送" {
                self.againGetCode()
            }
        }
        
        view_root.addSubview(txf_pw)
        txf_pw.snp.makeConstraints { (make) in
            make.left.equalTo(txf_code.snp.left)
            make.top.equalTo(img_code.snp.bottom).offset(30)
            make.height.equalTo(40)
            make.right.equalTo(view_root).offset(-30)
        }
        
        view_root.addSubview(img_pw)
        img_pw.snp.makeConstraints { (make) in
            make.left.equalTo(txf_pw.snp.left)
            make.top.equalTo(txf_pw.snp.bottom).offset(1)
            make.height.equalTo(0.5)
            make.right.equalTo(view_root.snp.right).offset(-50)
        }
        
        view_root.addSubview(btn_LoginSubmit)
        if type == 2 || type == 3 {
            btn_LoginSubmit.setTitle("提交", for: .normal)
        }
        btn_LoginSubmit.snp.makeConstraints { (make) in
            make.left.equalTo(img_pw.snp.left)
            make.top.equalTo(img_pw.snp.bottom).offset(100)
            make.height.equalTo(49)
            make.right.equalTo(view_root.snp.right).offset(-50)
        }
        btn_LoginSubmit.whenTapped {
            self.nextRegister()
        }
        
        view_root.snp.makeConstraints { (make) in
            make.bottom.equalTo(btn_LoginSubmit.snp.bottom).offset(50)
        }
    }
}

//Func
extension LoginEmainRegisterViewController {
    @objc func registerMinCount() {
        self.verificationCount = self.verificationCount-1
        self.btn_code.setTitle("\(self.verificationCount)", for: .normal)
        if self.verificationCount<=0 {
            timer.invalidate()
            self.verificationCount = 60
            self.btn_code.setTitle("重新發送", for: .normal)
            self.btn_code.isUserInteractionEnabled = true
            self.btn_code.setTitleColor(UIColor.colorWithRGB(r: 75, g: 166, b: 238), for: .normal)
        }
    }
    
    func StateTimer(){
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.registerMinCount), userInfo: nil, repeats: true);
        self.btn_code.isUserInteractionEnabled = false
        self.btn_code.setTitleColor(UIColor.colorWithRGB(r: 187, g: 187, b: 187), for: .normal)
        self.verificationCount = 60;
        self.timer.fire()
    }
}

//Action
extension LoginEmainRegisterViewController {
    //发送验证码
    func againGetCode() {
        KKNewWorkHelper().PostRequestNetWork(url: RegisterSms, dic: NSMutableDictionary.init(dictionary: ["email":str_email ]), success: { (json) in
            let dic = json as! NSDictionary
            if dic["status"] as? String ?? "" == "1" {
                self.hud.flash(.label("發送成功"), onView: self.view, delay: 1.5, completion: { (state) in
                    self.StateTimer()
                })
            }else{
                self.hud.flash(.label(dic["msg"] as? String), delay: 1.5)
            }
        }) { (error) in
            self.hud.flash(.label("網絡請求失敗"), delay: 1.5)
        }
    }
    
    //注册按钮
    func nextRegister() {
        if txf_code.text?.count == 0 {
            self.hud.flash(.label("請輸入驗證碼"), delay: 1.5)
            return
        }
        if txf_pw.text?.count == 0{
            self.hud.flash(.label("請輸入密碼"), delay: 1.5)
            return
        }
        if txf_pw.text?.count ?? 0 < 6 {
            self.hud.flash(.label("密碼至少6位"), delay: 1.5)
            return
        }
        let token = UserDefaults.standard.string(forKey: Devicetoken)
        if type == 1 {
            self.hud.flash(.labeledProgress(title: "", subtitle: "加載中"))
            KKNewWorkHelper().PostRequestNetWork(url: RegisterOn, dic: NSMutableDictionary.init(dictionary: ["email":str_email,"password":txf_pw.text ?? "","code":txf_code.text ?? "","device_str":token ?? ""]), success: { (json) in
                let dic = json as! NSDictionary
                if dic["status"] as? String ?? "" == "1" {
                    KKNewWorkHelper().PostRequestNetWork(url:LoginOn, dic: NSMutableDictionary.init(dictionary:["email":self.str_email ,"password":self.txf_pw.text ?? ""]), success: { (json) in
                        let dic = json as! NSDictionary
                        if dic["status"] as? String ?? "" == "1" {
                            self.userModel = UserModel.deserialize(from: dic["data"] as? NSDictionary)!
                            self.userModel.password = self.txf_pw.text
                            self.userModel.saveModel()
                            self.hud.flash(.labeledSuccess(title:"", subtitle:"註冊成功"), onView: self.view, delay: 1.5, completion: { (state) in
                                UIApplication.shared.delegate?.window??.set(rootViewController: BaseTabBarController())
                            })
                        }else{
                            self.hud.flash(.label(dic["msg"] as? String), delay: 1.5)
                        }
                    }) { (error) in
                        self.hud.flash(.label("網絡請求失敗"), delay: 1.5)
                    }
                }else{
                    self.hud.flash(.label(dic["msg"] as? String), delay: 1.5)
                }
            }) { (error) in
                self.hud.flash(.label("網絡請求失敗"), delay: 1.5)
            }
        } else if (type == 3) {
            KKNewWorkHelper().PostRequestNetWork(url:RegisterRevise, dic: NSMutableDictionary.init(dictionary:["uid":self.userModel.id ?? "","password":self.txf_pw.text ?? "","code":txf_code.text ?? ""]), success: { (json) in
                let dic = json as! NSDictionary
                if dic["status"] as? String ?? "" == "1" {
                    self.userModel.password = self.txf_pw.text
                    self.userModel.saveModel()
                    self.hud.flash(.labeledSuccess(title:"", subtitle:"註冊成功"), onView: self.view, delay: 1.5, completion: { (state) in
                        UIApplication.shared.delegate?.window??.rootViewController = BaseTabBarController()
                    })
                }else{
                    self.hud.flash(.label(dic["msg"] as? String), delay: 1.5)
                }
            }) { (error) in
                self.hud.flash(.label("網絡請求失敗"), delay: 1.5)
            }
        } else {
            KKNewWorkHelper().PostRequestNetWork(url:RegisterReset, dic: NSMutableDictionary.init(dictionary:["email":self.str_email,"password":self.txf_pw.text ?? "","code":txf_code.text ?? ""]), success: { (json) in
                let dic = json as! NSDictionary
                if dic["status"] as? String ?? "" == "1" {
                    self.userModel.password = self.txf_pw.text
                    self.userModel.saveModel()
                    self.hud.flash(.labeledSuccess(title:"", subtitle:"修改成功"), onView: self.view, delay: 1.5, completion: { (state) in
                        UIApplication.shared.delegate?.window??.rootViewController = BaseTabBarController()
                    })
                }else{
                    self.hud.flash(.label(dic["msg"] as? String), delay: 1.5)
                }
            }) { (error) in
                self.hud.flash(.label("網絡請求失敗"), delay: 1.5)
            }
        }
    }
}

//Delegate
extension LoginEmainRegisterViewController {
    
}

