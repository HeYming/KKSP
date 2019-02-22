//
//  String+Extension.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/11/19.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit

extension String {
    public func md5String() -> String{
        let cStr = self.cString(using: String.Encoding.utf8);
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString();
        for i in 0 ..< 16{
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
}
