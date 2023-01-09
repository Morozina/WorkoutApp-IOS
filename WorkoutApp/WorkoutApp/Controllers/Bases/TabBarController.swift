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
        tabBar.tintColor = TabBarResources.Colors.active
        tabBar.barTintColor = TabBarResources.Colors.inActive
        
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = TabBarResources.Colors.separator.cgColor
        tabBar.layer.masksToBounds = true
        
        let overviewController = OverviewViewController()
        let sessionController = SessionViewController()
        let progressController = ProgressViewController()
        let settingsController = SettingsViewController()
        
        let overviewNavigationController = NavBarViewController(rootViewController: overviewController)
        let sessionNavigationController = NavBarViewController(rootViewController: sessionController)
        let progressNavigationController = NavBarViewController(rootViewController: progressController)
        let settingsNavigationController = NavBarViewController(rootViewController: settingsController)

        overviewNavigationController.tabBarItem = UITabBarItem(title: TabBarResources.Strings.overview,
                                                               image: TabBarResources.Image.overview,
                                                               tag: Tabs.overview.rawValue)
        sessionNavigationController.tabBarItem = UITabBarItem(title: TabBarResources.Strings.session,
                                                               image: TabBarResources.Image.session,
                                                               tag: Tabs.session.rawValue)
        progressNavigationController.tabBarItem = UITabBarItem(title: TabBarResources.Strings.progress,
                                                               image: TabBarResources.Image.progress,
                                                               tag: Tabs.progress.rawValue)
        settingsNavigationController.tabBarItem = UITabBarItem(title: TabBarResources.Strings.settings,
                                                               image: TabBarResources.Image.settings,
                                                               tag: Tabs.settings.rawValue)
        
        setViewControllers([
            overviewNavigationController,
            sessionNavigationController,
            progressNavigationController,
            settingsNavigationController
                           ], animated: false)
    }
}
