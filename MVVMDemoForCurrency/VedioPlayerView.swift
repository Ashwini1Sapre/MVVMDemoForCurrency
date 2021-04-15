//
//  VedioPlayerView.swift
//  MVVMDemoForCurrency
//
//  Created by Knoxpo MacBook Pro on 15/04/21.
//


import AVFoundation
import SwiftUI
import Combine
import UIKit

enum PlayerGravity {
    case ascpectFill
    case resize
    
}
class PlayerView: UIView {
    
    var player: AVPlayer? {
        
        get {
            return playerlayer.player
        }
        set {
            playerlayer.player = newValue
        }
        
        
    }
    
    let gravity: PlayerGravity
    
    init(player: AVPlayer, gravity: PlayerGravity) {
        self.gravity = gravity
        super.init(frame: .zero)
        self.player = player
        self.backgroundColor = .black
         setUPLayer()
       
    }
   func setUPLayer() {
        
        switch gravity {
        
        case .ascpectFill:
            playerlayer.contentsGravity = .resizeAspectFill
            playerlayer.videoGravity =
                .resizeAspectFill
        case .resize:
            playerlayer.contentsGravity = .resize
            playerlayer.videoGravity = .resize
       
        
        }
      
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

var playerlayer: AVPlayerLayer {
    
    return layer as! AVPlayerLayer
    
}

override static var layerClass: AnyClass {
        
        
        return AVPlayerLayer.self
        
    }


}


final class PlayerContainerView: UIViewRepresentable {
    
    typealias UIViewType = PlayerView
    
    let player: AVPlayer
    let gravity: PlayerGravity
    
    init(player: AVPlayer, gravity: PlayerGravity) {
        self.player = player
        self.gravity = gravity
    }
    
    func makeUIView(context: Context) -> PlayerView {
        return PlayerView(player: player, gravity: gravity)
    }
    
    func updateUIView(_ uiView: PlayerView, context: Context) {
        
    }
    
    
    
}


class PlayerViewModel: ObservableObject {
    
    let player: AVPlayer
    
    init(fileName: String) {
        let url = Bundle.main.url(forResource: fileName, withExtension: "mp4")
        self.player = AVPlayer(playerItem: AVPlayerItem(url: url!))
     }
    
    @Published var isPlaying: Bool = false {
        didSet {
            if isPlaying {
                play()
            }
            else
            {
                pause()
                
            }
          }
     }
    
    func play() {
        
        let currentItem = player.currentItem
        if currentItem?.currentTime() ==
            currentItem?.duration {
            currentItem?.seek(to: .zero, completionHandler: nil)
            
        }
        player.play()
        
        
    }
    
    func pause() {
        player.pause()
    }
    
    
}

enum PlayerAction {
    
    case play
    case pause
    
    
}







struct VedioPlayerView: View {
    
    @ObservedObject var model: PlayerViewModel
    
    init() {
        model = PlayerViewModel(fileName:
            "video")
        
    }
  
    var body: some View {
        ZStack {
            
            VStack {
                PlayerContainerView(player: model.player, gravity: .resize)
                    .frame(width: 250, height: 250)
                    .blur(radius: 3.0)
                    .clipShape(Circle())
           
                Button(action: {
                    self.model.isPlaying.toggle()
                    
                }, label: {
                   
                    
                    Image (systemName: self.model.isPlaying ? "pause" : "play")
                        .padding()
                })
                .background(Color.black)
       
                PlayerContainerView(player: model.player, gravity: .ascpectFill)
                
                    .frame(height: 200)
                    .overlay(Color.black.opacity(0.1)
                    )
                    .padding()
                    .border(Color.black,width: 2)
                    .padding()
                
             
                
                
            }
            
           
        }
        .ignoresSafeArea()
    }
}

struct VedioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VedioPlayerView()
    }
}
