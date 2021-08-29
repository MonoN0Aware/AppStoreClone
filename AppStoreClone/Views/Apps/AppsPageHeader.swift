//
//  AppsPageHeader.swift
//  AppStoreClone
//
//  Created by Decagon on 25/08/2021.
//

import UIKit


class AppsPageHeader: UICollectionReusableView {
    
    let appHorizontalController = AppsHorizontalController()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(appHorizontalController.view)
        appHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
