//  FloatingTabOption.swift
//  Created by Sebastian Whitfield on 11/11/2022.
import Foundation

/// Enum with all TabOption cases used for FloatingTabItem objects.
enum FloatingTabOption: Int, CaseIterable, Identifiable {
    var id: Self { self }
    case home // Rawvalue: Int starts from 0
    case info
    case settings
    
    // Popout menu buttons:
    case newItem
    
    var tabItem: FloatingTabItem {
        switch self {
        case .home:
            return FloatingTabItem(id: 0, title: "Home", unselectedImageName: "house", selectedImageName: "house.fill")
        case .info:
            return FloatingTabItem(id: 1, title: "Info", unselectedImageName: "info.bubble", selectedImageName: "info.bubble.fill")
        case .settings:
            return FloatingTabItem(id: 2, title: "Settings", unselectedImageName: "gearshape", selectedImageName: "gearshape.fill")
            
        case .newItem:
            return FloatingTabItem(id: 3, title: "New", unselectedImageName: "plus.app", selectedImageName: "plus.app.fill")
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .info: return "Info"
        case .settings: return "Settings"
        case .newItem: return "New"
        }
    }
}

/// Model for the tabItem computed property on each case of the FloatingTabOption enum.
struct FloatingTabItem {
    var id: Int
    var title: String
    var unselectedImageName: String
    var selectedImageName: String
}
