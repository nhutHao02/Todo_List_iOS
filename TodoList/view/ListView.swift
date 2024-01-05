//
//  ListView.swift
//  TodoList
//
//  Created by TranHao on 03/01/2024.
//

import SwiftUI

struct ListView: View {
    @State var items:[String]=["Công việc 1","Công việc 2","Công việc 3"]
    var body: some View {
        List{
            ForEach(items, id: \.self){ item in
                ListRowView(title: item)
            }
            .onDelete { indexSet in
                delete(indexSet: indexSet)
            }
        } 
        .navigationTitle("Todo List 📝")
    }
    func delete(indexSet:IndexSet){
        items.remove(atOffsets: indexSet)
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
    }
}
