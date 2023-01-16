//
//  SessionViewController.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 08/01/2023.
//

import UIKit

class SessionViewController: BaseViewController {
    
    private let timerView = TimerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        setUpLayouts()
        config()
        
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session
        
        addBarButton(position: .left, title: "Play")
        addBarButton(position: .right, title: "Finish")
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
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
    
    override func config() {
        super.config()
        timerView.configTimer(duration: 0, progress: 0)
        
    }
    
    override func rightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStoped
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(leftButtonHandler))
    }
    
    override func leftButtonHandler() {
        if timerView.state == .isStarted {
            timerView.pauseTimer()
            timerView.state = .isPaused
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(leftButtonHandler))
        } else {
            timerView.configTimer(duration: timerView.timerDur, progress: 0)
            timerView.callBack = {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
                    self.timerView.stopTimer()
                    self.timerView.state = .isStoped
                    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(leftButtonHandler))
                }
            }
            
            timerView.startTimer()
            timerView.state = .isStarted
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Pause", style: .plain, target: self, action: #selector(leftButtonHandler))
        }
    }
}
