//
//  HomeBannerView.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/11/23.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit

class HomeBannerView: UIView {

    var arr_Data = NSArray()
    var col_View : UICollectionView = {
        let col = UICollectionView()
        return col
    }()
    //
    var view_Name : UIView = {
        let view = UIView()
        return view
    }()
    
    var page_Control : UIPageControl = {
        let page = UIPageControl()
        return page
    }()
    
    override func layoutSubviews() {
        
    }
    
}
