//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 08/01/2023.
//

import UIKit

enum Tabs: Int {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super .init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config() {
        tabBar.tintColor = Resources.Colors.TabBar.active
        tabBar.barTintColor = Resources.Colors.TabBar.inActive
        
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = Resources.Colors.TabBar.separator.cgColor
        tabBar.layer.masksToBounds = true
        
        let overviewController = UIViewController()
        let sessionController = UIViewController()
        let progressController = UIViewController()
        let settingsController = UIViewController()
        
        let overviewNavigationController = UINavigationController(rootViewController: overviewController)
        let sessionNavigationController = UINavigationController(rootViewController: sessionController)
        let progressNavigationController = UINavigationController(rootViewController: progressController)
        let settingsNavigationController = UINavigationController(rootViewController: settingsController)

        overviewNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.overview,
                                                               image: Resources.Image.TabBar.overview,
                                                               tag: Tabs.overview.rawValue)
        sessionNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.session,
                                                               image: Resources.Image.TabBar.session,
                                                               tag: Tabs.session.rawValue)
        progressNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.progress,
                                                               image: Resources.Image.TabBar.progress,
                                                               tag: Tabs.progress.rawValue)
        settingsNavigationController.tabBarItem = UITabBarItem(title: Resources.Strings.TabBar.settings,
                                                               image: Resources.Image.TabBar.settings,
                                                               tag: Tabs.settings.rawValue)
        
        setViewControllers([
            overviewNavigationController,
            sessionNavigationController,
            progressNavigationController,
            settingsNavigationController
                           ], animated: false)
    }
}
