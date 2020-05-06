//
//  JsonFileManager.swift
//  S0801
//
//  Created by 钟仁毅 on 2020/4/15.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import Foundation

class JsonFileManager<T:NSObject&Codable>{
    var Records:[T]=[]
    
    var Url:URL
    
    init(filename:String){
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        Url = path.appendingPathComponent(filename)
        print(Url)
    }
    
    func Save()
    {
        let encoder = JSONEncoder()
        
        do{
            let encodeData: Data? = try encoder.encode(Records)
            try encodeData!.write(to: Url,options: .atomic)
        }
        catch{
            print(error)
        }
    }
    
    func Load(){
        do{
            if let encodeData = try?Data.init(contentsOf: Url){
                let decoder = JSONDecoder()
                Records = try decoder.decode([Student].self, from: encodeData) as! [T]
            }
        }
        catch{
            print(error)
        }
    }
}
