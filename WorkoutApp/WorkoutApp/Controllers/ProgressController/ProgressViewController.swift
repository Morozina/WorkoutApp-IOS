//
//  ProgressViewController.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 08/01/2023.
//

import UIKit

class ProgressViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Workout Progress"
        navigationController?.tabBarItem.title = TabBarResources.Strings.progress
        
        addBarButton(position: .left, title: "Export")
        addBarButton(position: .right, title: "Detail")
        
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
}
