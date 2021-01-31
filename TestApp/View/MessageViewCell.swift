//
//  MessageViewCell.swift
//  TestApp
//
//  Created by Sabina on 1/29/21.
//

import UIKit

class MessageViewCell: UITableViewCell {
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var receiverImage: UIImageView!
    @IBOutlet weak var senderImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBubble.layer.cornerRadius = messageBubble.layer.frame.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
