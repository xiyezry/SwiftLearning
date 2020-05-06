//
//  DB.swift
//  FinalProject
//
//  Created by 钟仁毅 on 2020/5/6.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import Foundation

class DB{
    static func initDB(){
        let sqlite = SQLiteManager.sharedInstance
        
        if !sqlite.openDB(){return}
        let createRestaurant = "CREATE TABLE IF NOT EXISTS restaurant('index' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"+"'name' TEXT,'type' TEXT, 'address' TEXT);"
        let createDishes = "CREATE TABLE IF NOT EXISTS dishes('index' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"+"'name' TEXT,'restaurant' TEXT,'price' TEXT,'description' TEXT);"
        
        if !sqlite.execNoneQuerySQL(sql: createRestaurant){sqlite.closeDB();return}
        if !sqlite.execNoneQuerySQL(sql: createDishes){sqlite.closeDB();return}
        let restaurant0 = "INSERT INTO restaurant(name,type,address) VALUES('好兄弟川菜馆','川菜','四川成都')"
        let restaurant1 = "INSERT INTO restaurant(name,type,address) VALUES('食辣八方川菜馆','川菜','四川雅安')"
        if !sqlite.execNoneQuerySQL(sql: restaurant0){sqlite.closeDB();return}
        if !sqlite.execNoneQuerySQL(sql: restaurant1){sqlite.closeDB();return}
        
        sqlite.closeDB()
        print("success!")
    }
}
