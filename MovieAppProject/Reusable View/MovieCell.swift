//
//  MovieCell.swift
//  MovieAppProject
//
//  Created by Fatya on 10.07.24.
//

import UIKit
import Kingfisher

protocol TopImageBottomLabelProtocol {
    var imageName: String { get }
    var labelText: String { get }
}

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    override func awakeFromNib() {
           super.awakeFromNib()
       }
       
       func configure(data: TopImageBottomLabelProtocol) {
           movieNameLabel.text = data.labelText
           movieImage.loadImage(path: data.imageName)
       }
   }
