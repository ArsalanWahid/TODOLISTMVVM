//
//  ListView.swift
//  TODOLISTMVVM
//
//  Created by Arsalan Wahid Asghar on 9/29/24.
//

import SwiftUI

struct ListView: View {
    
    //Take in an array of data
    
    @State var items: [ItemModel] = [
        ItemModel(title: "Banana", isCompleted: true),
        ItemModel(title: "Apple", isCompleted: false),
        ItemModel(title: "Orange", isCompleted: false)
    ]
    
    //Since the itemModel conforms to Idetifiable we dont needs the id param as each item already has its own ID Cool :-)
    var body: some View {
        List {
            Section(header: Text("23rd Sep 2024").fontWeight(.bold)) {
                ForEach(items) {
                    item in
                    ListRowView(item: item)
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📋")
        .navigationBarItems(leading:EditButton(), trailing: NavigationLink(
            destination:AddvView(),
            label: {Image(systemName: "plus.app")}))
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    
}
