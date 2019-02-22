//
//  HomeBannerModel.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/11/23.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit
import HandyJSON

class HomeBannerModel: HandyJSON {
    
    var cover : String?
    var id : Int?
    var link_type : Int?
    var position : Int?
    var sort : Int?
    var video_id : Int?
    var title : String?
    
    required init() {}
}
