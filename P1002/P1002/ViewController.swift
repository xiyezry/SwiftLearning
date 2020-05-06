//
//  ViewController.swift
//  P1002
//
//  Created by 钟仁毅 on 2020/4/29.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var fileURL:URL?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dirpath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        fileURL = dirpath.appendingPathComponent("persistence.dat")
        print(fileURL!.path)
    }

    @IBAction func writeString(_ sender: Any) {
        let a = "hello,world"
        do{
        try a.write(to: fileURL!, atomically: true, encoding: .utf8)
        }catch{
            print(error)
        }
    }
    
    @IBAction func readString(_ sender: Any) {
        do{let b = try String.init(contentsOf: fileURL! , encoding: .utf8)
            print(b)
        }
        catch{
            print(error)
        }
        
    }
    @IBAction func writeArray(_ sender: Any) {
        let a:[Int32] = [1,66,8,99]
        let b = a as NSArray
        b.write(to: fileURL!, atomically: true)
        
    }
    @IBAction func readArray(_ sender: Any) {
        let a = NSArray.init(contentsOf: fileURL!) as! [Int32]
        print(a)
    }
    @IBAction func writeModel(_ sender: Any) {
        do{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let zs = Student(name: "张三", birthday: dateFormatter.date(from: "1998-02-01")!, score: 82)
            let ls = Student(name: "李四", birthday: dateFormatter.date(from: "1992-03-01")!, score: 76)
            let studentsWrite = [zs,ls]
            let dataArchived = try NSKeyedArchiver.archivedData(withRootObject: studentsWrite, requiringSecureCoding: false)
            try dataArchived.write(to:fileURL!,options: .atomic)
        }
        catch{
            print(error)
        }
    }
    @IBAction func readModel(_ sender: Any) {
        do{
            let data = try Data.init(contentsOf: fileURL!)
            if let studentsRead = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Student]
            {
                print(studentsRead)
            }
        }
        catch{
            print(error)
        }
    }
}

