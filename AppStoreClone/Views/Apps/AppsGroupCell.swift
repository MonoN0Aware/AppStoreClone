//
//  AppsGroupCell.swift
//  AppStoreClone
//
//  Created by Decagon on 23/08/2021.
//

import UIKit


class AppGroupCell:UICollectionViewCell {
    
    let titleLabel = UILabel(text: "AppSection", font: UIFont.boldSystemFont(ofSize: 30))
    
    let horizontalController = AppsHorizontalViewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 0, left: 16, bottom: 0, right: 0))
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


