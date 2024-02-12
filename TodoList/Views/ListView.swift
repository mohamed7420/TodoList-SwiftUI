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
            .navigationTitle("TodoList")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                CustomToolbar()
            }
        }
    }
}

struct CustomToolbar: View {
    @State var savedText: String = ""
    var body: some View {
        NavigationView { }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

#Preview {
    NavigationView {
        ListView()
    }.environmentObject(ListViewModel())
}
