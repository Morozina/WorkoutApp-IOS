//
//  NavBarViewController.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 08/01/2023.
//

import UIKit

class NavBarViewController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    private func config() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: NavBarResources.Colors.titleGray,
            .font: NavBarResources.Fonts.HelveticaRegular(size: 17)
        ]
        navigationBar.addBottomBorder(color: TabBarResources.Colors.separator, height: 1)
    }
}
