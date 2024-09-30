//
//  ListViewModel.swift
//  TODOLISTMVVM
//
//  Created by Arsalan Wahid Asghar on 9/30/24.
//

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
    
    
}
