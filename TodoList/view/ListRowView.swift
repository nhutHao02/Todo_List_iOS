//
//  ListRowView.swift
//  TodoList
//
//  Created by TranHao on 03/01/2024.
//

import SwiftUI

struct ListRowView: View {
    let item:ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
            Text(item.title)
            Spacer()
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(item:ItemModel(title: "Công việc 1", isCompleted: false))
    }
}
