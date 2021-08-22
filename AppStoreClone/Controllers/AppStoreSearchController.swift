//
//  AppStoreSearchController.swift
//  AppStoreClone
//
//  Created by Decagon on 14/08/2021.
//

import UIKit
import SDWebImage


class AppStoreSearchController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell .self, forCellWithReuseIdentifier: cellId)
        
        fetchItunesApps()
    }
    
    fileprivate var appResults = [Result]()
    
    func fetchItunesApps() {
        
        Service.shared.fetchApps { result, err in
            
            if let err = err {
                print("Failed to fetch apps",err)
                return
            }
            
            self.appResults = result
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)as! SearchResultCell
        
        let appResult = appResults[indexPath.item]
        cell.nameLabel.text = appResult.trackName
        cell.categoryLabel.text = appResult.primaryGenreName
        cell.ratingsLabel.text = "Rating: \(appResult.averageUserRating ?? 0)"
        let url = URL(string: appResult.artworkUrl100)
        let url2 = URL(string: appResult.screenshotUrls[0])
        
        
        
        if appResult.screenshotUrls.count > 1 {
            cell.screenshot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
        }
        
        if appResult.screenshotUrls.count > 2 {
            cell.screenshot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
        }
        
        
        
        cell.appIconImageView.sd_setImage(with: url )
        cell.screenshot1ImageView.sd_setImage(with: url2)
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 350)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
