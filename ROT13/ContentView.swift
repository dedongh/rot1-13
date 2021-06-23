//
//  ContentView.swift
//  ROT13
//
//  Created by Bra Emma on 23/06/2021.
//

import SwiftUI


struct ContentView: View {
    @State var text = ""
    @State var rotText = ""
    @State var version = 1
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 20, content: {
            
                TextField("Enter text", text: $text)
                    .padding()
                    .background(Color(UIColor.tertiarySystemFill))
                    .cornerRadius(9)
                    .font(.system(size: 24, weight: .bold, design: .default))
                
                    Picker("ROT VERSION", selection: $version, content: {
                        ForEach(1...13, id: \.self){
                            Text("ROT \($0)")
                        }
                    })
                
                Text(rotText)
                    .padding()
                   
                Button(action: {
                    if self.text.isEmpty{
                        self.errorShowing = true
                        self.errorTitle = "Invalid Text"
                        self.errorMessage = "Please enter text"
                        return
                    }
                    self.rotText = text.rot13(version)
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Save")
                      .font(.system(size: 24, weight: .bold, design: .default))
                      .padding()
                      .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color.purple)
                      .cornerRadius(9)
                      .foregroundColor(Color.white)
                })
            }).navigationBarTitle("ROT", displayMode: .large)
            .padding()
            .alert(isPresented: $errorShowing) {
              Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            
        }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
