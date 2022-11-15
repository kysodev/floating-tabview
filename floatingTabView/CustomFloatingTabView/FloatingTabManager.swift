//  FloatingTabViewController.swift
//  Created by Sebastian Whitfield on 11/11/2022.
import Foundation

class FloatingTabManager: ObservableObject {
    static let shared = FloatingTabManager()
    
    @Published var activeTab = FloatingTabOption.home
    @Published var lastActiveTab = FloatingTabOption.home
//    @Published var showRoot = true
//    @Published var showTabRoots = TabOption.allCases.map { _ in
//        false
//    }
    
    func openNewTab(_ tabOption: FloatingTabOption) {
        self.activeTab = tabOption
    }
}
