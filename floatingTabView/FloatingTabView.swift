//  FloatingTabView.swift
//  Created by Sebastian Whitfield on 11/11/2022.
import SwiftUI

struct FloatingTabView: View {
    @StateObject var tabController = FloatingTabManager.shared
        
    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.shadowColor = nil
        tabBarAppearance.backgroundEffect = nil
        tabBarAppearance.backgroundColor = UIColor.clear
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some View {
        FloatingCustomTabView(tabItems: FloatingTabOption.allCases.map { $0.tabItem }, selectedTab: $tabController.activeTab) { tabItem in
            if let tabItemIndex = tabItem.id {
                returnTabView(for: FloatingTabOption(rawValue: tabItemIndex) ?? .settings)
            }
        }
    }
    
    // MARK: View builder for each FloatingTabOption.
    @ViewBuilder
    func returnTabView(for tabOption: FloatingTabOption) -> some View {
        switch tabOption {
        case .home:
            NavigationView {
                List {
                    Section {
                        Text("Example .large display mode")
                    }
                }
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.large)
            }
            .tag(FloatingTabOption.home)
            .transition(.move(edge: .bottom))
            
        case .info:
            VStack(spacing: 20) {
                Spacer()
                Text("Infomation view")
                    .font(.system(.largeTitle, design: .rounded, weight: .bold))
                    .foregroundColor(Color.primary)
                Text("Example VStack")
                    .lineLimit(2)
                    .font(.system(.callout, design: .rounded, weight: .medium))
                    .minimumScaleFactor(0.6)
                Spacer()
            }
            .padding()
            .tag(FloatingTabOption.info)
            .transition(.move(edge: .bottom))
            
        case .settings:
            NavigationView {
                List {
                    Section {
                        Text("Example .inline display mode")
                    } header: {
                        Text("")
                    }
                }
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.inline)
            }
            .tag(FloatingTabOption.settings)
            .transition(.move(edge: .bottom))
        
        // Custom Popout views:
        case .newItem:
            Text("Example Popout\n menu View")
                .lineLimit(2)
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .minimumScaleFactor(0.6)
                .multilineTextAlignment(.center)
                .tag(FloatingTabOption.newItem)
                .transition(.move(edge: .bottom))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTabView()
    }
}
