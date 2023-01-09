//
//  Colors.swift
//  WorkoutApp
//
//  Created by Vladyslav Moroz on 08/01/2023.
//

import UIKit

enum TabBarResources {
    
    enum Colors {
            static var active = UIColor(hexString: "#437BFE")
            static var inActive = UIColor(hexString: "#929DA5")
            static var separator = UIColor(hexString: "#E8ECEF")
    }
    
    enum Strings {
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
    }
    
    enum Image {
            static var overview = UIImage(named: "overview_bar")
            static var session = UIImage(named: "session_bar")
            static var progress = UIImage(named: "progress_bar")
            static var settings = UIImage(named: "settings_bar")
        }
}

enum NavBarResources {
    
    enum Colors {
        static var titleGray = UIColor(hexString: "#545C77")
        static var background = UIColor(hexString: "#F8F9F9")
    }
    
    enum Fonts {
        static func HelveticaRegular(size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}

enum CommonResources {
    enum Image {
        static var down_arrow = UIImage(named: "down_arrow")
    }
    
    enum Colors {
        static var customButtonBackground = UIColor(hexString: "#F0F3FF")
    }
}

enum OverviewControllerResources {
    enum Strings {
        static let allWorkoutButton = "All Workout"
    }
}
