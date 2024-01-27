//
//  ItemModel.swift
//  TodoList
//
//  Created by TranHao on 26/01/2024.
//

import Foundation
import SwiftUI
struct ItemModel: Identifiable, Codable {
    let id:String
    let title:String
    let isCompleted:Bool
    
    init(id:String = UUID().uuidString,title: String, isCompleted: Bool) {
        self.id = id
        self.title=title
        self.isCompleted = isCompleted
    }
    func updateCompleted() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
