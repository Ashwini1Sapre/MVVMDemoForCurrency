//
//  CurrencyItemViewModel.swift
//  MVVMDemoForCurrency
//
//  Created by Knoxpo MacBook Pro on 15/04/21.
//

import Foundation
import Combine
class CurrencyItemViewModel: ObservableObject, Identifiable {
    
    @Published var title: String = ""
    @Published var value: String = ""
    
    init(currency: CurrencyRate) {
        
        
        title = currency.currencyIso
        value = "\(currency.rate)"
        
    }
    
    
    
    
}
