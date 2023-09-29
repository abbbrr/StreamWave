//
//  AudioComponent.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 25.09.2023.
//

import SwiftUI
import AVKit


struct AudioComponent: View {
    @State private var audioPlayer: AVPlayer?
    @State private var currentTime: Double = 0
    @State private var totalTime: Double = 0
    @State private var isPlaying: Bool = false
    
    var audioURL: URL?
    

        var timer: Timer {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                if isPlaying {
                    currentTime = CMTimeGetSeconds(self.audioPlayer?.currentItem?.currentTime() ?? CMTime.zero)
                }
            }
        }
    
    var body: some View {
        VStack {
            Spacer()
                
                   if let player = audioPlayer {
                       // Виджет слайдера для дорожки времени
                       Slider(value: $currentTime, in: 0...totalTime)
                           .padding(.horizontal)
                           .onAppear {
                               totalTime = CMTimeGetSeconds(player.currentItem?.asset.duration ?? CMTime.zero)
                           }
                       
                       HStack {
                           Text(formatTime(currentTime))
                               .foregroundColor(.secondary)
                           
                           Spacer()
                           
                           Text(formatTime(totalTime))
                               .foregroundColor(.secondary)
                       }
                       .padding(.horizontal)
                       
                       HStack {
                           Button(action: {
                               if isPlaying {
                                   player.pause()
                               } else {
                                   player.play()
                                   timer.fire()
                               }
                               isPlaying.toggle()
                           }) {
                               Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                   .font(.system(size: 50))
                                   .foregroundColor(.blue)
                           }
                       }
                       .padding()
                   } else {
                       Text("Загрузка аудио...")
                           .foregroundColor(.gray)
                   }
                   
                   Spacer()
               }
               .onAppear {
                   if let url = audioURL {
                       let player = AVPlayer(url: url)
                       self.audioPlayer = player
                   }
               }
           }

           // Функция для форматирования времени в формат "мм:сс"
           func formatTime(_ time: Double) -> String {
               let minutes = Int(time) / 60
               let seconds = Int(time) % 60
               return String(format: "%02d:%02d", minutes, seconds)
           }
    }


struct AudioComponent_Previews: PreviewProvider {
    static var previews: some View {
        AudioComponent()
    }
}
