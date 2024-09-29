//
//  ListView.swift
//  TODOLISTMVVM
//
//  Created by Arsalan Wahid Asghar on 9/29/24.
//

import SwiftUI

struct ListView: View {
    
    //Take in an array of data
    
    @State var items: [String] = ["This is the first item", "This is the second item", "This is the third item"]
    
    
    var body: some View {
        List {
            ForEach(items,id: \.self) {
                item in
                ListRowView(title: item)
            }
            
        }
        .listStyle(.plain)
        .navigationTitle("Todo List 📋")
        .navigationBarItems(leading:EditButton(), trailing: NavigationLink("Add",destination: AddvView()))
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    
}
