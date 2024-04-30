//
//  MainTabBarController.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 10.04.2024.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}

// MARK: - Helpers

extension MainTabBarController {
    
    private func setup() {
        let searchVC = createViewController(rootVC: SearchVC(), title: "Search", image: "magnifyingglass")
        let appsVC = createViewController(rootVC: AppsVC(), title: "Apps", image: "square.stack.3d.up")
        let todayVC = createViewController(rootVC: TodayVC(), title: "Today", image: "doc.text.image")
        viewControllers = [todayVC,appsVC,searchVC]
        customizeTabBar()
        customizeNavigationBar()
    }
    
    private func createViewController(rootVC: UIViewController, title: String, image: String) -> UIViewController {
        let controller = UINavigationController(rootViewController: rootVC)
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(systemName: image)
        rootVC.title = title
        return controller
    }
    
    private func customizeTabBar() {
        let appearance = UITabBarAppearance()
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = UIImage()
        appearance.backgroundColor = .clear
        
        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }
    
    private func customizeNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Colors.systemBackground
        
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
    }
}





