//
//  VedioPlayerView1.swift
//  MVVMDemoForCurrency
//
//  Created by Knoxpo MacBook Pro on 15/04/21.
//

import SwiftUI
import AVFoundation
import UIKit
import Combine



struct VedioPlayerView1: View {
    @ObservedObject var ViewModel: PlayerViewModel1
    init() {
        
        ViewModel = PlayerViewModel1(fileName: "video")
        
        
    }
  
    var body: some View {
        ZStack {
            VStack {
                
                PlayerContainerView(player: ViewModel.player, gravity: .resize)
                    .frame(width: 230, height: 230)
                    .blur(radius: 2.0)
                    .clipShape(Circle())
                Button(action: {
                    self.ViewModel.isPlaying.toggle()
                    
                }, label: {
                    Image(systemName: self.ViewModel.isPlaying ? "pause" : "play")
                        .padding()
                })
                .background(Color.black)
                PlayerContainerView(player: ViewModel.player, gravity: .ascpectFill)
                    .frame( height: 250)
                    .overlay(Color.black.opacity(0.1))
                    .padding()
                    .border(Color.black,width: 2)
                    .padding()
               
                
            }
          
            
        }
        .ignoresSafeArea()
    }
}

struct VedioPlayerView1_Previews: PreviewProvider {
    static var previews: some View {
        VedioPlayerView1()
    }
}
