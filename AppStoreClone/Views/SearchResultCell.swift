//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by Decagon on 14/08/2021.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
        
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Video"
        return label
        
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "9.25M"
        return label
        
    }()
    
    let getButton:UIButton = {
        let button = UIButton()
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 84).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        
        return imageView
    }
    
    lazy var screenshot1ImageView  = self.createScreenshotImageView()
    lazy var screenshot2ImageView  = self.createScreenshotImageView()
    lazy var screenshot3ImageView  = self.createScreenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        let infoStackView = UIStackView(arrangedSubviews: [
            appIconImageView,VerticalStackView(arrangedSubviews: [
                
                nameLabel, categoryLabel ,ratingsLabel
            ]),getButton
            
        ])
        infoStackView.spacing = 12
        
        infoStackView.alignment  =   .center
        
        
        let screenshotStackView = UIStackView(arrangedSubviews: [
            screenshot1ImageView,screenshot2ImageView,screenshot3ImageView
        ])
        screenshotStackView.spacing = 10
        screenshotStackView.distribution = .fillEqually
        
        
        
        let overallStackView = VerticalStackView(arrangedSubviews: [
            infoStackView,screenshotStackView
        ], spacing: 16)
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemente")
    }
    
}
