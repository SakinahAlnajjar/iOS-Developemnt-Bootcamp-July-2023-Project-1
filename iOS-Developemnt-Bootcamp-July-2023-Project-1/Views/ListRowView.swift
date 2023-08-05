//
//  ListRowView.swift
//  iOS-Developemnt-Bootcamp-July-2023-Project-1
//
//  Created by سكينه النجار on 04/08/2023.
//

import SwiftUI

struct ListRowView: View {
    
    var items = ItemModel(title: "", isCompleted: false)
    
    var body: some View {
        HStack{
            Image(systemName: items.isCompleted ? "checkmark.circle": "circle")
                .foregroundColor(items.isCompleted ? .green : .red )
            Text(items.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title: "this is 1", isCompleted: false)
    static var item2 = ItemModel(title: "this is 2", isCompleted: true)
    static var previews: some View {
        Group {
            ListRowView(items: item1)
            ListRowView(items: item2)
        }
        .previewLayout(.sizeThatFits)
    }
    
    
    struct ListRowView_Previews: PreviewProvider {
        static var previews: some View {
            ListRowView()
        }
    }
}
