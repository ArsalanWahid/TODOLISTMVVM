//
//  TODOLISTMVVMApp.swift
//  TODOLISTMVVM
//
//  Created by Arsalan Wahid Asghar on 9/29/24.
//

import SwiftUI

@main
struct TODOLISTMVVMApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }.environmentObject(listViewModel)
            
            
        }
    }
}
