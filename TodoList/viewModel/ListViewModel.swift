//
//  ListViewModel.swift
//  TodoList
//
//  Created by TranHao on 26/01/2024.
//

import Foundation
class ListViewModel: ObservableObject{
    @Published var items:[ItemModel]=[] {
        didSet{
            saveItems()
        }
    }
    let itemsKey:String = "items_list"
    init() {
        getItems()
    }
    func getItems() {
//        let newItems=[
//            ItemModel(title: "Công việc 1", isCompleted: true),
//            ItemModel(title: "Công việc 2", isCompleted: false),
//            ItemModel(title: "Công việc 3", isCompleted: false)]
//        items.append(contentsOf: newItems)
        guard
            let getData = UserDefaults.standard.data(forKey: itemsKey),
            let decodeData = try? JSONDecoder().decode([ItemModel].self, from: getData)
        else {return}
        
        self.items = decodeData
    }
    func delete(indexSet:IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func move(indexS:IndexSet, newIndex:Int){
        items.move(fromOffsets: indexS, toOffset: newIndex)
    }
    func addItem(nameItem:String) {
        items.append(ItemModel(title: nameItem, isCompleted: false))
    }
    func updateIsCompletedItem(item:ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index]=item.updateCompleted()
        }
    }
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
}
