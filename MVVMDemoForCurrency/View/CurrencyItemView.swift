//
//  CurrencyItemView.swift
//  MVVMDemoForCurrency
//
//  Created by Knoxpo MacBook Pro on 15/04/21.
//

import SwiftUI

struct CurrencyItemView: View {
    
    @ObservedObject var viewModel: CurrencyItemViewModel
    
    
    init(viewModel: CurrencyItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Text(viewModel.title)
            Spacer()
            Text(viewModel.value)
            
            
        }
    }
}

struct CurrencyItemView_Previews: PreviewProvider {
    static var previews: some View {
        let currency = CurrencyRate(currencyIso: "USD", rate: 1.3)
        let viewModel = CurrencyItemViewModel(currency: currency)
      return   CurrencyItemView(viewModel: viewModel)
    }
}
