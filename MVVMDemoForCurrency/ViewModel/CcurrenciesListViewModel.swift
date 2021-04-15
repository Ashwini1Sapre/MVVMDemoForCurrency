//
//  CcurrenciesListViewModel.swift
//  MVVMDemoForCurrency
//
//  Created by Knoxpo MacBook Pro on 15/04/21.
//

import Foundation
import Combine

class CcurrenciesListViewModel: ObservableObject, Identifiable {
    
    @Published var rates: [CurrencyItemViewModel] = []
    @Published var title: String = ""
    
    private let ConverterServise: CconvertServiceProtocol
    private var disposales = Set<AnyCancellable>()
    
    init(converterService: CconvertServiceProtocol) {
        self.ConverterServise = converterService
        fetchCurrencies()
    }
    
    func fetchCurrencies(for currencyIso: String = "GBP") {
        
        ConverterServise
            .converter(basedON: currencyIso)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else {return}
                
                switch value {
                
                case .failure:
                    self.rates = []
                case .finished:
                    break
                
                }
                
                
            }, receiveValue: { [weak self] converter in
                guard let self = self else { return }
                self.rates = converter.curruncies
                    .sorted(by: { (left, right) -> Bool in
                        left.currencyIso < right.currencyIso
                        
                    })
                
                    .map({ CurrencyItemViewModel.init(currency: $0)})
                if let symbol = converter.baseSymbol {
                    
                    self.title = "Currency Exchange \(symbol)"
                        
                }
            
                
            }
          
            )
            .store(in: &disposales)
        
        
        
        
        
        
        
    }
    
    
    
    
}
