//
//  ResolutionController.swift
//  Implement_Crypto_Domain_Resolution
//
//  Created by hectorsvill on 4/11/21.
//

import Foundation
import UnstoppableDomainsResolution

class ResolutionController  {
    var resolution: Resolution! = nil
    
    init() {
        if let res = try? Resolution() {
            self.resolution = res
        } else {
            print("Init of Resolution instance with default parameters failed...")
        }
    }
    
}
