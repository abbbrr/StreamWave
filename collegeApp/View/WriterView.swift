//
//  WriterView.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 22.09.2023.
//

import SwiftUI

struct WriterView: View {
    @State private var isActionSheet = false
    
    var raiting = 3
    
    
    var text = "Человек-паук - это популярный супергеройский персонаж, созданный комиксами Marvel Comics. Он появился в комиксах в 1962 году и был придуман писателем Стэном Ли и художником Стивом Дитко. Основной сюжет рассказывает о молодом парне по имени Питер Паркер, который после укуса радиоактивного паука приобретает сверхчеловеческие способности, включая способность прилепляться к стенам, силу и быстроту.Питер Паркер становится Человеком-пауком и использует свои способности для борьбы с преступностью и защиты города Нью-Йорк от различных злодеев и суперзлодеев. Он также борется с собственными личными проблемами и ответственностями.Человек-паук стал одним из самых узнаваемых и популярных персонажей в мире комиксов и был адаптирован во множество фильмов, анимационных сериалов и видеоигр. В фильмах он часто изображается как Питер Паркер, обычный парень, сталкивающийся с моральными и эмоциональными дилеммами, а также как герой, спасающий город от угрозы."
    
    var body: some View {
        ZStack{
            Color("backgroudColor")
                    .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                VStack{
                    Spacer()
                    VStack(spacing: 10){
                        Text("Добро пожаловать")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        
                        Button {
                            self.isActionSheet.toggle()
                        } label: {
                            Text("Нажмите чтобы выложить свой подкаст")
                                .font(
                                    Font.custom("Cera Pro", size: 17)
                                )
                            
                        }
                    }.padding()
                    .sheet(isPresented: $isActionSheet) {
                       AddPodcast()
                    }
                
                    Spacer()
                    
                    VStack{
                        VStack(spacing: 15){
                            Image("spiderman")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 217.44632)
                                .cornerRadius(10)
                                .clipped()
                            
                            Text("Куатбек Искандер")
                              .font(
                                Font.custom("PT Root UI", size: 16)
                                  .weight(.medium)
                              )
                              .multilineTextAlignment(.center)
                              .foregroundColor(Color(red: 1, green: 0.6, blue: 0.46))
                              .frame(width: 170, alignment: .top)
                            
                            // H2
                            Text("Spiderman")
                              .font(
                                Font.custom("Cera Pro", size: 18)
                                  .weight(.bold)
                              )
                              .multilineTextAlignment(.center)
                              .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                            
                            Text(text)
                                .font(Font.custom("PT Root UI", size: 16))
                                .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                                .frame(width: .infinity, alignment: .topLeading)
                                .padding(.horizontal,8)
                            VStack{
                                HStack{
                                    Text("Video:")
                                        .foregroundColor(.orange)
                                    
                                    Text("https://www.youtube.com/")
                                      .font(
                                        Font.custom("Cera Pro", size: 18)
                                          .weight(.bold)
                                      )
                                      .multilineTextAlignment(.center)
                                      .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                                }
                                HStack{
                                    Text("Audio:")
                                        .foregroundColor(.orange)
                                    
                                    Text("https://www.youtube.com/mp3")
                                      .font(
                                        Font.custom("Cera Pro", size: 18)
                                          .weight(.bold)
                                      )
                                      .multilineTextAlignment(.center)
                                      .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                                }
                            }
                            
                            RaitingView(raiting: raiting)
                        }.padding()
                        
                        Button {
                            print("add")
                        } label: {
                            Text("Выложить подкаст")
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .foregroundColor(.black)
                        }
                        .frame(height: 40, alignment: .center)
                        .background(Color(red: 1, green: 0.6, blue: 0.46))
                        .cornerRadius(10)

                    }
                    Spacer()
                }
            }
           
        }
    }
}

struct WriterView_Previews: PreviewProvider {
    static var previews: some View {
        WriterView()
    }
}
