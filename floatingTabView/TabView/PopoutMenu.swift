//  PopoutMenu.swift
//  Created by Sebastian Whitfield on 11/11/2022.
import Foundation
import SwiftUI

struct PopoutMenu: View {
    private let helper = FloatingTabViewHelper.shared
    
    @Binding var isPresented: Bool
    @Binding var selectedItem: FloatingTabOption
    var yOffset: CGFloat {
        isPresented ? -65 : .zero
    }
    var opacity: Double {
        isPresented ? 1.0 : 0.0
    }
    var text: String {
        isPresented ? "New item" : ""
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Button {
                    self.selectedItem = .newItem
                } label: {
                    Text(text)
                        .foregroundColor(isPresented ? (selectedItem == .newItem ? Color.blue : .primary) : Color.clear)
                        .lineLimit(1)
                        .font(.system(.body, design: .rounded, weight: .medium))
                        .minimumScaleFactor(0.6)
                        .padding()
                        .background(
                            Rectangle()
                                .fill(Color(uiColor: .systemBackground))
                                .cornerRadius(30)
                        )
                        .shadow(radius: 5)
                }
            }.offset(x: helper.popoutMenuButtonYPosition, y: yOffset)
        }
    }
}
