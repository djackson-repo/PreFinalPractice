//
//  ContentView.swift
//  PreFinalPractice
//
//  Created by Dylan Jackson on 4/24/23.
//

import SwiftUI

struct ContentView: View {
        var body: some View {
            NavigationView{
            HStack {
                NavigationLink (
                destination: PhotoView()) {
                Text("Photo")
                }.padding()
                NavigationLink (
                destination: ToDoView()) {
                Text("To-Do")
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
