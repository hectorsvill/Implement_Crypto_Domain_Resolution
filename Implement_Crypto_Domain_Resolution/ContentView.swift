//
//  ContentView.swift
//  Implement_Crypto_Domain_Resolution
//
//  Created by hectorsvill on 4/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var fullText: String = "Domain"
    @State private var domainError = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Address or Domain")
                    .font(.caption)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(UIColor.white), lineWidth: 1)
                    )
                    .padding(.top, 10)
                    .padding(.leading, 30)
//                    .offset(y: 13)

                TextField("Enter Domain", text: $fullText)
                    .padding()
                    .foregroundColor(Color(UIColor.label))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 4)
                            .padding(.leading, 5)
                            .padding(.trailing, 5)
                        
                    )
                
                Text(domainError)
                    .padding(.top, 5)
                    .padding(.leading, 30)
    
                Spacer()
            }
            
            .navigationBarTitle("Unstoppable Domains", displayMode: .inline)
        }// NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
