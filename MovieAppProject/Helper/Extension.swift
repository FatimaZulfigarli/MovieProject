//
//  Extension.swift
//  MovieAppProject
//
//  Created by Fatya on 12.07.24.
//
import UIKit
import Foundation
import Kingfisher
extension UIImageView {
    func loadImage(path: String) {
        let url = "\(NetworkConstants.baseImageUrl)\(path)"
            self.kf.setImage(with: URL(string: url))
    }
}

extension UIViewController{
    func showAlertController(title:String, message: String) {
        
    }
}
