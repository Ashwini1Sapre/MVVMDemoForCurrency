//
//  CurrenciesListView.swift
//  MVVMDemoForCurrency
//
//  Created by Knoxpo MacBook Pro on 15/04/21.
//

import SwiftUI

struct CurrenciesListView: View {
    @ObservedObject var viewModel: CcurrenciesListViewModel
    
    init(viewModel: CcurrenciesListViewModel) {
        self.viewModel = viewModel
    }
    
    
    var body: some View {
        NavigationView {
            List {
                
                Section {
                    
                    ForEach(viewModel.rates, content: CurrencyItemView
                                .init(viewModel:))
                    
                }
              
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(viewModel.title)
            .font(.system(size: 12))
          
        }
    }
}

struct CurrenciesListView_Previews: PreviewProvider {
    static var previews: some View {
        
        let viewModel = CcurrenciesListViewModel(converterService: FileCurrencyService())
      return  CurrenciesListView(viewModel: viewModel)
    }
}
