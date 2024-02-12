//
//  ListRowView.swift
//  TodoList
//
//  Created by Mohamed Osama on 27/01/2024.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(8)
    }
}

struct ListRowViewPreview: PreviewProvider {

    static let firstItem = ItemModel(title: "This is the first item!", isCompleted: false)
    static let secondItem = ItemModel(title: "This is the second item!", isCompleted: true)

    static var previews: some View {
        Group {
            ListRowView(item: firstItem)
            ListRowView(item: secondItem)
        }.padding(.vertical, 8)
        .previewLayout(.sizeThatFits)
    }
}
