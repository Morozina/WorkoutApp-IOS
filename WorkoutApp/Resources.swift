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
            static let active = UIColor(hexString: "#437BFE")
            static let inActive = UIColor(hexString: "#929DA5")
            static let separator = UIColor(hexString: "#E8ECEF")
        }
        
        enum NavBar {
            static let titleGray = UIColor(hexString: "#545C77")
            static let background = UIColor(hexString: "#F8F9F9")
        }
        
        enum Common {
            static let customButtonBackground = UIColor(hexString: "#F0F3FF")
        }
    }
    
    enum Strings {
        
        enum TabBar {
            static let overview = "Overview"
            static let session = "Session"
            static let progress = "Progress"
            static let settings = "Settings"
        }
        
        enum OverviewController {
            static let allWorkoutButton = "All Workout"
        }
    }
    
    enum Image {
        
        enum TabBar {
            static let overview = UIImage(named: "overview_bar")
            static let session = UIImage(named: "session_bar")
            static let progress = UIImage(named: "progress_bar")
            static let settings = UIImage(named: "settings_bar")
        }
        
        enum Common {
            static let add = UIImage(named: "add_button")
            static let down_arrow = UIImage(named: "down_arrow")
        }
    }
    
    enum Fonts {
        enum NavBar {
            static func HelveticaRegular(size: CGFloat) -> UIFont {
                UIFont(name: "Helvetica", size: size) ?? UIFont()
            }
        }
    }
}
