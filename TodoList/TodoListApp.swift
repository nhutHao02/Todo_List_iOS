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
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
        }
    }
}
