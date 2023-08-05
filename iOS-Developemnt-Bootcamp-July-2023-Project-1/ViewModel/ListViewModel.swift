//
//  ListViewModel.swift
//  iOS-Developemnt-Bootcamp-July-2023-Project-1
//
//  Created by سكينه النجار on 05/08/2023.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items : [ItemModel] = [] {
        didSet{
            saveItem()
        }
    }
    
    let itemKey: String = " item_List"
    
    init(){
        getItems()
    }
    
    func getItems() {
        guard let data = UserDefaults.standard.data(forKey: itemKey),
              let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data) else { return }
        self.items = saveItems
    }
    
    func deleteItems(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItems(from: IndexSet, to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItems(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func saveItem(){
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodeData, forKey: itemKey)
        }
    }
}

