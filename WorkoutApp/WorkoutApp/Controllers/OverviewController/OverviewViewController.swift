//
//  OverviewViewController.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 08/01/2023.
//

import UIKit

class OverviewViewController: BaseViewController {

    let allWorkoutButton = SecondaryButton()
    
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
        
        view.addSubview(allWorkoutButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            allWorkoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            allWorkoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allWorkoutButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutButton.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    override func config() {
        super.config()
        
        view.makeSystem(allWorkoutButton)
        allWorkoutButton.setTitle(Resources.Strings.OverviewController.allWorkoutButton)
        allWorkoutButton.translatesAutoresizingMaskIntoConstraints = false
        allWorkoutButton.addTarget(self, action: #selector(allWorkoutTapped), for: .touchUpInside)
    }
}

@objc extension OverviewViewController {
    func allWorkoutTapped() {
        print("Tapped")
    }
}
