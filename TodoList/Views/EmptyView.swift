//
//  EmptyView.swift
//  TodoList
//
//  Created by Mohamed Osama on 12/02/2024.
//

import SwiftUI

struct EmptyView: View {

    @State var animate: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("No Items Founded !!")
                    .font(.title)
                    .fontWeight(.semibold)

                Text("Combining tasks, projects, comments, attachments, notifications, and more, Todo list lets users streamline their personal and team productivity and work more effectively.")
                    .foregroundStyle(.gray)
                    .fontWeight(.regular)
                    .padding(.bottom, 10)

                NavigationLink(destination: AddView()) {
                    Text("Add Something🚀🥳")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red : Color.blue)
                        .cornerRadius(10)
                }
                .padding(animate ? 20 : 30)
                .scaleEffect(x: animate ? 1.1 : 1.0)
                .shadow(color: animate ? .red.opacity(0.2) : .blue.opacity(0.2),
                        radius: 5,
                        x: 0,
                        y: animate ? 50 : 30)
                .offset(
                    x: 0,
                    y: animate ? -7 : 0
                )
            }
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(50)
        .onAppear(perform: animateView)
    }

    private func animateView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct EmptyViewPreview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EmptyView()
                .navigationTitle("Title")
        }
    }
}
