//
//  UILable+Extension.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/10/24.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit

extension UILabel {

    func set(frame:CGRect,font:UIFont,textColor:UIColor,alignment:NSTextAlignment,backgoundColor:UIColor) {
        self.frame = frame
        self.backgroundColor = backgoundColor
        self.textColor = textColor
        self.textAlignment = alignment
        self.font = font
    }
    

}
