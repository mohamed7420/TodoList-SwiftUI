//
//  ListView.swift
//  TodoList
//
//  Created by Mohamed Osama on 26/01/2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    var body: some View {
        NavigationView {
            ZStack {
                if listViewModel.items.isEmpty {
                    EmptyView()
                } else {
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.bouncy) {
                                        listViewModel.updateItemCompletion(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.removeItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("TodoList📝")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                        .bold()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add", destination: AddView())
                        .bold()
                }
            }
        }
    }
}

struct ListViewPreview: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(ListViewModel())
    }
}
