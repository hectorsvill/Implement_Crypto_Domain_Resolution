//
//  ContentView.swift
//  Implement_Crypto_Domain_Resolution
//
//  Created by hectorsvill on 4/11/21.
//

import SwiftUI


struct ContentView: View {
    let resolutionController = ResolutionController()
    @State private var textFieldInput = ""
    @State private var domainInfoText = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Address or Domain")
                    .foregroundColor(errorForegroundColor())
                    .font(.caption)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(UIColor.white), lineWidth: 1)
                    )// Text
                    .padding(.top, 10)
                    .padding(.leading, 30)
//                    .offset(y: 13)

                TextField(
                    "Enter an address or domain",
                    text: $textFieldInput,
                    onEditingChanged: { isEditing in
                        print(" is editing: \(isEditing)")
                    },
                    onCommit: {
                        resolutionController.resolution.owner(domain: textFieldInput) { result in
                            switch result {
                            case .success(let addressValue):
                                self.domainInfoText = "\(textFieldInput) resisolved to\n\(addressValue)"
                                resolutionController.account = Account(domain: textFieldInput, address: addressValue)
                                resolutionController.state = .domainResolution
                            case .failure:
                                self.domainInfoText = "There are no records for \(textFieldInput)"
                                resolutionController.state = .domainError
                            }
                        }
                    }
                )// TextFieldd
                .disabled(resolutionController.state == .domainResolution)
                .disableAutocorrection(true)
                .padding()
                .foregroundColor(Color(UIColor.label))
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(errorForegroundColor(), lineWidth: 2)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                )
                
                Text(domainInfoText)
                    .foregroundColor(errorForegroundColor())
                    .padding(.top, 5)
                    .padding(.leading, 30)
                    .font(.caption2)
    
                Spacer()
            } // Vstack
            
            .navigationBarTitle("Unstoppable Domains", displayMode: .inline)
        }// NavigationView
    }
    
    func errorForegroundColor() -> Color {
        resolutionController.state == .domainError ? Color.red : Color(UIColor.label)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
