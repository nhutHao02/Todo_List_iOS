//
//  ListView.swift
//  TodoList
//
//  Created by TranHao on 03/01/2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        ScrollView{
            if listViewModel.items.isEmpty{
                Text("Không có công việc nào 🎉🎉🎉")
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }else{
                List{
                    ForEach(listViewModel.items){item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateIsCompletedItem(item: item)
                                }
                            }
                            .onTapGesture(count: 2) {
                                withAnimation(.linear){
                                    
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.delete)
                    .onMove(perform: listViewModel.move)
                }
            }
        }
        .padding()
        .navigationTitle("Todo List 📝")
        .navigationBarItems(leading: EditButton(),trailing: NavigationLink("Add",destination: AddView()))
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
