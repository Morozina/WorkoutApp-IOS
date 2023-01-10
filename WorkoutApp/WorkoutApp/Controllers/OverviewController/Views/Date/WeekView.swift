//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 10/01/2023.
//

import UIKit

final class WeekView: BaseView {
    private let calendar = Calendar.current
    private let stackView = UIStackView()
}

extension WeekView {
    
    override func addViews() {
        super.addViews()
        addView(stackView)
    }
    
    override func addLayout() {
        super.addLayout()
        
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
        
        // Standart week Seems like Sun-Sat
        // we need from Mon-Sun
        // removing sun from first element array and adding on the end of Array
        var weekDays = calendar.shortStandaloneWeekdaySymbols
        let sun = weekDays.removeFirst()
        weekDays.append(sun)
        
        weekDays.enumerated().forEach { (index, name) in
            let view = WeekDayView()
            view.configuration(weekNumber: index, weekTitle: name)
            stackView.addArrangedSubview(view)
        }
    }
}
