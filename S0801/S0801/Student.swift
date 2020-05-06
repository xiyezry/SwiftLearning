//
//  Student.swift
//  S0801
//
//  Created by 钟仁毅 on 2020/4/15.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import Foundation

class Student:NSObject,Codable{
    var name: String = ""
    var birthday:String = ""
    var score:String=""
    var address:String=""
    
    private enum CodingKeys:String,CodingKey{
        case name = "person_name" //rename
        case birthday
        case score
        case address //if comment address doesn't appear in json
    }
    
    override init() {
        
    }
    
    init(name:String,birthday:String,score:String,address:String){
        self.name = name
        self.birthday = birthday
        self.score = score
        self.address = address
    }
    
    override var description: String{
        return "name:\(name),birthday:\(birthday),score:\(score),address:\(address)"
    }
}
