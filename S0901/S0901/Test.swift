//
//  Test.swift
//  S0901
//
//  Created by 钟仁毅 on 2020/4/15.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import Foundation

class Test{
    static func initDB(){
        let sqlite = SQLiteManager.sharedInstance
        
        if !sqlite.openDB(){return }
        let createSql = "CREATE TABLE IF NOT EXISTS student('id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, " + "'name' TEXT,'phone' TEXT);"
        if !sqlite.execNoneQuerySQL(sql: createSql){sqlite.closeDB();return}
        
        let cleanAllStu = "DELETE FROM student"
        if !sqlite.execNoneQuerySQL(sql: cleanAllStu){sqlite.closeDB();return}
        
        let resetStu = "DELETE FROM sqlite_sequence WHERE name = 'student';"
        if !sqlite.execNoneQuerySQL(sql: resetStu){sqlite.closeDB();return}
        
        let stu0 = "INSERT INTO student(name,phone) VALUES('张三','zhangsan@whu.edu.cn')"
        let stu1 = "INSERT INTO student(name,phone) VALUES('李四','lisi@whu.edu.cn')"
        
        if !sqlite.execNoneQuerySQL(sql: stu0){sqlite.closeDB();return}
        if !sqlite.execNoneQuerySQL(sql: stu1){sqlite.closeDB();return}
        
        sqlite.closeDB()

    }
    
    static func GetStudent(){
        let sqlite = SQLiteManager.sharedInstance
        if !sqlite.openDB(){return }
        let queryResult = sqlite.execQuerySQL(sql: "SELECT * FROM student")
        
        print(queryResult!)
        
        sqlite.closeDB()
    }
    
}
