//
//  ReceiverMessageViewCell.swift
//  TestApp
//
//  Created by Sabina on 1/30/21.
//

import UIKit

class ReceiverMessageViewCell: UITableViewCell {
    
    @IBOutlet weak var receiverImage: UIImageView!
    @IBOutlet weak var receiverMessageBubble: UIView!
    @IBOutlet weak var receiverMessage: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        receiverMessageBubble.layer.cornerRadius = 6
        receiverImage.layer.cornerRadius = self.receiverImage.frame.size.width / 2
        receiverImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
