//
//  StoryCell.swift
//  InstaFirebase
//
//  Created by Hakan Adanur on 23.01.2023.
//

import Foundation
import UIKit

class StoryCell: UICollectionViewCell {
    @IBOutlet private weak var storyImage: UIImageView!
    
    
    func configure(image: imageModel){
        if let imageUrl = URL(string: image.imageUrl) {
            storyImage.sd_setImage(with: imageUrl)
            setupUI()
        }
    }
    
    func setupUI(){
        storyImage.layer.cornerRadius = 32
        storyImage.layer.borderWidth = 2
        storyImage.layer.borderColor = UIColor.systemPink.cgColor
    }
}
