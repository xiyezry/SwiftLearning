//
//  DB.swift
//  FinalProject
//
//  Created by 钟仁毅 on 2020/5/6.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class DB{
    static func initDB(){
        ///Users/xiye/Library/Developer/CoreSimulator/Devices/B1CB07BC-C4FA-4478-8210-865040F3C354/data/Containers/Data/Application/14B9FB5B-4379-4F9E-BFBD-0D142A791B25/Documents/app.sqlite
        let sqlite = SQLiteManager.sharedInstance
        
        if !sqlite.openDB(){return}
        let createRestaurant = "CREATE TABLE IF NOT EXISTS restaurant('name' TEXT NOT NULL PRIMARY KEY,'type' TEXT, 'address' TEXT);"
        let createDishes = "CREATE TABLE IF NOT EXISTS dishes('name' TEXT NOT NULL PRIMARY KEY,'restaurant' TEXT ,'price' TEXT,'description' TEXT,'pic' BLOB);"
        
        if !sqlite.execNoneQuerySQL(sql: createRestaurant){sqlite.closeDB();return}
        if !sqlite.execNoneQuerySQL(sql: createDishes){sqlite.closeDB();return}
        let restaurant0 = "INSERT OR REPLACE INTO restaurant(name,type,address) VALUES('好兄弟川菜馆','川菜','四川成都')"
        let restaurant1 = "INSERT OR REPLACE INTO restaurant(name,type,address) VALUES('食辣八方川菜馆','川菜','四川雅安')"
        if !sqlite.execNoneQuerySQL(sql: restaurant0){sqlite.closeDB();return}
        if !sqlite.execNoneQuerySQL(sql: restaurant1){sqlite.closeDB();return}
        let dishes0 = "INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('麻婆豆腐','好兄弟川菜馆','15','麻婆豆腐，是四川省传统名菜之一，属于川菜，主要原料为豆瓣、豆腐、牛肉末、辣椒和花椒等，麻来自花椒，辣来自辣椒面，这道菜突出了川菜麻辣的特点，其口味独特，口感顺滑')"
        let dishes1 = "INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('夫妻肺片','好兄弟川菜馆','40','夫妻肺片  ，是一道四川成都名菜，由郭朝华、张田政夫妻创制而成。通常以牛头皮、牛心、牛舌、牛肚、牛肉为主料，进行卤制，而后切片。再配以辣椒油、花椒面等辅料制成红油浇在上面。')"
        let dishes2 = "INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('冷吃兔','食辣八方川菜馆','25','冷吃兔是一道以兔子肉主要食材制作的川菜。')"
        let dishes3 = "INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('棒棒鸡','食辣八方川菜馆','100','棒棒鸡，又名“嘉定棒棒鸡”、“乐山棒棒鸡”。此菜起源于乐山汉阳坝 ，取用良种汉阳鸡，经煮熟后，用木棒将鸡肉捶松后食用。')"
        if !sqlite.execNoneQuerySQL(sql: dishes0){sqlite.closeDB();return}
        if !sqlite.execNoneQuerySQL(sql: dishes1){sqlite.closeDB();return}
        if !sqlite.execNoneQuerySQL(sql: dishes2){sqlite.closeDB();return}
        if !sqlite.execNoneQuerySQL(sql: dishes3){sqlite.closeDB();return}
        SaveImage(name:"麻婆豆腐", img: UIImage.init(named: "麻婆豆腐"))
        
        SaveImage(name:"夫妻肺片", img: UIImage.init(named: "夫妻肺片"))
        
        SaveImage(name:"冷吃兔", img: UIImage.init(named: "冷吃兔"))
        SaveImage(name:"棒棒鸡", img: UIImage.init(named: "棒棒鸡"))
        sqlite.closeDB()
        print("success!")
    }
    
    static func SaveImage(name:String,img:UIImage?){
        if img == nil{return}
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.openDB(){return}
        let sql = "UPDATE dishes SET pic = ? WHERE name = '\(name)'"
        print("UPDATE dishes SET pic = ? WHERE index = '\(name)'")
        let data = img!.jpegData(compressionQuality: 1.0) as NSData?
        sqlite.execSaveBlob(sql: sql, blob: data!)
        sqlite.closeDB()
        return
    }
    
    static func LoadImage(name:String) -> UIImage{
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.openDB(){return UIImage(named:"nopic")!}
        let sql = "SELECT pic FROM dishes WHERE name = '\(name)'"
        let data = sqlite .execLoadBlob(sql: sql)
        sqlite.closeDB()
        
        if data != nil{
            return UIImage(data:data!)!
        }
        else
        {
            return UIImage(named: "nopic")!
        }
    }
}
