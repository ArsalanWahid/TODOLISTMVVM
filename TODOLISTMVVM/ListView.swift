//
//  ListView.swift
//  TODOLISTMVVM
//
//  Created by Arsalan Wahid Asghar on 9/29/24.
//

import SwiftUI

struct ListView: View {
    
//    //Take in an array of data
//    
//    @State var items: [ItemModel] = [
//        ItemModel(title: "Banana", isCompleted: true),
//        ItemModel(title: "Apple", isCompleted: false),
//        ItemModel(title: "Orange", isCompleted: false)
//    ]
  
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    
    //Since the itemModel conforms to Idetifiable we dont needs the id param as each item already has its own ID Cool :-)
    var body: some View {
        List {
            Section(header: Text("23rd Sep 2024").fontWeight(.bold)) {
                ForEach(listViewModel.items) {
                    item in
                    ListRowView(item: item)
                }.onDelete(perform: listViewModel.delteItem)
                    .onMove(perform: listViewModel.moveItem)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📋")
        .navigationBarItems(leading:EditButton(), trailing: NavigationLink(
            destination: AddView(),
            label: {Image(systemName: "plus.app")}))
    }
}
//This is needed since the preview does not have the environemnt object 
#Preview {
    NavigationStack {
        ListView()
    }.environmentObject(ListViewModel())
    
}
