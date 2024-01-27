//
//  TodoListApp.swift
//  TodoList
//
//  Created by TranHao on 03/01/2024.
//

import SwiftUI
/* MVVM Architecture*/

@main
struct TodoListApp: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
