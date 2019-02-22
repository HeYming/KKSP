//
//  LoginEmailViewController.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/10/29.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit

class LoginEmailViewController: BaseViewController {
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
    
    lazy var btn_register:UIButton = {
        let btn = UIButton();
        btn.set(frame: CGRect.zero, title:"註冊" , font: font_24, fontColor: UIColor.colorWithRGB(r: 204, g: 204, b: 204), state: .normal)
        btn.setTitleColor(UIColor.colorWithRGB(r: 1, g: 1, b: 1), for: .selected)
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    
    lazy var btn_login:UIButton = {
        let btn = UIButton();
        btn.set(frame: CGRect.zero, title:"登錄" , font: font_24, fontColor: UIColor.colorWithRGB(r: 204, g: 204, b: 204), state: .normal)
        btn.setTitleColor(UIColor.colorWithRGB(r: 1, g: 1, b: 1), for: .selected)
        btn.contentHorizontalAlignment = .left
        btn.isSelected = true
        return btn
    }()
    
    lazy var btn_pwShow:UIButton = {
        let btn = UIButton();
        btn.set(frame: CGRect.zero, title:"" , font: font_24, fontColor: UIColor.colorWithRGB(r: 204, g: 204, b: 204), state: .normal)
        btn.setImage(UIImage(named: "顯示"), for: .normal)
        btn.setImage(UIImage(named: "隱藏顯示"), for: .selected)
        btn.isSelected = true
        return btn
    }()
    
    lazy var btn_forget:UIButton = {
        let btn = UIButton();
        btn.set(frame: CGRect.zero, title:"忘記密碼？" , font: font_15, fontColor: UIColor.colorWithRGB(r: 204, g: 204, b: 204), state: .normal)
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    
    lazy var btn_LoginSubmit:UIButton = {
        let btn = UIButton();
        btn.set(frame: CGRect.zero, title:"下一步" , font: font_15, fontColor: UIColor.white, state: .normal)
        btn.backgroundColor = UIColor.colorWithRGB(r: 75, g: 166, b: 238)
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        btn.contentHorizontalAlignment = .center
        return btn
    }()
    
    lazy var txf_email:UITextField = {
        let txf = UITextField()
        txf.placeholder = "電子郵件地址"
        txf.font = font_15
        return txf
    }()
    
    lazy var img_email:UIImageView = {
        let imgV = UIImageView()
        imgV.backgroundColor = UIColor.colorWithRGB(r: 204, g: 204, b: 204)
        return imgV
    }()
    
    lazy var txf_pw:UITextField = {
        let txf = UITextField()
        txf.placeholder = "密碼（至少6位）"
        txf.font = font_15
        txf.isSecureTextEntry = true
        txf.clearButtonMode = .whileEditing
        return txf
    }()
    
    lazy var img_pw:UIImageView = {
        let imgV = UIImageView()
        imgV.backgroundColor = UIColor.colorWithRGB(r: 204, g: 204, b: 204)
        return imgV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createNaviView()
        self.createMainView()
    }
}

//View
extension LoginEmailViewController {
    func createNaviView() {
        navBar.wr_setBackgroundAlpha(alpha: 0)
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
        
        view_root.addSubview(btn_register)
        btn_register.snp.makeConstraints { (make) in
            make.left.equalTo(view_root).offset(34)
            make.top.equalTo(view_root.snp.top).offset(100)
            make.height.equalTo(30)
            make.width.equalTo(64)
        }
        btn_register.whenTapped {
            if (!self.btn_register.isSelected){
                self.updateMainView()
            }
        }
        
        let img_line = UIImageView()
        img_line.backgroundColor = UIColor.colorWithRGB(r: 204, g: 204, b: 204)
        view_root.addSubview(img_line)
        img_line.snp.makeConstraints { (make) in
            make.left.equalTo(btn_register.snp.right)
            make.top.equalTo(btn_register.snp.top).offset(10)
            make.height.equalTo(9)
            make.width.equalTo(0.5)
        }
        
        view_root.addSubview(btn_login)
        btn_login.snp.makeConstraints { (make) in
            make.left.equalTo(img_line).offset(17)
            make.top.equalTo(btn_register.snp.top)
            make.height.equalTo(30)
            make.width.equalTo(64)
        }
        btn_login.whenTapped {
            if (!self.btn_login.isSelected){
                self.updateMainView()
            }
        }
        
        view_root.addSubview(txf_email)
        txf_email.snp.makeConstraints { (make) in
            make.left.equalTo(btn_register.snp.left)
            make.top.equalTo(btn_login.snp.bottom).offset(40)
            make.height.equalTo(40)
            make.right.equalTo(view_root).offset(-50)
        }
        
        view_root.addSubview(img_email)
        img_email.snp.makeConstraints { (make) in
            make.left.equalTo(txf_email.snp.left)
            make.top.equalTo(txf_email.snp.bottom).offset(1)
            make.height.equalTo(0.5)
            make.width.equalTo(txf_email)
        }
        
        view_root.addSubview(txf_pw)
        txf_pw.delegate = self
        txf_pw.snp.makeConstraints { (make) in
            make.left.equalTo(txf_email.snp.left)
            make.top.equalTo(img_email.snp.bottom).offset(30)
            make.height.equalTo(40)
            make.right.equalTo(view_root).offset(-90)
        }
        
        view_root.addSubview(btn_pwShow)
        btn_pwShow.snp.makeConstraints { (make) in
            make.left.equalTo(txf_pw.snp.right).offset(16)
            make.top.equalTo(img_email.snp.bottom).offset(42)
            make.height.equalTo(16)
            make.width.equalTo(23)
        }
        btn_pwShow.whenTapped {
            self.btn_pwShow.isSelected = !self.btn_pwShow.isSelected
            if self.btn_pwShow.isSelected{
                let tempPwd = self.txf_pw.text
                self.txf_pw.text = ""
                self.txf_pw.isSecureTextEntry = false
                self.txf_pw.text = tempPwd
            }else{
                let tempPwd = self.txf_pw.text
                self.txf_pw.text = ""
                self.txf_pw.isSecureTextEntry = true
                self.txf_pw.text = tempPwd
            }
        }
        
        view_root.addSubview(img_pw)
        img_pw.snp.makeConstraints { (make) in
            make.left.equalTo(txf_pw.snp.left)
            make.top.equalTo(txf_pw.snp.bottom)
            make.height.equalTo(0.5)
            make.width.equalTo(img_email)
        }
        
        view_root.addSubview(btn_forget)
        btn_forget.snp.makeConstraints { (make) in
            make.left.equalTo(img_pw.snp.left)
            make.top.equalTo(img_pw.snp.bottom).offset(20)
            make.height.equalTo(36)
            make.width.equalTo(100)
        }
        btn_forget.whenTapped {
            let vc = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        view_root.addSubview(btn_LoginSubmit)
        btn_LoginSubmit.snp.makeConstraints { (make) in
            make.left.equalTo(btn_forget.snp.left)
            make.top.equalTo(btn_forget.snp.bottom).offset(100)
            make.height.equalTo(49)
            make.right.equalTo(view_root.snp.right).offset(-50)
        }
        btn_LoginSubmit.whenTapped {
            self.nextLogin()
        }
        
        view_root.snp.makeConstraints { (make) in
            make.bottom.equalTo(btn_LoginSubmit.snp.bottom).offset(50)
        }
        txf_pw.isHidden = false
        img_pw.isHidden = false
        btn_pwShow.isHidden = false
        btn_forget.isHidden = false
        btn_LoginSubmit.setTitle("登錄", for: .normal)
        
    }
    
    func updateMainView() {
        if (btn_register.isSelected) {
            txf_pw.isHidden = false
            img_pw.isHidden = false
            btn_pwShow.isHidden = false
            btn_forget.isHidden = false
            btn_LoginSubmit.setTitle("登錄", for: .normal)
        }else{
            txf_pw.isHidden = true
            img_pw.isHidden = true
            btn_pwShow.isHidden = true
            btn_forget.isHidden = true
            btn_LoginSubmit.setTitle("下一步", for: .normal)
        }
        btn_login.isSelected = btn_register.isSelected;
        btn_register.isSelected = !btn_register.isSelected;
        
    }
}


//Action
extension LoginEmailViewController {
    
    func nextLogin() {
        if txf_email.text?.count == 0 {
            hud.flash(.label("請輸入郵箱地址"), delay: 1.5)
            return
        }
        if btn_register.isSelected {
//            KKNewWorkHelper().PostRequestNetWork(url: RegisterSms, dic: NSMutableDictionary.init(dictionary: ["email":txf_email.text ?? ""]), success: { (json) in
//                let dic = json as! NSDictionary
//                if dic["status"] as? String ?? "" == "1" {
//                    self.hud.flash(.label("發送成功"), onView: self.view, delay: 1.5, completion: { (state) in
                        let vc = LoginEmainRegisterViewController()
                        vc.str_email = self.txf_email.text ?? ""
                        vc.type = 1
                        self.navigationController?.pushViewController(vc, animated: true)
//                    })
//                }else{
//                    self.hud.flash(.label(dic["msg"] as? String), delay: 1.5)
//                }
//            }) { (error) in
//                self.hud.flash(.label("網絡請求失敗"), delay: 1.5)
//            }
        }else{
            if txf_pw.text?.count == 0 {
                hud.flash(.label("請輸入密碼"), delay: 1.5)
                return
            }
            txf_email.resignFirstResponder()
            txf_pw.resignFirstResponder()
            KKNewWorkHelper().PostRequestNetWork(url:LoginOn, dic: NSMutableDictionary.init(dictionary:["email":txf_email.text ?? "","password":txf_pw.text ?? ""]), success: { (json) in
                let dic = json as! NSDictionary
                if dic["status"] as? String ?? "" == "1" {
                    self.userModel = UserModel.deserialize(from: dic["data"] as? NSDictionary)!
                    self.userModel.password = self.txf_pw.text
                    self.userModel.saveModel()
                    self.hud.flash(.labeledSuccess(title:"", subtitle:"登錄成功"), onView: self.view, delay: 1.5, completion: { (state) in
                        UIApplication.shared.delegate?.window??.set(rootViewController: BaseTabBarController())
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
extension LoginEmailViewController:UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let typeCasteToStringFirst = textField.text as NSString?
        let newString = typeCasteToStringFirst?.replacingCharacters(in: range, with: string)
        
        if newString == "" {
            btn_pwShow.isHidden = true
        }else{
            btn_pwShow.isHidden = false
        }
        return true
    }
    
}
