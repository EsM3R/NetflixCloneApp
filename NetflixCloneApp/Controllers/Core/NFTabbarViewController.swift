//
//  NFTabbarViewController.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 17.01.2024.
//

import UIKit


final class NFTabbarViewController : UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let homeVC = NFHomeViewController()
        let newAndHotVC = NFNewAndHotViewController()
        let myNetflixVC = NFMyNetflixViewController()
        
        
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: newAndHotVC)
        let nav3 = UINavigationController(rootViewController: myNetflixVC)
        
        
        nav1.tabBarItem = UITabBarItem(title: "Home",
                                       image: UIImage(systemName: "house"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "New & Hot",
                                       image: UIImage(systemName: "play.square.fill"),
                                       tag :2)
        nav3.tabBarItem = UITabBarItem(title: "MyNetflix",
                                       image: UIImage(systemName: "gear"),
                                       tag:  3)
        
        tabBar.tintColor = .label
        
        setViewControllers([nav1 , nav2 , nav3], animated: true)
        
        
    }
    
}

