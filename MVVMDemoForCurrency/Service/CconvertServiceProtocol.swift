//
//  CconvertServiceProtocol.swift
//  MVVMDemoForCurrency
//
//  Created by Knoxpo MacBook Pro on 15/04/21.
//

import Foundation
import Combine
protocol  CconvertServiceProtocol{
    
    func converter(basedON currencyISo: String) -> AnyPublisher<Convertor,Error>
}

struct FileCurrencyService: CconvertServiceProtocol {
    
    private let filename = "sample"
    
    func converter(basedON currencyISo: String) -> AnyPublisher<Convertor, Error> {
        return FileManager.readJsonFile(from: filename)
            .tryCompactMap { data ->  Convertor in
                let jsonDecoder = JSONDecoder()
                return try jsonDecoder.decode(Convertor.self, from: data)
                
                
                
                
            }
            .eraseToAnyPublisher()
    }
    
    
    
}
