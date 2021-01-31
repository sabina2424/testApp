//
//  ContactsViewCell.swift
//  TestApp
//
//  Created by Sabina on 1/29/21.
//

import UIKit

class ContactsViewCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var messageField: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setUpCell(data: Conversation) {
        avatarImage.image = UIImage(named: data.image)
        contactName.text = data.sender
        messageField.text = data.body
        avatarImage.layer.cornerRadius = self.avatarImage.frame.size.width / 2
        statusView.layer.cornerRadius = self.statusView.frame.size.width / 2
        avatarImage.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
         super.setSelected(selected, animated: animated)
         contentView.backgroundColor = UIColor.white
     }
}
