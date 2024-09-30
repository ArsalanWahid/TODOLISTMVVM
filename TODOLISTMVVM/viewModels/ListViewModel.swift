//
//  ListViewModel.swift
//  TODOLISTMVVM
//
//  Created by Arsalan Wahid Asghar on 9/30/24.
//


/**
 
 All of the CRUD functions for each model or multiple model making a view are transformed here.
 The logic is seperated from the UI and in the future can use firebase all to call APIs that will be defined and managed here

 */
import Foundation

class ListViewModel:ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getitems()
    }
    
    func getitems() {
        let newItems =  [
            ItemModel(title: "Banana", isCompleted: true),
            ItemModel(title: "Apple", isCompleted: false),
            ItemModel(title: "Orange", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func delteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from:IndexSet,to:Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(item: String) {
        let item:ItemModel = ItemModel(title: item, isCompleted: false)
        items.append(item)
    }
    
    //How does this work review later
    func updateItem(item:ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
}
