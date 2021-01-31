//
//  SenderMessageViewCell.swift
//  TestApp
//
//  Created by Sabina on 1/30/21.
//

import UIKit

class SenderMessageViewCell: UITableViewCell {

    @IBOutlet weak var senderImage: UIImageView!
    @IBOutlet weak var senderMessageBubble: UIView!
    @IBOutlet weak var senderMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        senderMessageBubble.layer.cornerRadius = 6
        senderImage.layer.cornerRadius = self.senderImage.frame.size.width / 2
        senderImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
