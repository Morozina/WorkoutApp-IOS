//
//  baseView.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 09/01/2023.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
        setUpLayouts()
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@objc extension BaseView {
    
    func setUpViews() {}
    
    func setUpLayouts() {}
    
    func config() {}
}
