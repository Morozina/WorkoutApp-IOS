//
//  SessionViewController.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 08/01/2023.
//

import UIKit

class SessionViewController: BaseViewController {

    private let timerView = BaseInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpLayouts()
        config()
        
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session
        
        addBarButton(position: .left, title: "Play")
        addBarButton(position: .right, title: "Pause")
    }
}

extension SessionViewController {
    
    override func setUpViews() {
        super.setUpViews()
        view.addNewView(timerView)
    }
    
    override func setUpLayouts() {
        super.setUpLayouts()
        
        NSLayoutConstraint.activate([
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func config() {
        super.config()
    }
}
