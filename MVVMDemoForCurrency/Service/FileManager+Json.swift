//
//  FileManager+Json.swift
//  MVVMDemoForCurrency
//
//  Created by Knoxpo MacBook Pro on 15/04/21.
//

import Foundation
import Combine
extension FileManager {
    
    static func readJsonFile(from fileName: String) -> AnyPublisher<Data,Error> {
        
        return Just(fileName)
            .compactMap{ Bundle.main.path(forResource: $0, ofType: "json") }
                
        
                .tryCompactMap { filePath -> Data in
                    
                    let url = URL(fileURLWithPath: filePath)
                    return try Data(contentsOf: url, options: .mappedIfSafe)
                    
                    
                    
                }
        
            .eraseToAnyPublisher()
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
}
