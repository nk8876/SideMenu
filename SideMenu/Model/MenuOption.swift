//
//  MenuOption.swift
//  SideMenu
//
//  Created by Dheeraj Arora on 17/09/19.
//  Copyright © 2019 Dheeraj Arora. All rights reserved.
//

import UIKit
enum MenuOption: Int, CustomStringConvertible {
    case Profile
    case Inbox
    case Notifications
    case Settings
    
    var description: String{
        switch self {
        case .Profile:
            return "Profile"
        case .Inbox:
            return "Inbox"
        case .Notifications:
            return "Notifications"
        case .Settings:
            return "Settings"
        
        }
    }
    
    var image: UIImage{
        switch self {
        case .Profile:
            return UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
        case .Inbox:
            return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case .Notifications:
            return UIImage(named: "notification_important_white_18pt_1x") ?? UIImage()
        case .Settings:
            return UIImage(named: "baseline_settings_white_24dp") ?? UIImage()
            
        }
    }
}
