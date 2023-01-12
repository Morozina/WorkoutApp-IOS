//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 12/01/2023.
//

import UIKit

final class TimerView: BaseInfoView {
    private let progressBar = ProgressView()
}

extension TimerView {
    
    override func setUpViews() {
        super.setUpViews()
        
        addNewView(progressBar)
    }
    
    override func setUpLayouts() {
        super.setUpLayouts()
        
        NSLayoutConstraint.activate([
            progressBar.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressBar.heightAnchor.constraint(equalTo: progressBar.widthAnchor)
        ])
        
    }
    
    override func config() {
        super.config()
        
        progressBar.drawProgress(percent: 0.0)
    }
}
