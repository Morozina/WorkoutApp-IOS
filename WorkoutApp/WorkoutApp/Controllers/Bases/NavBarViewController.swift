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
            .foregroundColor: Resources.Colors.NavBar.titleGray,
            .font: Resources.Fonts.NavBar.HelveticaRegular(size: 17)
        ]
        navigationBar.addBottomBorder(color: Resources.Colors.TabBar.separator, height: 1)
    }
}
