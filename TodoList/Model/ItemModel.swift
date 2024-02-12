//
//  ItemModel.swift
//  TodoList
//
//  Created by Mohamed Osama on 27/01/2024.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String
    let title: String
    var isCompleted: Bool

    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }

    func updateItem() -> Self {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
