//  FloatingTabHelper.swift
//  Created by Sebastian Whitfield on 11/11/2022.
import Foundation
import SwiftUI

class FloatingTabViewHelper: ObservableObject {
    static let shared = FloatingTabViewHelper()
    
    // MARK: Properties and initializers:
    @Published var blurIsVisible: Bool = false
    @Published var popoutMenuBoundsAnchor: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    // to be set by FloatingTabBottomView.swift
    @Published var popoutMenuLeadingAnchor: CGFloat = 0.0

    // TabView:
    public var cornerRadius: CGFloat { return 30.0 }
    public var tabViewHeight: CGFloat { return 60.0 }
    public var tabViewWidth: CGFloat { return UIScreen.main.bounds.width - 32.0 }
    public var tabViewXposition: CGFloat { return UIScreen.main.bounds.width / 2 }
    public var tabViewYposition: CGFloat {
        let deviceHeight = UIScreen.main.bounds.height
        let padding = 30.0
        return (deviceHeight - self.tabViewHeight / 2) - padding
    }
    
    public var selectedItemTintColor: Color { return Color.blue }
    public var unselectedItemTintColor: Color { return Color.primary }
    
    // Popout button:
    public var popoutMenuButtonWidth: CGFloat { return tabViewWidth * 0.3 }
    public var popoutMenuButtonHeight: CGFloat { return tabViewHeight * 0.7 }
    public var popoutMenuButtonYPosition: CGFloat { return -35 }
    public var popoutMenuButtonXPosition: CGFloat { return (popoutMenuButtonXCenter - 32) / 2 }
    public var popoutMenuButtonXCenter: CGFloat { return UIScreen.main.bounds.width - 32 }
    
    func returnSystemImageName(for popoutMenuIsVisible: Bool) -> String {
        return popoutMenuIsVisible ? "arrow.down.circle.fill" : "plus.circle"
    }
    
    func returnString(for popoutMenuIsVisible: Bool) -> String {
        popoutMenuIsVisible ? "Close" : "New"
    }
}
