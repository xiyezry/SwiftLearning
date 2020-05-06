//
//  ViewController.swift
//  P1102
//
//  Created by 钟仁毅 on 2020/5/6.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgview1: UIImageView!
    @IBOutlet weak var imgview2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageDAL.initDB()
        // Do any additional setup after loading the view.
    }

    @IBAction func downloadPressed(_ sender: Any) {
        imgview1.downloadAsyncFrom(url: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1588743179933&di=b4995e1b464d5bf8edfa94bce7039fb6&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201605%2F14%2F20160514211008_i5B3Q.thumb.700_0.jpeg")
    }
    @IBAction func localPressed(_ sender: Any) {
        imgview1.image=UIImage(named: "china")
    }
    @IBAction func savePressed(_ sender: Any) {
        ImageDAL.SaveImage(id: 1, img: imgview1.image)
    }
    @IBAction func loadPressed(_ sender: Any) {
        imgview2.image = ImageDAL.LoadImage(id: 1)
    }
}

