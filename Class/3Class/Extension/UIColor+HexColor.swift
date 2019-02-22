//
//  UIColor+HexColor.swift
//  O-trialPro-Swift
//
//  Created by ligen on 2018/5/8.
//  Copyright © 2018年 oceanus. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    
    static func colorWithHex(hex : Int) -> UIColor {
        return UIColor.colorWithHex(hex: hex, alpha: 1)
    }
    
    static func colorWithHex(hex : Int , alpha : CGFloat) -> UIColor{
        return UIColor.init(red: CGFloat((hex >> 16) & 0xFF)/255.0 , green: CGFloat((hex >> 8) & 0xFF)/255.0 , blue: CGFloat(hex & 0xFF)/255.0 , alpha: alpha)
    }
    
    static func colorWithRGBA(r:Float,g:Float,b:Float,alpha:Float) -> UIColor{
        return UIColor.init(red: CGFloat(r/255), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: CGFloat(alpha))
    }
    
    static func colorWithRGB(r:Float,g:Float,b:Float) -> UIColor{
        return colorWithRGBA(r: r, g: g, b: b, alpha: 1)
    }
    
    convenience init?(hex: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        
        let hex = hex.replacingOccurrences(of: "^#", with: "", options: .regularExpression)
        guard let hexValue = UInt64(hex, radix: 16) else {
            print("invalid hex string")
            return nil
        }
        
        switch (hex.count) {
        case 3:
            red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
            green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
            blue  = CGFloat(hexValue & 0x00F)              / 15.0
        case 4:
            red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
            green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
            blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
            alpha = CGFloat(hexValue & 0x000F)             / 15.0
        case 6:
            red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
            green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
            blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
        case 8:
            red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
            green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
            blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
            alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
        default:
            print("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
            return nil
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


extension String{
    
    
    /// 将十六进制颜色转伟UIColor
    /// - Returns: UIColor
    public func toUIColor() -> UIColor {
        //处理数值
        var cString = self.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        let length = (cString as NSString).length
        //错误处理
        if (length < 6 || length > 8 || (!cString.hasPrefix("#") && length == 7) || (!cString.hasPrefix("0X") && length == 8)){
            return UIColor.white
        }
        
        if cString.hasPrefix("#"){
            cString = (cString as NSString).substring(from: 1)
        }
        
        if cString.hasPrefix("0x") {
            cString = (cString as NSString).substring(from: 2)
        }
        
        
        
        //字符chuan截取
        var range = NSRange()
        range.location = 0
        range.length = 2
        
        let rString = (cString as NSString).substring(with: range)
        
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        //存储转换后的数值
        var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0
        //进行转换
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        //根据颜色值创建UIColor
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
    
    
    
    
    
    
}


