//
//  AppRowXiB.swift
//  AppStoreClone
//
//  Created by Decagon on 24/08/2021.
//

import UIKit


class AppRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 8)
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getButton = UIButton(title: "GET")
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.backgroundColor = .darkGray
        
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        let stackView = UIStackView(arrangedSubviews: [imageView,VerticalStackView(arrangedSubviews: [nameLabel,companyLabel],spacing: 4),getButton])
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
                addSubview(stackView)
        stackView.spacing = 16
        stackView.alignment = .center
        getButton.constrainHeight(constant: 32)
        getButton.constrainWidth(constant: 80)
        getButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        getButton.layer.cornerRadius  = 32 / 2
        stackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
