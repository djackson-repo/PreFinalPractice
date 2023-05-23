//
//  PhotoModel.swift
//  PreFinalPractice
//
//  Created by Dylan Jackson on 4/24/23.
//

import Foundation
struct Photo: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
