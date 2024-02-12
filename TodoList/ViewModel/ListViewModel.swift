//
//  ListViewModel.swift
//  TodoList
//
//  Created by Mohamed Osama on 27/01/2024.
//

import Foundation

final class ListViewModel: ObservableObject {

    private let items_key = "item_list"
    
    @Published var items: [ItemModel] = [] {
        didSet { 
            saveItems()
        }
    }

    init() {
        getAllItems()
    }

    private func getAllItems() {
        guard
            let data = UserDefaults.standard.data(forKey: items_key),
            let decodedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }

        self.items = decodedItems
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

    private func saveItems() {
        guard let encodedItems = try? JSONEncoder().encode(items) else { return }
        UserDefaults.standard.setValue(encodedItems, forKey: items_key)
        UserDefaults.standard.synchronize()
    }
}

