//
//  WeekDayView.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 10/01/2023.
//

import UIKit

final class WeekDayView: BaseView {
    private let stackView = UIStackView()
    private let TitleOfDay = UILabel()
    private let NumberOfDay = UILabel()
    
    func configuration(weekNumber: Int, weekTitle: String) {
        let startOfWeek = Date().startOfWeek
        let currentDay = startOfWeek.goForward(days: weekNumber)
        let day = Date.calendar.component(.day, from: currentDay)
        
        let isCurrentDate = currentDay.stripDate() == Date().stripDate()

        backgroundColor = isCurrentDate ? Resources.Colors.TabBar.active : Resources.Colors.NavBar.background
        
        TitleOfDay.text = weekTitle.uppercased()
        TitleOfDay.textColor = isCurrentDate ? .white : Resources.Colors.TabBar.inActive
        
        NumberOfDay.text = "\(day)"
        NumberOfDay.textColor = isCurrentDate ? .white : Resources.Colors.TabBar.inActive
    }
}
extension WeekDayView {
    
    override func setUpViews() {
        super.setUpViews()
        addNewView(stackView)
        stackView.addArrangedSubview(TitleOfDay)
        stackView.addArrangedSubview(NumberOfDay)
    }
    
    override func setUpLayouts() {
        super.setUpLayouts()
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    override func config() {
        super.config()
        
        stackView.axis = .vertical
        stackView.spacing = 3
        
        TitleOfDay.textAlignment = .center
        TitleOfDay.font = Resources.Fonts.NavBar.HelveticaRegular(size: 10)
        
        NumberOfDay.textAlignment = .center
        NumberOfDay.font = Resources.Fonts.NavBar.HelveticaRegular(size: 15)
    }
}
