//
//  TodoListApp.swift
//  TodoList
//
//  Created by Mohamed Osama on 26/01/2024.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var viewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            ListView()
        }
        .environmentObject(viewModel)
    }
}
