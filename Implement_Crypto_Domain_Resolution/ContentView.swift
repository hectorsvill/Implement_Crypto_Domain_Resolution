//
//  ContentView.swift
//  Implement_Crypto_Domain_Resolution
//
//  Created by hectorsvill on 4/11/21.
//

import SwiftUI

enum ResolutionState {
    case domainResolving
    case domainResolution
    case domainError
}

struct ContentView: View {
    let resolutionState: ResolutionState = .domainResolving
    let resolutionController = ResolutionController()
    @State private var fullText: String = ""
    @State private var domainError = ""
    @State private var ownerAddress = ""
    
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

                TextField(
                    "example.crypto or example.zil",
                    text: $fullText,
                    onEditingChanged: { isEditing in
                        print(isEditing)
                        if isEditing && !domainError.isEmpty {
                            domainError = ""
                            ownerAddress = ""
                        }
                    },
                    onCommit: {
                        fetchResolution(with: fullText) { ownerAddress, error in
                            if let error = error  {
                                print(error.localizedDescription)
                                domainError = "This domain is not supported."
                            }
                            
                            guard let ownerAddress = ownerAddress else {
                                return
                            }
                            
                            self.ownerAddress = ownerAddress
                            
                            domainError = "Owner Adress:"
                        }
                    }
                )
                .padding()
                .foregroundColor(Color(UIColor.label))
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 2)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                )
                    
                
                VStack(alignment: .leading) {
                    Text(domainError)

                        
                    Text("\(ownerAddress)")
                        .padding()
                }
                .padding(.top, 5)
                .padding(.leading, 30)
                .font(.caption2)
                
    
                Spacer()
            }
            
            .navigationBarTitle("Unstoppable Domains", displayMode: .inline)
        }// NavigationView
    }
    
    func fetchResolution(with addressDomain: String, completion: @escaping (String?, Error?) -> ())  {
        resolutionController.resolution.owner(domain: addressDomain) { result in
            switch result {
            case .success(let returnValue):
                let domainOwner = returnValue
                completion(domainOwner, nil)
            case .failure(let error):
                print("Expected owner but got error: \(error)")
                completion(nil, error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
