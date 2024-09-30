//
//  AddView.swift
//  TODOLISTMVVM
//
//  Created by Arsalan Wahid Asghar on 9/29/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel:ListViewModel
    @State var textFieldText:String = ""
    @State var alertTitle:String = ""
    @State var showAlert:Bool = false
    
    
    let listOfSwearWords = ["darn", "crap", "newb","Fuck","bullshit","asshole","nigger","nigga","tits","dick","ass","bull"]
    
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText).padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                    .cornerRadius(10)
                
                Button(action: saveButton,label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }.padding(14)
        }.navigationTitle("Add an Item 🖊️")
            .alert(isPresented: $showAlert,content: getAlert)
    }
    
    func saveButton() {
        if textValidation() {
            listViewModel.addItem(item: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textValidation() -> Bool {
        
        if filterSwearWords() {
            alertTitle = "Curse word not allowed 😏"
            showAlert.toggle()
            return false
        }

        if textFieldText.count < 3 {
            alertTitle = "Character count less than 3"
            showAlert.toggle()
            return false
        }
        

        return true
    }
    
    func getAlert() -> Alert{
        Alert(title: Text(alertTitle))
    }
    

    func filterSwearWords() -> Bool {
        return containsSwearWord(text: textFieldText.lowercased(), swearWords: listOfSwearWords)
    }
    
    func containsSwearWord(text: String, swearWords: [String]) -> Bool {
        return swearWords
            .reduce(false) { $0 || text.contains($1.lowercased()) }
    }

    // example usage
     
    
    
}

#Preview {
    NavigationStack{
        AddView()
    }.environmentObject(ListViewModel())
    
}
