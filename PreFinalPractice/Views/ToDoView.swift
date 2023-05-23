//
//  ToDoView.swift
//  PreFinalPractice
//
//  Created by Dylan Jackson on 4/24/23.
//

import SwiftUI

struct ToDoView: View {
    @State private var todos:[ToDo] = []
    var body: some View {
        List(todos, id: \.title) { todo in
            if(todo.completed != true) {
                Text("\(todo.id): \(todo.title)")
            }
        }.onAppear(perform: fetch)
    }
    
    
    func fetch() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("Error \(error.localizedDescription)")
                return
            }
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    self.todos = try decoder.decode([ToDo].self, from: data)
                } catch {
                    print("Failed to decode JSON \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
