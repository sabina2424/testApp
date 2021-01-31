//
//  StoriesCollectionViewCell.swift
//  TestApp
//
//  Created by Sabina on 1/27/21.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var storiesImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        storiesImage.layer.cornerRadius = self.storiesImage.frame.size.width / 2
    }
    
    

}
