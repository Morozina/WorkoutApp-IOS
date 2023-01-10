//
//  OverViewNavBar.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 09/01/2023.
//

import UIKit

final class OverviewNavBar: BaseView {
    private let addButton = UIButton()
    private let allWorkoutButton = WAButton(type: .secondary)
    private let titleLabel = UILabel()
    private let weekView = WeekView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(color: Resources.Colors.TabBar.separator, height: 1)
    }
}

extension OverviewNavBar {
    override func setUpViews() {
        super.setUpViews()
        addNewView(allWorkoutButton)
        addNewView(addButton)
        addNewView(titleLabel)
        addNewView(weekView)
    }
    
    override func setUpLayouts() {
        super.setUpLayouts()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            allWorkoutButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutButton.widthAnchor.constraint(equalToConstant: 130),
            
            titleLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: addButton.trailingAnchor),
            weekView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    override func config() {
        super.config()
        backgroundColor = .white
        
        titleLabel.text = Resources.Strings.TabBar.overview
        titleLabel.textColor = Resources.Colors.NavBar.titleGray
        titleLabel.font = Resources.Fonts.NavBar.HelveticaRegular(size: 22)
        
        addButton.setImage(Resources.Image.Common.add, for: .normal)
        addButton.tintColor = Resources.Colors.TabBar.active
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)

        allWorkoutButton.makeSystem(allWorkoutButton)
        allWorkoutButton.setTitle(Resources.Strings.OverviewController.allWorkoutButton)
        allWorkoutButton.addTarget(self, action: #selector(allWorkoutTapped), for: .touchUpInside)
    }
}

@objc extension OverviewNavBar {
    private func allWorkoutTapped() {
        print("Tapped")
    }
    
    private func addButtonTapped() {
        print("Tapped")
    }
}
