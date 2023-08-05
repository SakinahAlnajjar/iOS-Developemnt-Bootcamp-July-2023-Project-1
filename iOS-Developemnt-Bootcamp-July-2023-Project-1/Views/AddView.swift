//
//  AddView.swift
//  iOS-Developemnt-Bootcamp-July-2023-Project-1
//
//  Created by سكينه النجار on 04/08/2023.
//

import SwiftUI
import Foundation

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var txtField: String = ""
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("task title", text: $txtField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.white)
                    .cornerRadius(10)
                
                Button {
                    saveButton()
                } label: {
                    Text("Save" .uppercased() )
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                }
            }.padding(14)
        }.navigationTitle("Add Item")
    }
    
    func saveButton(){
        listViewModel.addItems(title: txtField)
        presentationMode.wrappedValue.dismiss()
    }
}
    
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }.environmentObject(ListViewModel())
    }
}
