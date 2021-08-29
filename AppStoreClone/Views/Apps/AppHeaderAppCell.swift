//
//  AppHeaderAppCell.swift
//  AppStoreClone
//
//  Created by Decagon on 25/08/2021.
//

import UIKit



class AppHeaderCell: UICollectionViewCell {
     
    
    let companyLabel = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 12))
    
    
    
    let titleLabel = UILabel(text: "Keeping up with friends is easier than ever", font: .systemFont(ofSize: 24))
    
    
    let imageView = UIImageView(cornerRadius: 8)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.backgroundColor = .black
        titleLabel.numberOfLines = 2
        
        let stackView = VerticalStackView(arrangedSubviews: [companyLabel,titleLabel,imageView],spacing: 10)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 0, right: 0))
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
