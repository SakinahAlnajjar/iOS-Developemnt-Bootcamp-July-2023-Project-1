//
//  ListView.swift
//  iOS-Developemnt-Bootcamp-July-2023-Project-1
//
//  Created by سكينه النجار on 04/08/2023.
//

import SwiftUI

//Main View
struct ListView: View {
    
    @State var searchText: String = ""
    @State var filteredItems: ListViewModel = ListViewModel()
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search", text: $searchText)
                    .frame(height: 40)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(12)
            
            List {
                ForEach(listViewModel.items){ item in
                    ListRowView(items: item)
                }
                .onDelete (perform: listViewModel.deleteItems)
                .onMove(perform: listViewModel.moveItems)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("To-do List 🗒️")
            .navigationBarItems(leading: EditButton(),
                                trailing: NavigationLink("Add", destination: AddView()))
        }
        .padding()
        .onAppear() {
            filteredItems = listViewModel
        }
        //        .onChange(of: searchText) { newValue in
        //            if newValue.isEmpty {
        //                filteredItems = listViewModel
        //            } else {
        //                filteredItems.items =  listViewModel.items.filter({ item in
        //                    item.title.contains(newValue)
        //                })
        //            }
        //        }
    }
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                ListView()
            }.environmentObject(ListViewModel())
        }
    }
}
