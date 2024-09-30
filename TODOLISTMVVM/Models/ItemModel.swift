//
//  ItemModel.swift
//  TODOLISTMVVM
//
//  Created by Arsalan Wahid Asghar on 9/29/24.
//


/*
 The model ensures that types in code clearly define domain entities
 */
import Foundation

struct ItemModel:Identifiable {
    let id:String
    let title:String
    let isCompleted:Bool
    
    
    //Enables the option to call itemModel with or without an ID
    init(id:String = UUID().uuidString,title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

