//
//  Convertor.swift
//  MVVMDemoForCurrency
//
//  Created by Knoxpo MacBook Pro on 15/04/21.
//

import Foundation

struct Convertor {
    let base : String
    let date : String
    let curruncies: [CurrencyRate]
    var baseSymbol: String? {
        
        currency(rawValue: base.uppercased())?.symbol
    }
    
    
}

extension Convertor : Decodable  {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let base = try container.decode(String.self, forKey: .base)
        let date = try container.decode(String.self, forKey: .date)
        let currencies = try container.decode([String: Double].self, forKey: .rates)
            .compactMap({ CurrencyRate(currencyIso: $0.0, rate: $0.1)})
        self.init(base: base, date: date, curruncies: currencies)
    }
    
    enum Keys: String, CodingKey{
        case base
        case date
        case rates
        
    }
   
    
}
