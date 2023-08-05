//
//  iOS_Developemnt_Bootcamp_July_2023_Project_1App.swift
//  iOS-Developemnt-Bootcamp-July-2023-Project-1
//
//  Created by سكينه النجار on 04/08/2023.
//

import SwiftUI

@main
struct iOS_Developemnt_Bootcamp_July_2023_Project_1App: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView(filteredItems: listViewModel)
            }.environmentObject(listViewModel)
        }
    }
}
