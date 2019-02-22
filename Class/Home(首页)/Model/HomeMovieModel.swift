//
//  HomeMovieModel.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/11/23.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit
import HandyJSON

class HomeMovieModel: HandyJSON {
    var title : String?
    var Id : Int?
    var localimg : String?
    var grade : String?
    var cover : String?
    
    required init() {}
}
