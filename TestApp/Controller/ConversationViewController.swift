//
//  ViewController.swift
//  TestApp
//
//  Created by Sabina on 1/26/21.
//

import UIKit

class ConversationViewController: UIViewController {
    
    @IBOutlet weak var contactSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var conversations = DummyData.getConversations()
    private var filteredUsers: [Conversation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactSearchBar.searchTextField.clearButtonMode = .whileEditing
        contactSearchBar.delegate = self
        
        changeBarItemStyle()
        setUpTableViewCell()
        addNavigationitem()
        addGesture()
    }
    
    func addGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func closeKeyboard() {
        view.endEditing(true)
    }
    
    func changeBarItemStyle() {
        let yourBackImage = UIImage(named: "backButton")
        navigationController?.navigationBar.backIndicatorImage = yourBackImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func addNavigationitem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.bubble"), style: .plain, target: self, action: #selector(textTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .plain, target: self, action: #selector(listTapped))
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    @objc func textTapped() {
        print("text tapped")
    }
    
    @objc func listTapped() {
        print("list tapped")
    }
    
    func setUpTableViewCell() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "\(ContactsViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(ContactsViewCell.self)")
        tableView.register(UINib(nibName: "\(StoriesViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(StoriesViewCell.self)")
        self.tableView.reloadData()
    }
    
}
extension ConversationViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            if filteredUsers.count != 0 {
                return filteredUsers.count
            } else {
                return conversations.count
            }
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 110
        case 1:
            return 75
        default:
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let storiesCell =  tableView.dequeueReusableCell(withIdentifier: "\(StoriesViewCell.self)", for: indexPath) as! StoriesViewCell
            return storiesCell
        case 1:
            let chatsCell = tableView.dequeueReusableCell(withIdentifier: "\(ContactsViewCell.self)", for: indexPath) as! ContactsViewCell
            chatsCell.avatarImage.image = UIImage(named: "\(conversations[indexPath.row].image)")
            chatsCell.contactName.text = "\(conversations[indexPath.row].sender)"
            chatsCell.messageField.text = "\(conversations[indexPath.row].messages.last?.message ?? "")"
            if conversations[indexPath.row].isActive == true {
                chatsCell.statusView.backgroundColor = .green
            } else {
                chatsCell.statusView.backgroundColor = .gray
            }
            if filteredUsers.count != 0 {
                chatsCell.setUpCell(data: filteredUsers[indexPath.row])
            } else {
                chatsCell.setUpCell(data: conversations[indexPath.row])
            }
            return chatsCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            guard let chatVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "goToChat") as? ChatViewController else { return }
            if filteredUsers.count != 0 {
                chatVC.conversation = filteredUsers[indexPath.row]
            } else {
                chatVC.conversation = conversations[indexPath.row]
            }
            navigationController?.pushViewController(chatVC, animated: true)
        }
    }
    
}

extension ConversationViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredUsers = conversations.filter({ $0.sender.contains(searchText) })
        tableView.reloadData()
    }
    
}


