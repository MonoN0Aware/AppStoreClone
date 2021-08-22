//
//  BaseTAbBarController.swift
//  AppStoreClone
//
//  Created by Decagon on 13/08/2021.
//

import UIKit

class baseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: AppStoreSearchController(), title: "Search", image: "search"),
            createNavController(viewController: UIViewController(), title: "Today", image: "today_icon"),
            createNavController(viewController: UIViewController(), title: "Apps", image: "apps"),
            
        ]
        
        
    }
    
    
    fileprivate func createNavController(viewController:UIViewController,title:String,image:String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: image )
        viewController.view.backgroundColor = .white
        
        return navController
    }
}
