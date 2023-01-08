//
//  Colors.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 08/01/2023.
//

import UIKit

enum Resources {
    
    enum Colors {
        enum TabBar {
            static var active = UIColor(hexString: "#437BFE")
            static var inActive = UIColor(hexString: "#929DA5")
            static var separator = UIColor(hexString: "#E8ECEF")
        }
    }
    
    enum Strings {
        enum TabBar {
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
        }
    }
    
    enum Image {
        enum TabBar {
            static var overview = UIImage(named: "overview_bar")
            static var session = UIImage(named: "session_bar")
            static var progress = UIImage(named: "progress_bar")
            static var settings = UIImage(named: "settings_bar")
        }
    }
}
