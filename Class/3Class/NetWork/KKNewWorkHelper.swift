//
//  KKNewWorkHelper.swift
//  KKSP
//
//  Created by 贺一鸣 on 2018/11/19.
//  Copyright © 2018 李荣贵. All rights reserved.
//

import UIKit
import AFNetworking

class KKNewWorkHelper: NSObject {

    public var manager   : AFHTTPSessionManager {
        get{
            let manager = AFHTTPSessionManager.init()
            
            let key = ""
            let end_key = ""
            
            let TIMESTAMP = String(format: "%.0f",Date.timeIntervalBetween1970AndReferenceDate)
            let ECHOSTR = String(format: "%.0f",Date.init(timeIntervalSinceNow: 10).timeIntervalSince1970)
            var baseString = end_key+String(ECHOSTR)+String(TIMESTAMP)
            baseString = baseString.md5String()
            
            let afHTTP :AFJSONRequestSerializer = AFJSONRequestSerializer()
            afHTTP.setValue("multipart/form-data;", forHTTPHeaderField: "Content-Type")
//            afHTTP.setValue("application/json", forHTTPHeaderField: "Accept")
            
            manager.responseSerializer = AFJSONResponseSerializer()
            manager.requestSerializer  = afHTTP
            manager.requestSerializer.timeoutInterval = 10
            manager.responseSerializer.acceptableContentTypes = (NSSet(set:["text/html"]) as! Set<String>)
            manager.requestSerializer.setValue(key, forHTTPHeaderField: "KEY")
            manager.requestSerializer.setValue(TIMESTAMP, forHTTPHeaderField: "TIMESTAMP")
            manager.requestSerializer.setValue(ECHOSTR, forHTTPHeaderField: "ECHOSTR")
            manager.requestSerializer.setValue(baseString, forHTTPHeaderField: "SIGNATURE")
            
            return manager
        }
    }
    let KKURL = ""
    let KKURL1 = ""
    
    public func GetUrl(url:String) -> String {
        let NewUrl = String(KKURL+"index.php?"+url+"&client=1")
        return NewUrl
    }
}

extension KKNewWorkHelper {
    fileprivate func GetRequest(url : String,successBlock:@escaping (_ json : Any?)-> Swift.Void , failureBlock: @escaping (_ err : Error ) -> Swift.Void){
        manager.get(url, parameters: nil, progress: { (progress) in
        }, success: { (task, responseObject) in
            successBlock(responseObject)
        }) { (task, error) in
            failureBlock(error)
        }
    }
    
    
    fileprivate func PostRequest(url : String, parameters : NSMutableDictionary,successBlock:@escaping (_ json : Any?)-> Swift.Void , failureBlock: @escaping (_ err : Error ) -> Swift.Void){
        manager.post(url, parameters: parameters, constructingBodyWith: { (progress) in
            
        }, progress: { (progress) in
            
        }, success: { (task, responseObject) in
            successBlock(responseObject)
        }) { (task, error) in
            failureBlock(error)
        }
    }
}


extension KKNewWorkHelper {
    public func GetRequestNetWork(url  : String ,
                                  dic : NSMutableDictionary,
                                  success  :@escaping (_ json : Any?)->Void,
                                  failure  :@escaping (_ error : Error)->Void){
        var NewUrl = self.GetUrl(url: url)
        if dic.count>0 {
            for(key , value)in dic{
                NewUrl = "\(NewUrl)&\(key)=\(value)"
            }
        }
        self.GetRequest(url: NewUrl, successBlock: { (json) in
            success(json)
            print("请求成功    \(json ?? "无参数")")
        }) { (error) in
            failure(error)
            print("请求失败    \(error)")
        }
    }
    
    
    public func PostRequestNetWork(url  : String ,
                                  dic : NSMutableDictionary,
                                  success  :@escaping (_ json : Any?)->Void,
                                  failure  :@escaping (_ error : Error)->Void){
        dic.setValue("1", forKey: "client")
        self.PostRequest(url: self.GetUrl(url: url), parameters: dic, successBlock: { (json) in
            success(json)
            print("请求成功    \(json ?? "无参数")")
        }) { (error) in
            failure(error)
            print("请求失败    \(error)")
        }
    }
}
