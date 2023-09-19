//
//  Color.swift
//  TDZ2023
//
//  Created by J. DeWeese on 9/19/23.
//

import SwiftUI
import Foundation


extension Color {
    
    static let theme = ColorTheme( )
    static let launch = LaunchTheme( )
}


struct ColorTheme {
    
    let colorAccent = Color("AccentColor")
    let colorSecondaryText = Color("SecondaryTextColor")
    let colorGreen = Color("ColorGreen")
    let colorRed = Color("ColorRed")
    let colorOrange = Color("ColorOrange")
    let colorBlue = Color("ColorBlue")
    let colorGrey = Color("ColorGrey")
    let colorGray = Color("ColorGray")
    let colorBlack = Color("ColorBlack")
    let colorBackground = Color("ColorBackground")
    let twitter = Color("ColorTwitter")
    let colorPurple = Color("ColorPurple")
}

struct LaunchTheme {
    
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
    
}

