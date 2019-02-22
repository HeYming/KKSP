//
//  HomePageViewController.swift
//  KKSP
//
//  Created by 李荣贵 on 2018/10/12.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit

class HomePageViewController: BaseViewController {
    
    lazy var tableView: UITableView = {
        let tbv = UITableView()
        tbv.delegate = self
        tbv.dataSource = self
        return tbv
    }()
    
    var isCheak = false
    //子数组集合
    var muarr_Teleplay = NSMutableArray()
    var muarr_Movie = NSMutableArray()
    var muarr_Cartoon = NSMutableArray()
    var muarr_Variety = NSMutableArray()
    //正式显示数组集合
    var muarr_Data = NSMutableArray()
    //审核数组显示集合
    var muarr_Check = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.createNavBar()
        self.requestVersion()
    }
}

//View
extension HomePageViewController {
    func createNavBar() {
        navBar.layer.masksToBounds = true
        navBar.wr_setRightButton(image: UIImage(named: "历史") ?? UIImage())
        navBar.onClickRightButton = {
            self.History_Click()
        }
        
        let lab_left = UILabel()
        lab_left.set(frame: CGRect(x: 15, y: SafeStateBarHeight, width: 100, height: 44), font: font_20, textColor: .black, alignment: .left, backgoundColor: .clear)
        lab_left.text = "首頁"
        navBar.addSubview(lab_left)
        
        let view_title = UIView.init(frame: CGRect(x: Screen_Width-244, y: SafeStateBarHeight+6, width: 200, height: 32))
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect(x: view_title.KW()-100, y: 0, width: 100, height: 32)
        btn.layer.cornerRadius = 16
        btn.layer.backgroundColor = UIColor.colorWithRGB(r:237,g:238,b:243).cgColor
        btn.setTitle(" 搜索", for: .normal)
        btn.setTitleColor(UIColor.colorWithHex(hex: 0xcccccc), for: .normal)
        btn.titleLabel?.font = font_15
        btn.setImage(UIImage(named: "搜索_搜索框"), for: .normal)
        btn.whenTapped {
            
        }
        view_title .addSubview(btn)
        navBar.addSubview(view_title)
    }
}

//Func
extension HomePageViewController {
    //获取版本
    func requestVersion() {
        KKNewWorkHelper().GetRequestNetWork(url: VersionCheck, dic: NSMutableDictionary(), success: { (json) in
            let dic = json as! NSDictionary
            if dic["status"] as? String ?? "" == "0" {
                let alert = UIAlertController(title:"提示", message:dic["msg"] as? String, preferredStyle: .alert)
                let action = UIAlertAction(title: "確定", style: .default, handler: { (action) in
                    UIApplication.shared.openURL(URL(string: "itms-apps://itunes.apple.com/cn/app/id1436941235?mt=8")!)
                })
                let action2 = UIAlertAction(title: "取消", style: .default, handler: { (action) in
                })
                alert.addAction(action)
                alert.addAction(action2)
                self.present(alert, animated: true, completion: nil)
            }
            let data = dic["data"] as? NSDictionary
            if data?["status"] as? String ?? "1" == "0" {
                self.isCheak = true
                UserDefaults.standard.set("1", forKey: Check)
                self.requestCheckBanner()
            }else{
                UserDefaults.standard.set("0", forKey: Check)
                self.requestListData()
            }
        }) { (error) in
            if UserDefaults.standard.integer(forKey: UrlState) == 1 {
                UserDefaults.standard.set(0, forKey: UrlState)
            }else{
                UserDefaults.standard.set(1, forKey: UrlState)
            }
            self.hud.flash(.label("網絡請求失敗"), delay: 1.5)
        }
    }
    
    //请求审核banner图
    func requestCheckBanner() {
        KKNewWorkHelper().GetRequestNetWork(url: To_Examine_Banner, dic: NSMutableDictionary(dictionary: ["type":"1"]), success: { (json) in
            let dic = json as! NSDictionary
            let muarr = NSMutableArray()
            if dic["status"] as? String ?? "" == "1" {
                let data = dic["data"] as? NSArray
                if let data = data {
                    for a in 0..<data.count {
                        muarr.add(HomeBannerModel.deserialize(from: data[a] as? NSDictionary) as Any)
                    }
                }
                
                
            }else{
                self.hud.flash(.label(dic["msg"] as? String), delay: 1.5)
            }
        }) { (error) in
            self.hud.flash(.label("網絡請求失敗"), delay: 1.5)
        }
        
        KKNewWorkHelper().GetRequestNetWork(url: To_Examine_Video, dic: NSMutableDictionary(dictionary: ["is_vip":"0"]), success: { (json) in
            let dic = json as! NSDictionary
            if dic["status"] as? String ?? "" == "1" {
                let data = dic["data"] as? NSArray
                if let data = data {
                    for a in 0..<data.count {
                        self.muarr_Check.add(HomeMovieModel.deserialize(from: data[a] as? NSDictionary) as Any)
                    }
                }
                self.tableView.reloadData()
            }else{
                self.hud.flash(.label(dic["msg"] as? String), delay: 1.5)
            }
        }) { (error) in
            self.hud.flash(.label("網絡請求失敗"), delay: 1.5)
        }
        
        
    }
    
    func requestListData() {
        KKNewWorkHelper().GetRequestNetWork(url: VersionCheck, dic: NSMutableDictionary(), success: { (json) in
            let dic = json as! NSDictionary
            if dic["status"] as? String ?? "" == "1" {
                
            }else{
                self.hud.flash(.label(dic["msg"] as? String), delay: 1.5)
            }
        }) { (error) in
            self.hud.flash(.label("網絡請求失敗"), delay: 1.5)
        }
    }
    
    //data
    
}

//Action
extension HomePageViewController {
    @objc func History_Click(){
        
    }
}

//Delegate
extension HomePageViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isCheak {
            return 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(ScreenH_Height-SafeNaviBarHeight-SafeBottomHeight-200)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
