//
//  ContentView.swift
//  Implement_Crypto_Domain_Resolution
//
//  Created by hectorsvill on 4/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var fullText: String = "Domain"
    
    var body: some View {
        NavigationView {
            
            VStack(alignment: .center) {
                Text("Address or Domain")
                    .font(.footnote)
                    .padding(.top, 10)
                    .offset(x: -100, y: 10)
                
                TextField("Enter Domain", text: $fullText)
                    .padding()
                    .foregroundColor(.green)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(8)
//                    .clipShape(Circle())
                    
                Spacer()
            }
            .navigationBarTitle("Unstoppable Domains", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
