import SwiftUI
import AVKit
import URLImage

struct VideoPlayerView: UIViewControllerRepresentable {
    var videoURL: URL

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Update code here if needed
    }
}

struct PageScreenView: View {
    @State private var isShowingSettings = false
    @State private var isShowingText = false
    @State private var isShowingVideo = false
    @State private var isShowMusic = false
    
    @Binding var email:String
  
    var podcast: PodcastCart
    @EnvironmentObject var firestoreManager:CartViewModel
    @EnvironmentObject var likeViewModel: LikeViewModel
    
  
    @State private var player: AVPlayer?
    @State private var isPlaying = false
    
    var body: some View {
        ZStack{
            Color("backgroudColor")
                    .edgesIgnoringSafeArea(.all)
            
            //start
            ScrollView{
                VStack(alignment: .center){
                    
                    //MARK: -image and additional
                    VStack(alignment: .center,spacing: 10){
                      
                        URLImage(URL(string: "\(podcast.image)")!){ image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                        }
                            
                            .frame(width: 150, height: 217.44632)
                            .cornerRadius(10)

                        
                        Text("\(podcast.author)")
                          .font(
                            Font.custom("PT Root UI", size: 16)
                              .weight(.medium)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 1, green: 0.6, blue: 0.46))
                          .frame(width: 170, alignment: .top)
                        
                        Text(podcast.name)
                          .font(
                            Font.custom("Cera Pro", size: 18)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                        
                        Text(podcast.genre)
                          .font(
                            Font.custom("Cera Pro", size: 16)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(.gray)

                        
                        Additional(time: podcast.time, people: podcast.people)
                            .padding(.top)
                    }
                    .padding()
     
                    Spacer()
                   
                    
                    //MARK: -information
                    VStack(alignment: .leading){
                        Text("О книге")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        
                        
                        
                        //MARK: -descriptions
                        VStack(spacing: 10){
                            if !isShowingText{
                                Text(podcast.information)
                                    .lineLimit(3)
                                    .font(Font.custom("PT Root UI", size: 16))
                                    .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                                    .frame(width: .infinity, alignment: .topLeading)
                                    .padding(.horizontal,8)
                            } else {
                                Text(podcast.information)
                                    .font(Font.custom("PT Root UI", size: 16))
                                    .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                                    .frame(width: .infinity, alignment: .topLeading)
                                    .padding(.horizontal,8)
                            }

                            Button {
                                withAnimation {
                                    self.isShowingText.toggle()
                                }
                            } label: {
                                Text(isShowingText ? "Свернуть" : "Читать полностью")
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 1, green: 0.6, blue: 0.46))

                            }
                        }.padding(.bottom)
                        
                        Button {
                            likeViewModel.addToLiked(podcast: podcast)
                        } label: {
                            Text("ADD to like")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }

                        
                    }.padding(.bottom)
                    Spacer()
            
                    HStack{
                        //button 1
                        Button {
                            self.isShowingVideo.toggle()
                        } label: {
                            HStack{
                                Image(systemName: "airplayvideo")
                                    .foregroundColor(.black)
                                // text medium
                                Text("Смотреть")
                                  .font(
                                    Font.custom("PT Root UI", size: 16)
                                      .weight(.medium)
                                  )
                                  .multilineTextAlignment(.center)
                                  .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.16))
                            }
                            .padding(.vertical, 12)
                            .frame(width: 160, height: 48, alignment: .center)
                            .background(Color(red: 1, green: 0.6, blue: 0.46))
                            .cornerRadius(10)
                        }
                        
                        
                        //button 2
                        Button {
                            self.isShowMusic.toggle()
                        } label: {
                            HStack{
                                Image(systemName: "music.mic")
                                    .foregroundColor(.black)
                                // text medium
                                Text("Слушать")
                                  .font(
                                    Font.custom("PT Root UI", size: 16)
                                      .weight(.medium)
                                  )
                                  .multilineTextAlignment(.center)
                                  .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.16))
                            }
                            .padding(.vertical, 12)
                            .frame(width: 160, height: 48, alignment: .center)
                            .background(Color(red: 1, green: 0.6, blue: 0.46))
                            .cornerRadius(10)
                        }
                        
                    }
                    
                    if isShowingVideo{
                        VStack{
                                Text(podcast.name)
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .bold()
                           
                            if let videoURL = podcast.videoUrl {
                                VideoPlayerView(videoURL: videoURL)
                                    .edgesIgnoringSafeArea(.all)
                            } else {
                                VStack{
                                    Text("Видео недоступно")
                                        .font(.title3)
                                        .foregroundColor(.white)
                                }
                                .padding(.vertical, 20)
                            }
                        }
                    }
                    
                    if isShowMusic{
                        VStack{
                            Text(podcast.name)
                                .foregroundColor(.white)
                                .font(.title3)
                                .bold()
                            
                            HStack {
                                Button(action: {
                                    if let audioURLString = podcast.audioUrl, let audioURL = URL(string: audioURLString) {
                                        if isPlaying {
                                            self.player?.pause()
                                        } else {
                                            self.player = AVPlayer(url: audioURL)
                                            self.player?.play()
                                        }
                                        isPlaying.toggle()
                                    }
                                }) {
                                    Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                                        .font(.largeTitle)
                                        .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.16))
                                }
                                .padding()
//                                .background(Color(red: 1, green: 0.6, blue: 0.46))    
                                .cornerRadius(10)

                                Button(action: {
                                    if let audioURLString = podcast.audioUrl, let _ = URL(string: audioURLString) {
                                        self.player?.pause()
                                        isPlaying = false
                                    }
                                }) {
                                    Image(systemName: "stop.circle")
                                        .font(.largeTitle)
                                        .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.16))
                                }
                                .padding()
//                                .background(Color(red: 1, green: 0.6, blue: 0.46))
                                .cornerRadius(10)
                            }
                           
                        }
                        .padding(.top)
                        .padding(.bottom)
                        
                    }
                }
                .padding()
                //end vstak
                .onChange(of: isShowingVideo) { newValue in
                           // Hide music view when video view is shown
                           if newValue {
                               isShowMusic = false
                           }
                       }
                .onChange(of: isShowMusic) { newValue in
                    // Hide video view when music view is shown
                    if newValue {
                        isShowingVideo = false
                    }
                }
 
            }
            //end scrollview
        }
    }
}
