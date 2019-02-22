//
//  UserModel.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/11/20.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit
import HandyJSON

class UserModel: HandyJSON {
    var account : String?
    var cumulative : Int?
    var icon : String?
    var id : Int?
    var is_vip : Bool?
    var nickname : String?
    var sex : Int?
    var sys_id : String?
    var vip_end : String?
    var vip_level : Int?
    var vip_start : Int?
    var password : String?
    required init() {}
    
    public func saveModel() {
        let ud = UserDefaults.standard
        ud.set(self.account, forKey: "account")
        ud.set(self.cumulative, forKey: "cumulative")
        ud.set(self.icon, forKey: "icon")
        ud.set(self.id, forKey: "id")
        ud.set(self.is_vip, forKey: "is_vip")
        ud.set(self.nickname, forKey: "nickname")
        ud.set(self.sex, forKey: "sex")
        ud.set(self.sys_id, forKey: "sys_id")
        ud.set(self.vip_end, forKey: "vip_end")
        ud.set(self.vip_level, forKey: "vip_level")
        ud.set(self.vip_start, forKey: "vip_start")
        ud.set(self.password, forKey: "password")
    }
    
    public func readModel() {
        let ud = UserDefaults.standard
        self.account = ud.string(forKey: "account")
        self.cumulative = ud.integer(forKey: "cumulative")
        self.icon = ud.string(forKey: "icon")
        self.id = ud.integer(forKey: "id")
        self.is_vip = ud.bool(forKey: "is_vip")
        self.nickname = ud.string(forKey: "nickname")
        self.sex = ud.integer(forKey: "sex")
        self.sys_id = ud.string(forKey: "sys_id")
        self.vip_end = ud.string(forKey: "vip_end")
        self.vip_level = ud.integer(forKey: "vip_level")
        self.vip_start = ud.integer(forKey: "vip_start")
        self.password = ud.string(forKey: "password")
    }

}

