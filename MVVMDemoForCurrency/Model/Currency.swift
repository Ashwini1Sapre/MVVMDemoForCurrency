//
//  Currency.swift
//  MVVMDemoForCurrency
//
//  Created by Knoxpo MacBook Pro on 15/04/21.
//

import SwiftUI

enum currency: String {
    case GBP
    case EUR
    case USD
    
    var symbol : String {
        switch self {
        case .EUR: return "€"
        case .USD: return "$"
        case .GBP: return "£"
            
        }
     }
   
}

struct CurrencyRate {
    
    let currencyIso : String
    let rate: Double
    
  
}


