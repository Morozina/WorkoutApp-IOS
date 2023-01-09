//
//  BaseViewController.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 08/01/2023.
//

import UIKit

enum BarButtonPosition {
    case right
    case left
}

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        layoutViews()
        config()
    }
}

@objc extension BaseViewController {
    
    func addViews() {}
    
    func layoutViews() {}
    
    func config() {
        view.backgroundColor = NavBarResources.Colors.background
    }
    
    func rightButtonHandler() {
        print("Pressed RIGHT")
    }
    
    func leftButtonHandler() {
        print("Pressed LEFT")
    }
}

extension BaseViewController {
    func addBarButton(position: BarButtonPosition, title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(TabBarResources.Colors.active, for: .normal)
        button.setTitleColor(TabBarResources.Colors.inActive, for: .disabled)
        button.titleLabel?.font = NavBarResources.Fonts.HelveticaRegular(size: 17)
        
        switch position {
        case .right:
            button.addTarget(self, action: #selector(rightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        case .left:
            button.addTarget(self, action: #selector(leftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
