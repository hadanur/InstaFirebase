//
//  PostCell.swift
//  InstaFirebase
//
//  Created by Hakan Adanur on 23.01.2023.
//

import Foundation
import UIKit
import SDWebImage

class PostCell: UITableViewCell {
    @IBOutlet private weak var postImage: UIImageView!
    
    @IBOutlet weak var userImage: UIImageView!
    
    func configure(image: imageModel){
        if let imageUrl = URL(string: image.imageUrl) {
            postImage.sd_setImage(with: imageUrl)
        }
        
        if let imageUrl = URL(string: image.imageUrl) {
            userImage.sd_setImage(with: imageUrl)
        }
        
        setupUI()
    }
    
    func setupUI(){
        userImage.layer.cornerRadius = 18
        userImage.layer.borderWidth = 1.50
        userImage.layer.borderColor = UIColor.systemPink.cgColor
    }
}
