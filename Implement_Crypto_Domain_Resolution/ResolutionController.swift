//
//  ResolutionController.swift
//  Implement_Crypto_Domain_Resolution
//
//  Created by hectorsvill on 4/11/21.
//

import Foundation
import UnstoppableDomainsResolution


enum ResolutionState {
    case domainResolving
    case domainResolution
    case domainError
}

class ResolutionController  {
    var resolution: Resolution! = nil
    var state: ResolutionState = .domainResolving
    var account: Account! = nil
    
    init() {
        if let res = try? Resolution() {
            self.resolution = res
        } else {
            print("Init of Resolution instance with default parameters failed...")
        }
    }
    
}


