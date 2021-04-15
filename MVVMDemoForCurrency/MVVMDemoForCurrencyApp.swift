//
//  MVVMDemoForCurrencyApp.swift
//  MVVMDemoForCurrency
//
//  Created by Knoxpo MacBook Pro on 15/04/21.
//

import SwiftUI

@main
struct MVVMDemoForCurrencyApp: App {
    var body: some Scene {
        WindowGroup {
            
            TabView {
                VedioPlayerView()
                    .tabItem {
                        
                        Label("Video", systemImage: "video")
                    }
                
                            let viewModel = CcurrenciesListViewModel(converterService: FileCurrencyService() )
                            CurrenciesListView(viewModel: viewModel)
                                .tabItem {
                                    
                                    Label("Currency", systemImage: "coloncurrencysign.circle.fill")
                                }
                
                
            }
           
            
            

           
        }
    }
}
