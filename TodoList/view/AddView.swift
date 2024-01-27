//
//  AddView.swift
//  TodoList
//
//  Created by TranHao on 09/01/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textField:String=""
    
    @State var alerTitle:String=""
    @State var showAlert:Bool=false
    
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        ScrollView{
            TextField("Nhập tên công việc...", text: $textField)
                .focused($isTextFieldFocused)
                .padding([.leading,.trailing],10)
                .frame( height: 50)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
            
            Button {
                saveItem()
            } label: {
                Text("Lưu".uppercased())
                    .foregroundColor(.white)
                    .frame(height:30)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(5)
                    
            }
        }
        .padding([.leading,.trailing],10)
        .navigationTitle("Thêm công việc ✍️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveItem() {
        if (checkTitle()){
            listViewModel.addItem(nameItem: textField)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func checkTitle() -> Bool {
        if(textField.trimmingCharacters(in: .whitespacesAndNewlines).count < 2){
            alerTitle = "Tên công việc phải có độ dài ít nhất 2 ký tự 🔔"
            showAlert.toggle()
            isTextFieldFocused=true
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alerTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .preferredColorScheme(.dark)
//        .environmentObject(ListViewModel())
    }
}
