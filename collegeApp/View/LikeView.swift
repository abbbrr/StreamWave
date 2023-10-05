//
//  LikeView.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 02.10.2023.
//

import SwiftUI
import URLImage

//struct ModalView: View {
//    private let url = URL(string: "https://www.appcoda.com")!
//
//    @State private var isShareSheetPresented = false
//
//    var body: some View {
//        ZStack{
//            Color("backgroudColor")
//                    .edgesIgnoringSafeArea(.all)
//            ZStack(alignment: .leading){
//                       Color("textFieldcolor")
//                               .edgesIgnoringSafeArea(.all)
//
//                    VStack(alignment: .leading){
//                            HStack{
//                                Image(systemName: "plus.circle")
//                                    .font(Font.custom("SF Pro Display", size: 19))
//                                    .multilineTextAlignment(.center)
//                                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
//                                    .frame(width: 32, height: 32, alignment: .center)
//
//                                Text("Добавить книгу на полку")
//                                  .font(Font.custom("PT Root UI", size: 16))
//                                  .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
//                            }
//                            .padding(.leading)
//
//                            Divider()
//                            .frame(height: 0.5)
//                                .background(Color.gray)
//                            Button {
//                                let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
//
//                                           // Для iPad, чтобы избежать краша, нужно указать источник кнопки
//                                if let popoverController = activityViewController.popoverPresentationController {
//                                    popoverController.sourceView = UIApplication.shared.windows.first
//                                        popoverController.sourceRect = CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2, width: 0, height: 0)
//                                }
//
//                                UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
//                            } label: {
//                                HStack{
//                                    Image(systemName: "square.and.arrow.up")
//                                        .font(Font.custom("SF Pro Display", size: 19))
//                                        .multilineTextAlignment(.center)
//                                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
//                                        .frame(width: 32, height: 32, alignment: .center)
//
//                                    Text("Поделиться")
//                                      .font(Font.custom("PT Root UI", size: 16))
//                                      .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
//
//                                }
//                                .padding(.leading)
//                            }
//                        }
//                   }
//                   .frame(width: .infinity, height: 110)
//                   .overlay(
//                       RoundedRectangle(cornerRadius: 15)
//                       .inset(by: 0.5)
//                       .stroke(Color(red: 0.27, green: 0.27, blue: 0.27), lineWidth: 1)
//                       )
//                   .cornerRadius(15)
//                   .padding(.horizontal)
//                   .padding(.bottom)
//        }
//    }
//}
//
struct LikeView: View {
    @State private var isShowSheet = false
    @EnvironmentObject var likeViewModel:LikeViewModel
    
    var body: some View {
        ZStack(alignment: .leading){
            Color("backgroudColor")
                    .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack(alignment: .leading, spacing: 25){
                    Text("\(likeViewModel.likedPodcasts.count) подкастов")
                        .font(
                            Font.custom("PT Root UI", size: 16)
                            .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                        .frame(width: 170, alignment: .topLeading)

                    ForEach(likeViewModel.likedPodcasts, id: \.id){ podcast in
                        VStack{
                            HStack(alignment: .top, spacing: 20){
                                //photo
                                URLImage(URL(string: "\(podcast.image)")!){ image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 156.41293334960938)
                                        .clipped()
                                        .cornerRadius(10)
                                }
                                
                                VStack(alignment: .leading, spacing: 4){
                                  //first text
                                    HStack{
                                        Text("\(podcast.name)")
                                          .font(
                                            Font.custom("PT Root UI", size: 16)
                                              .weight(.medium)
                                          )
                                          .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                                          .frame(width: 170, alignment: .topLeading)
                                        Button {
                                            self.isShowSheet.toggle()
                                        } label: {
                                            Image("vector")
                                                .resizable()
                                                .frame(width: 3.5, height: 18.2)
                                                .padding(.bottom, 40)
                                                .padding(.horizontal)
                                        }.sheet(isPresented: $isShowSheet) {
//                                            ModalView()
                                            VStack{
                                                
                                            }
                                        }
                                    }
                                   
                                    
                                  // ssecond text
                                    Text("\(podcast.author)")
                                      .font(Font.custom("PT Root UI", size: 12))
                                      .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                      .frame(width: 170, alignment: .topLeading)
                                    
                                  //raiting
                                    RaitingView(raiting: 4)
                                }
                                .padding(0)
                                .frame(width: 179, height: 144, alignment: .topLeading)

                            }
                            .padding(0)
                            .frame(width: 343, height: 144, alignment: .top)
                        }
                    }
                    
                }.padding()
            }.padding()
        }
    }
}

//struct ModalView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalView()
//    }
//}


//struct LikeView_Previews: PreviewProvider {
//    static var previews: some View {
//        LikeView()
//    }
//}
