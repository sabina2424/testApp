//
//  ChatViewController.swift
//  TestApp
//
//  Created by Sabina on 1/29/21.
//

import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var messagesTableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var conversation: Conversation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        customizeNavigation()
        setTitleLabels()
    }
    
    func setTitleLabels() {
        nameLabel.text = conversation?.sender
        statusLabel.text = (conversation?.isActive ?? false) ? "Active now": "Last seen recently"
    }
    
    func customizeNavigation() {
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gearshape"), style: .plain, target: self, action: #selector(settingsTapped))
    }
    
    @objc func settingsTapped() {
        print("settings tapped")
    }
    
    func setUpTableView() {
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        messagesTableView.register(UINib(nibName: "\(MessageViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(MessageViewCell.self)")
        messagesTableView.register(UINib(nibName: "\(ReceiverMessageViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(ReceiverMessageViewCell.self)")
        messagesTableView.register(UINib(nibName: "\(SenderMessageViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(SenderMessageViewCell.self)")
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        let message = Message(userID: "ironman", message: textField.text ?? "", isSender: true)
        conversation?.messages.append(message)
        messagesTableView.reloadData()
        textField.text = nil
    }
    
}

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conversation?.messages.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let chatMessages = conversation?.messages[indexPath.row] else { return UITableViewCell()}
        if chatMessages.isSender {
            let senderCell = tableView.dequeueReusableCell(withIdentifier: "\(SenderMessageViewCell.self)", for: indexPath) as! SenderMessageViewCell
            senderCell.senderMessage.text = chatMessages.message
            senderCell.senderImage.image = UIImage(named: "\(chatMessages.userID)")
            return senderCell
        } else {
            let receiverCell = tableView.dequeueReusableCell(withIdentifier: "\(ReceiverMessageViewCell.self)", for: indexPath) as! ReceiverMessageViewCell
            receiverCell.receiverMessage.text = chatMessages.message
            receiverCell.receiverImage.image = UIImage(named: "\(chatMessages.userID)")
            return receiverCell
        }
    }
    
}


