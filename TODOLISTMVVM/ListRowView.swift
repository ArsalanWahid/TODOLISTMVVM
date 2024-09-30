//
//  ListRowView.swift
//  TODOLISTMVVM
//
//  Created by Arsalan Wahid Asghar on 9/29/24.
//

import SwiftUI

struct ListRowView: View {
    
    
    let item:ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle").foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical,8)
    }
}

//powerful example of preview customization

#Preview {
    
    var item1 = ItemModel(title: "First Item on List", isCompleted: true)
    var item2 = ItemModel(title: "Second Item on list", isCompleted: false)
    Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
    
}
