//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 10/01/2023.
//

import UIKit

final class WeekView: BaseView {
    private let stackView = UIStackView()
}

extension WeekView {
    
    override func setUpViews() {
        super.setUpViews()
        addNewView(stackView)
        
    }
    
    override func setUpLayouts() {
        super.setUpLayouts()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func config() {
        super.config()
            
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        
        var weekDays = Date.calendar.shortStandaloneWeekdaySymbols
        
        if Date.calendar.firstWeekday == 2 {
            let sun = weekDays.remove(at: 0)
            weekDays.append(sun)
        }
        
        weekDays.enumerated().forEach { (index, name) in
            let view = WeekDayView()
            view.configuration(weekNumber: index, weekTitle: name)
            stackView.addArrangedSubview(view)
        }
    }
}
