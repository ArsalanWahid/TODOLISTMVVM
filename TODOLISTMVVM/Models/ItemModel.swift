//
//  ItemModel.swift
//  TODOLISTMVVM
//
//  Created by Arsalan Wahid Asghar on 9/29/24.
//

import Foundation

struct ItemModel:Identifiable {
    let id:String = UUID().uuidString
    let title:String
    let isCompleted:Bool
}
