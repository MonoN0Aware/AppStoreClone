//
//  BaseTAbBarController.swift
//  AppStoreClone
//
//  Created by Decagon on 13/08/2021.
//

import UIKit
import LocalAuthentication

class baseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createNavController(viewController: AppsController(), title: "Apps", image: "apps"),
            createNavController(viewController: UIViewController(), title: "Today", image: "today_icon"),
            createNavController(viewController: AppStoreSearchController(), title: "Search", image: "search")
            
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
