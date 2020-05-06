//
//  UIImageViewExtension.swift
//  P1102
//
//  Created by 钟仁毅 on 2020/5/6.
//  Copyright © 2020 钟仁毅. All rights reserved.
//

import UIKit

extension UIImageView{
    func downloadAsyncFrom(url:String){
        let urlNet = URL(string: url)
        let task = URLSession.shared.dataTask(with:urlNet!){
            (data,response,error)in
            if let nsd = data{
                DispatchQueue.main.async{
                    self.image = UIImage(data:nsd,scale: 1)
                    self.contentMode = .scaleAspectFit
                }
            }
        }
        task.resume()
    }
}
