//
//  PlayerViewModel.swift
//  MVVMDemoForCurrency
//
//  Created by Knoxpo MacBook Pro on 15/04/21.
//

import Foundation
import  AVFoundation
class PlayerViewModel1: ObservableObject {
    
    let player: AVPlayer
    
    init(fileName: String) {
        let url = Bundle.main.url(forResource: fileName, withExtension: "mp4")
        self.player = AVPlayer(playerItem: AVPlayerItem(url: url!))
    }

    @Published var isPlaying: Bool = false {
        didSet {
            if isPlaying {
                Play()
            }
            else
            {
                Pause()
                
            }
          }
     }
    
    func Play() {
        let currentItem = player.currentItem
      if  currentItem?.currentTime() == currentItem?.duration  {
            
            currentItem?.seek(to: .zero, completionHandler: nil)
        }
        player.play()
        
        
    }
    func Pause()  {
        
        
        player.pause()
        
    }
    
 
    
}
