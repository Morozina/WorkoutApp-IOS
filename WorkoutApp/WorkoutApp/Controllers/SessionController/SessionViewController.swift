//
//  SessionViewController.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 08/01/2023.
//

import UIKit

class SessionViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = TabBarResources.Strings.session
        
        addBarButton(position: .left, title: "Play")
        addBarButton(position: .right, title: "Pause")
    }
}
