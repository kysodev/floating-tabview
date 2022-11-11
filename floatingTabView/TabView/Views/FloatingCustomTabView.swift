//  FloatingCustomTabView.swift
//  Created by Sebastian Whitfield on 11/11/2022.
import Foundation
import SwiftUI

struct FloatingCustomTabView<Content: View>: View {
    var tabItems: [FloatingTabItem]
    @Binding var selectedTab: FloatingTabOption
    @ViewBuilder let content: (FloatingTabItem) -> Content
    
    @State var blurIsVisible = FloatingTabViewHelper.shared.blurIsVisible
    @State var shouldShowPopoutMenu: Bool = false
    
    
    /// To add nice custom animations, consider adding a .zIndex value to each item in the ZStack.
    var body: some View {
        ZStack {
            /// Called from the FloatingTabView.swift body.
            /// 1. After looping through the FloatingTabOption items, return the content inside the TabView.
            TabView(selection: $selectedTab) {
                ForEach(tabItems, id: \.id) { tabItem in
                    content(tabItem)
                }
            }
            
            /// 2. Add the blurred to the view
            if blurIsVisible {
                Rectangle()
                    .fill(Color.blue.gradient.opacity(0.5))
//                    .fill(.ultraThinMaterial.opacity(0.7))
                    .transition(.asymmetric(insertion: .opacity, removal: .opacity))
            }
            
            
            /// Add the actual FloatingTabBottomView to the top of the ZStack.
            VStack {
                Spacer()
                FloatingTabBottomView(tabBarItems: tabItems, selectedItem: $selectedTab, shouldShowPopoutMenu: $shouldShowPopoutMenu, shouldShowBlur: $blurIsVisible)
                    .shadow(radius: 5)
            }
            .padding(.bottom, 16)
        }
        .ignoresSafeArea(.all)
    }
}



