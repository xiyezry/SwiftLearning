//
//  UserInfo.swift
//  week4
//
//  Created by 钟仁毅 on 2020/3/11.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import Foundation

class UserInfo:CustomStringConvertible{
    var description: String{
        get{
            return "\(name),\(pwd)"
        }
    }
    var name: String = ""
    var pwd:String = ""
    var isCPM: Bool = false
    var education : String = ""
    var IQ:Int = 0
    
    func setEduByIndex(index:Int){
        let eduList = [0:"高中",1:"本科",2:"硕士",3:"博士"]
        if index>=0&&index<=3{
            education = eduList[index]!
        }
    }
}
