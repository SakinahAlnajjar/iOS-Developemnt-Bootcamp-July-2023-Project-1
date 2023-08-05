//
//  ItemModel.swift
//  iOS-Developemnt-Bootcamp-July-2023-Project-1
//
//  Created by سكينه النجار on 04/08/2023.
//

import Foundation

struct ItemModel : Identifiable, Codable {
    var id :String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
    
