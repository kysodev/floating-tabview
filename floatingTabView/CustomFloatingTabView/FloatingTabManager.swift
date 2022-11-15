//  FloatingTabViewController.swift
//  Created by Sebastian Whitfield on 11/11/2022.
import Foundation

/// Controls the active and last tab used by the FloatingTabView.
class FloatingTabManager: ObservableObject {
    static let shared = FloatingTabManager()
    
    @Published var activeTab = FloatingTabOption.home
    @Published var lastActiveTab = FloatingTabOption.home
    
    func openNewTab(_ tabOption: FloatingTabOption) {
        self.activeTab = tabOption
    }
}
