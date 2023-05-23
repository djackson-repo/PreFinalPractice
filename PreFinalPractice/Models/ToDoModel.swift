//
//  ToDoModel.swift
//  PreFinalPractice
//
//  Created by Dylan Jackson on 4/24/23.
//

import Foundation
struct ToDo : Decodable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
