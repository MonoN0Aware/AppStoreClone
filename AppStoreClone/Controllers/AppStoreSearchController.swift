//
//  AppStoreSearchController.swift
//  AppStoreClone
//
//  Created by Decagon on 14/08/2021.
//

import UIKit
import SDWebImage


class AppStoreSearchController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let cellId = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell .self, forCellWithReuseIdentifier: cellId)
        
        fetchItunesApps()
        setupSearchBar()
    }
    
    func setupSearchBar(){
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.obscuresBackgroundDuringPresentation = false

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
        cell.appResult = appResult
        
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
