//
//  StoriesViewCell.swift
//  TestApp
//
//  Created by Sabina on 1/29/21.
//

import UIKit

class StoriesViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let stories = DummyData.getStories()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = storiesView.dequeueReusableCell(withReuseIdentifier: "\(StoriesCollectionViewCell.self)", for: indexPath) as! StoriesCollectionViewCell
        cell.storiesImage.image = UIImage(named: stories[indexPath.row].image)
        cell.nameLabel.text = stories[indexPath.row].userName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 70, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    @IBOutlet weak var storiesView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpStoriesView()
    }
    
    func setUpStoriesView() {
        storiesView.dataSource = self
        storiesView.delegate = self
        storiesView.register(UINib(nibName: "\(StoriesCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(StoriesCollectionViewCell.self)")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
