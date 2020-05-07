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
        
        sqlite.openDB()
        let createRestaurant = "CREATE TABLE IF NOT EXISTS restaurant('name' TEXT NOT NULL PRIMARY KEY,'type' TEXT, 'address' TEXT);"
        let createDishes = "CREATE TABLE IF NOT EXISTS dishes('name' TEXT NOT NULL PRIMARY KEY,'restaurant' TEXT ,'price' TEXT,'description' TEXT,'pic' BLOB);"
        let createCart = "CREATE TABLE IF NOT EXISTS cart('index' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,'identifier' TEXT,'name' TEXT ,'price' TEXT);"
        
        sqlite.execNoneQuerySQL(sql: createRestaurant)
        sqlite.execNoneQuerySQL(sql: createDishes)
        sqlite.execNoneQuerySQL(sql: createCart)
        var restaurant:[String] = []
        restaurant.append("INSERT OR REPLACE INTO restaurant(name,type,address) VALUES('好兄弟川菜馆','川菜','四川成都')")
        restaurant.append("INSERT OR REPLACE INTO restaurant(name,type,address) VALUES('食辣八方川菜馆','川菜','四川雅安')")
        restaurant.append("INSERT OR REPLACE INTO restaurant(name,type,address) VALUES('博山鲁菜馆','鲁菜','山东淄博')")
        restaurant.append("INSERT OR REPLACE INTO restaurant(name,type,address) VALUES('济南棒棒哒鲁菜馆','鲁菜','山东济南')")
        restaurant.append("INSERT OR REPLACE INTO restaurant(name,type,address) VALUES('组庵湘菜馆','湘菜','湖南茶陵')")
        restaurant.append("INSERT OR REPLACE INTO restaurant(name,type,address) VALUES('好巴适湘菜馆','湘菜','湖南长沙')")
        restaurant.append("INSERT OR REPLACE INTO restaurant(name,type,address) VALUES('广州府菜馆','粤菜','广东广州')")
        restaurant.append("INSERT OR REPLACE INTO restaurant(name,type,address) VALUES('潮州鲜菜馆','粤菜','广东汕头')")
        for e in restaurant {
            sqlite.execNoneQuerySQL(sql: e)
        }
        var dishes:[String] = []
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('麻婆豆腐','好兄弟川菜馆','15','麻婆豆腐，是四川省传统名菜之一，属于川菜，主要原料为豆瓣、豆腐、牛肉末、辣椒和花椒等，麻来自花椒，辣来自辣椒面，这道菜突出了川菜麻辣的特点，其口味独特，口感顺滑')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('夫妻肺片','好兄弟川菜馆','40','夫妻肺片  ，是一道四川成都名菜，由郭朝华、张田政夫妻创制而成。通常以牛头皮、牛心、牛舌、牛肚、牛肉为主料，进行卤制，而后切片。再配以辣椒油、花椒面等辅料制成红油浇在上面。')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('冷吃兔','食辣八方川菜馆','25','冷吃兔是一道以兔子肉主要食材制作的川菜。')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('棒棒鸡','食辣八方川菜馆','100','棒棒鸡，又名“嘉定棒棒鸡”、“乐山棒棒鸡”。此菜起源于乐山汉阳坝 ，取用良种汉阳鸡，经煮熟后，用木棒将鸡肉捶松后食用。')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('豆腐箱子','博山鲁菜馆','20','博山豆腐箱子为山东名菜，传说乾隆曾在博山品尝此菜，赞赏不已，此后便身价倍增此菜制作工艺独特，形如宝盒，形状优美。')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('博山酥锅','博山鲁菜馆','43','博山酥锅是山东省博山地区特色传统名吃，春节食俗。博山人对于过年春节，是特别的重视。过去人穷，过年就特别的隆重——早早的就准备年货，早早的就开始准备年节大菜。在各种各样的博山年节菜中，有一样菜是必不可少的，那就是著名的“博山酥锅”。')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('糖醋鲤鱼','济南棒棒哒鲁菜馆','55','糖醋鲤鱼是用鲤鱼制作的一道山东济南传统名菜，为鲁菜的代表菜品之一，色泽金黄，外焦内嫩，酸甜可口，香鲜味美。')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('九转大肠','济南棒棒哒鲁菜馆','38','九转大肠，原名为红烧大肠，是山东省济南市传统名菜。清朝光绪初年，由济南九华楼酒楼店主首创。将猪大肠经水焯后油炸，再灌入十多种作料，用微火炮制而成。成菜后，酸、甜、香、辣、咸五味俱全，色泽红润，质地软嫩')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('组庵豆腐','组庵湘菜馆','18','组庵豆腐是指用豆腐为主料，配以口蘑、干贝、淀粉等辅料制成的一道菜。')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('组庵鱼翅','组庵湘菜馆','99','组庵鱼翅，又叫红煨鱼翅，是湖南省地方传统名菜，属湘菜系。此菜颜色淡黄、汁明油亮、软糯柔滑、鲜咸味美、醇香适口。组庵鱼翅用料讲究，制作独特。此菜味道醇厚，鱼翅糯软，营养丰富，实为菜中珍品。')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('湘西外婆菜','好巴适湘菜馆','28','湘西外婆菜是一道美味的菜肴。外婆菜原是湘西本地一道常见家常菜，原料选自湘西地区的多种野菜。如：马齿苋、萝卜丁、大叶青菜、湘西土菜、肉沫等。')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('干锅茶树菇','好巴适湘菜馆','19','干锅菜能在寒冷的冬季给我们食欲和温暖。干锅茶树菇这是一道湖南家常菜，菜品口味浓郁鲜香，酸辣适口。腊肉的香味和菌菇的香味完美地融合，是一道越煮越好吃的下饭菜。')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('广州文昌鸡','广州府菜馆','66','广东文昌鸡，是广东省传统的汉族名菜，属于粤菜系。以海南岛文昌鸡为主料，配以火腿 、鸡肝、郊菜，经煮、蒸、炒而成。此菜造型美观，芡汁明亮，肉质滑嫩，香味甚浓，肥而不腻。三样配料颜色不同，滋味各异，为广州八大名鸡之一')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('红烧乳鸽','广州府菜馆','19','红烧乳鸽，是是广东省传统名菜之一，属于粤菜系。主要材料有乳鸽，特点是皮脆、肉滑、骨嫩、多汁。民间一直有“一鸽胜九鸡”的说法，红烧的乳鸽外酥里嫩，吃红烧乳鸽，大部分人是连骨头也不放过，因为经过卤煮再油炸的乳鸽的是香到骨子里的。')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('潮州粉粿','潮州鲜菜馆','12','粉粿是一款广东潮州颇具地方特色的传统小食，它名为粿，但形却似鸡冠饺形，由于它的皮采用澄面皮，故蒸熟后晶莹透明，红红绿绿的粿馅分明可见，十分惹人喜爱。')")
        dishes.append("INSERT OR REPLACE INTO dishes(name,restaurant,price,description) VALUES('潮州牛肉丸','潮州鲜菜馆','39','潮州牛肉丸，是广东潮州著名的地方小食，属于潮菜系。在潮州已经有近百年历史，可分为牛肉丸、牛筋丸两种。牛肉丸肉质较为细嫩，口感嫩滑；牛筋丸由于添加了嫩筋因此更有嚼头、有口感。')")
        for e in dishes{
            sqlite.execNoneQuerySQL(sql: e)
        }
        SaveImage(name:"麻婆豆腐", img: UIImage.init(named: "麻婆豆腐"))
        SaveImage(name:"夫妻肺片", img: UIImage.init(named: "夫妻肺片"))
        SaveImage(name:"冷吃兔", img: UIImage.init(named: "冷吃兔"))
        SaveImage(name:"棒棒鸡", img: UIImage.init(named: "棒棒鸡"))
        SaveImage(name: "豆腐箱子", img: UIImage.init(named: "豆腐箱子"))
        SaveImage(name: "博山酥锅", img: UIImage.init(named: "博山酥锅"))
        SaveImage(name: "糖醋鲤鱼", img: UIImage.init(named: "糖醋鲤鱼"))
        SaveImage(name: "九转大肠", img: UIImage.init(named: "九转大肠"))
        SaveImage(name: "组庵豆腐", img: UIImage.init(named: "组庵豆腐"))
        SaveImage(name: "组庵鱼翅", img: UIImage.init(named: "组庵鱼翅"))
        SaveImage(name: "湘西外婆菜", img: UIImage.init(named: "湘西外婆菜"))
        SaveImage(name: "干锅茶树菇", img: UIImage.init(named: "干锅茶树菇"))
        SaveImage(name: "广州文昌鸡", img: UIImage.init(named: "广州文昌鸡"))
        SaveImage(name: "红烧乳鸽", img: UIImage.init(named: "红烧乳鸽"))
        SaveImage(name: "潮州粉粿", img: UIImage.init(named: "潮州粉粿"))
        SaveImage(name: "潮州牛肉丸", img: UIImage.init(named: "潮州牛肉丸"))
        
        sqlite.closeDB()
        //print("success!")
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
