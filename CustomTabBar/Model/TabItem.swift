//
//  TabItem.swift
//  CustomTabBar
//
//  Created by François-Xavier on 03/06/2024.
//

import Foundation
import SwiftUI

// Enumeration defining the different tabs with titles and images
enum TabItem: CaseIterable {
    case favoris
    case home
    case search
    case profil
    
    // Title for each tab
    var title: String {
        switch self {
        case .favoris: "Favoris"
        case .home: "Home"
        case .search: "Search"
        case .profil: "Profil"
        }
    }
    
    // Image name for each tab
    var image: String {
        switch self {
        case .favoris: "star.fill"
        case .home: "house"
        case .search: "magnifyingglass"
        case .profil: "person"
        }
    }
}
