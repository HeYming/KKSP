//
//  BaseConfig.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/10/22.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit
import SnapKit
//frame
let Screen_Width = Int(UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width)
let ScreenH_Height = Int(UIScreen.main.bounds.size.height > UIScreen.main.bounds.size.width ? UIScreen.main.bounds.size.height : UIScreen.main.bounds.size.width)

let SafeStateBarHeight = isFullScreen ? 44 : 20
let SafeBottomHeight = isFullScreen ? 34 : 0
let SafeNaviBarHeight = isFullScreen ? 88 : 64

var isFullScreen: Bool {
    if #available(iOS 11, *) {
        guard let w = UIApplication.shared.delegate?.window, let unwrapedWindow = w else {
            return false
        }
        if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
            print(unwrapedWindow.safeAreaInsets)
            return true
        }
    }
    return false
}



//font
let font_12 = UIFont.systemFont(ofSize: 12)
let font_13 = UIFont.systemFont(ofSize: 13)
let font_14 = UIFont.systemFont(ofSize: 14)
let font_15 = UIFont.systemFont(ofSize: 15)
let font_16 = UIFont.systemFont(ofSize: 16)
let font_17 = UIFont.systemFont(ofSize: 17)
let font_18 = UIFont.systemFont(ofSize: 18)
let font_20 = UIFont.systemFont(ofSize: 20)
let font_24 = UIFont.systemFont(ofSize: 24)
let font_40 = UIFont.systemFont(ofSize: 40)


//system
//设备的token
let Devicetoken = "Devicetoken"
//是否审核版本
let Check = "check"
//Url状态
let UrlState = "UrlState"
