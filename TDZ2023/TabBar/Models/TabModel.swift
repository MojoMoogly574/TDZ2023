//
//  TasbModel.swift
//  TDZ2023
//
//  Created by J. DeWeese on 9/19/23.
//

import SwiftUI

/// App Tab's
enum Tab: String, CaseIterable {
    
    case feed = "Home "
    case workout = "Workout"
    case messages = "Messages"
   
    
    var systemImage: String {
        switch self {
        case .feed:
            return "house"
        case .workout:
            return "figure.cross.training"
        case .messages:
            return "person.3"
       
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}

