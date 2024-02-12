//
//  AddView.swift
//  TodoList
//
//  Created by Mohamed Osama on 27/01/2024.
//

import SwiftUI

struct AddView: View {
    @State var titleText: String = ""
    @EnvironmentObject var viewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $titleText)
                    .foregroundStyle(.black)
                    .bold()
                    .padding()
                    .background(
                        Color.gray.opacity(0.15)
                    )
                    .cornerRadius(10.0)
                    .padding()
                Button(action: addItem, label: {
                    Text("SAVE")
                        .bold()
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(
                            Color.blue.ignoresSafeArea()
                        )
                        .cornerRadius(10.0)
                        .padding([.horizontal], 18)
                })
                .alert("Warning!!", isPresented: $showAlert) {
                    Button(action: {

                    }, label: {
                        Text("DONE ✅")
                    })

                } message: {
                    Text(alertTitle)
                }

            }
        }
        .navigationTitle("Add Note 📝")
    }

    private func addItem() {
        guard titleText.count > 3 else {
            alertTitle = "Please type at least 4 characters"
            showAlert.toggle()
            return
        }
        viewModel.saveItem(title: titleText)
        dismiss.callAsFunction()
    }
}

#Preview {
    NavigationView {
        AddView()
    }
}
