//  FloatingTabItemView.swift
//  Created by Sebastian Whitfield on 11/11/2022.
import Foundation
import SwiftUI

struct FloatingTabItemView: View {
    let helper = FloatingTabViewHelper.shared
    let tabItem: FloatingTabItem
    var isSelected: Bool
    
    var selectedColor: Color { helper.selectedItemTintColor }
    var unselectedColor: Color { helper.unselectedItemTintColor }
    
    var body: some View {
        VStack {
            Image(systemName: isSelected ? tabItem.selectedImageName : tabItem.unselectedImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top, 10)
            Text(tabItem.title)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
            Spacer()
        }
        .foregroundColor(isSelected ? selectedColor : unselectedColor)
        .font(.system(.footnote, design: .rounded, weight: .medium))
    }
}
