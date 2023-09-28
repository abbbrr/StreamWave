//
//  PageScreenView.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 20.09.2023.
//

import SwiftUI
import AVKit
import URLImage


struct PageScreenView: View {
    @State private var isShowingText = false
    @State private var isShowingVideo = false
    @State private var isShowingAudio = false
    @State var showAllReviews = false
  
    var podcast: PodcastCart
    
    var text = "Человек-паук - это популярный супергеройский персонаж, созданный комиксами Marvel Comics. Он появился в комиксах в 1962 году и был придуман писателем Стэном Ли и художником Стивом Дитко. Основной сюжет рассказывает о молодом парне по имени Питер Паркер, который после укуса радиоактивного паука приобретает сверхчеловеческие способности, включая способность прилепляться к стенам, силу и быстроту.Питер Паркер становится Человеком-пауком и использует свои способности для борьбы с преступностью и защиты города Нью-Йорк от различных злодеев и суперзлодеев. Он также борется с собственными личными проблемами и ответственностями.Человек-паук стал одним из самых узнаваемых и популярных персонажей в мире комиксов и был адаптирован во множество фильмов, анимационных сериалов и видеоигр. В фильмах он часто изображается как Питер Паркер, обычный парень, сталкивающийся с моральными и эмоциональными дилеммами, а также как герой, спасающий город от угрозы."
    
    var texName = "Волшебные миры Хаяо Миядзаки"
    
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
                        
                        // H2
                        Text(podcast.name)
                          .font(
                            Font.custom("Cera Pro", size: 18)
                              .weight(.bold)
                          )
                          .multilineTextAlignment(.center)
                          .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                        
                        Additional()
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
                                            
                        Spacer()
                        
                     //MARK: - reviews
                        VStack(alignment: .leading,spacing: 15){
                            
                            //кнопку чтобы оставить отзыв
                            Button {
                                print("review")
                            } label: {
                                Text("Оставить отзыв")
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .foregroundColor(.black)
                                
                            }
                            .frame(height: 40, alignment: .center)
                            .background(Color(red: 1, green: 0.6, blue: 0.46))
                            .cornerRadius(10)


                            HStack{
                                Text("Отзывы")
                                  .font(.title3)
                                  .bold()
                                  .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                                  .frame(width: 288, alignment: .topLeading)
                                
                                Button {
                                    self.showAllReviews.toggle()
                                } label: {
                                    Text(showAllReviews ?  "Скрыть" : "Все")
                                        .font(.title3)
                                        .bold()
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color(red: 1, green: 0.6, blue: 0.46))
                                
                                }
                            }
                            ReviewsCard(showAllReviews: $showAllReviews)
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
                            self.isShowingAudio.toggle()
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
                            YTView(ID: "\(podcast.videoUrl )/")
                        }
                        .padding(.top)
                        .padding(.bottom)
                    }
                    
                    if isShowingAudio{
                        VStack{
                            Text(podcast.name)
                                .foregroundColor(.white)
                                .font(.title3)
                                .bold()
                            AudioComponent(audioURL: URL(string: "\( podcast.audioUrl)"))
                        }
                        .padding(.top,20)
                        .padding(.bottom)
                    }
                    
                }
                .padding()
                //end vstak
            }
            //end scrollview
        }
    }
}

    //struct PageScreenView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        PageScreenView(podcast: PodcastCart)
    //    }
    //}
