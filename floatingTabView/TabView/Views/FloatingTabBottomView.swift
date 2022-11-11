//  FloatingTabBottomView.swift
//  Created by Sebastian Whitfield on 11/11/2022.
import Foundation
import SwiftUI

struct FloatingTabBottomView: View {
    private let helper = FloatingTabViewHelper.shared
    let tabBarItems: [FloatingTabItem]
    @Binding var selectedItem: FloatingTabOption
    @Binding var shouldShowPopoutMenu: Bool
    @Binding var shouldShowBlur: Bool
    
    var colorForPopoutMenu: Color {
        selectedItem == .newItem ? .blue : .primary
    }
    
    var body: some View {
        let _ = Self._printChanges()
        GeometryReader { geo in
            HStack {
                ZStack {
                    /// Popout menu sits behind the TabBar
                    PopoutMenu(isPresented: $shouldShowPopoutMenu, selectedItem: $selectedItem)
                        .frame(width: helper.tabViewWidth, height: helper.tabViewHeight)
                    
                    HStack {
                        Spacer()
                        
                        // Home button:
                        Button {
                            self.selectedItem = FloatingTabOption.home
                            print("Home button is tapped")
                        } label: {
                            FloatingTabItemView(tabItem: tabBarItems[0], isSelected: selectedItem == .home)
                        }
                        
                        
                        // Popout menu button:
                        Spacer()
                        Button {
                            withAnimation(.spring()) {
                                shouldShowPopoutMenu.toggle()
                            }
                        } label: {
                            VStack {
                                Image(systemName: helper.returnSystemImageName(for: shouldShowPopoutMenu))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding(.top, 10)
                                Text(helper.returnString(for: shouldShowPopoutMenu))
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.6)
                                    .onAppear {
                                        let globalLeadingAnchor: CGFloat = geo.frame(in: .global).midX
                                        helper.popoutMenuLeadingAnchor = globalLeadingAnchor
                                    }
                                Spacer()
                            }
                            .foregroundColor(colorForPopoutMenu)
                            .font(.system(.footnote, design: .rounded, weight: .medium))
                        }
                
                        
                        // Info button:
                        Spacer()
                        Button {
                            self.selectedItem = FloatingTabOption.info
                        } label: {
                            FloatingTabItemView(tabItem: tabBarItems[1], isSelected: selectedItem == .info)
                        }
                        
                        // Settings button:
                        Spacer()
                        Button {
                            self.selectedItem = FloatingTabOption.settings
                        } label: {
                            FloatingTabItemView(tabItem: tabBarItems[2], isSelected: selectedItem == .settings)
                        }
                        Spacer()
                    }
                    .frame(width: helper.tabViewWidth, height: helper.tabViewHeight)
                    .background()
                    .cornerRadius(30, antialiased: false)
                    .shadow(radius: 6, x: 0, y: 6)
                }
            }
            .position(x: helper.tabViewXposition, y: helper.tabViewYposition)
            .onChange(of: selectedItem) { newValue in
                withAnimation(.easeIn) {
                    if shouldShowPopoutMenu {
                        shouldShowBlur = false
                        shouldShowPopoutMenu = false
                    }
                }
            }
            .onChange(of: shouldShowPopoutMenu) { newValue in
                withAnimation(.easeInOut) {
                    switch newValue {
                    case true: shouldShowBlur = true
                    case false: shouldShowBlur = false
                    }
                }
            }
        }
    }
}

fileprivate struct TabItemButton: View {
    var destinationView: FloatingTabOption
    var tabItem: FloatingTabItem
    
    var body: some View {
        HStack {
            Spacer()
            
        }
    }
}
