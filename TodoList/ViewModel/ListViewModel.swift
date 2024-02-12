//
//  ListViewModel.swift
//  TodoList
//
//  Created by Mohamed Osama on 27/01/2024.
//

import Foundation

final class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []

    init() {
        getAllItems()
    }

    private func getAllItems() {
        let newItems = [
            ItemModel(title: "This is the first item!", isCompleted: false),
            ItemModel(title: "This is the second item!", isCompleted: false),
            ItemModel(title: "this is the third item!", isCompleted: true)
        ]
        items = newItems
    }

    public func removeItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    public func moveItem(indics: IndexSet, offset: Int) {
        items.move(fromOffsets: indics, toOffset: offset)
    }

    public func saveItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.insert(newItem, at: 0)
    }

    public func completeTask(item: inout ItemModel) {
        item.isCompleted = true
    }

    public func updateItemCompletion(item: ItemModel) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[index] = item.updateItem()
    }
}

