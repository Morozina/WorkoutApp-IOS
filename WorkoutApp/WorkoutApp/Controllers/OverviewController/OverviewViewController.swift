//
//  OverviewViewController.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 08/01/2023.
//

import UIKit

class OverviewViewController: BaseViewController {

    private let navBar = OverviewNavBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        layoutViews()
        config()
    }
}

extension OverviewViewController {
    
    override func addViews() {
        super.addViews()
        
        view.addView(navBar)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    
    override func config() {
        super.config()
        
        navigationController?.navigationBar.isHidden = true
    }
}
