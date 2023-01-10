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
        switchTo(tab: .session)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func config() {
        tabBar.tintColor = Resources.Colors.TabBar.active
        tabBar.barTintColor = Resources.Colors.TabBar.inActive
        
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = Resources.Colors.TabBar.separator.cgColor
        tabBar.layer.masksToBounds = true
        
        let overviewController = OverviewViewController()
        let sessionController = SessionViewController()
        let progressController = ProgressViewController()
        let settingsController = SettingsViewController()
        
        let overviewNavigationController = NavBarViewController(rootViewController: overviewController)
        let sessionNavigationController = NavBarViewController(rootViewController: sessionController)
        let progressNavigationController = NavBarViewController(rootViewController: progressController)
        let settingsNavigationController = NavBarViewController(rootViewController: settingsController)

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
