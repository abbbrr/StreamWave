//
//  KinoCard.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 10.09.2023.
//

import SwiftUI

struct KinoCard: View {
    var carts: [PodcastCart] = [
        PodcastCart(name: "Новый человек-паук",image: "spiderman", author: "Ян Чихолдь", information: "крутой фильм", raiting: 4.5),
        PodcastCart(name: "Грокаем Алгоритмы",image: "grokaem", author: "Адитья Бхаргава", information: "крутой фильм", raiting: 3.5),
    ]
    
    
    var body: some View {
        ZStack(alignment: .leading){
                   Color("textFieldcolor")
                           .edgesIgnoringSafeArea(.all)
                       
                       VStack(alignment: .leading){
                           VStack(alignment: .leading){
                               Text("Рекомендуем")
                                 .font(.title3)
                                 .bold()
                                 .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                               
                               Text("\(carts.count) подкастов")
                                 .font(Font.custom("PT Root UI", size: 12))
                                 .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                           }
                           .padding()
                           .padding(.top, 30)
                       
                       Spacer()
                       
                       //MARK: - card
                       ScrollView(.horizontal){
                           HStack{
                               ForEach(carts, id: \.name) { cart in
                                   VStack(alignment: .leading, spacing: 4){
                                       Image("\(cart.image)")
                                           .resizable()
                                           .aspectRatio(contentMode: .fill)
                                           .frame(width: 99.73404, height: 150)
                                           .cornerRadius(10)
                                           .clipped()

                                       RaitingView(raiting: cart.raiting)
                                                              
                                       Text("\(cart.name)")
                                       .font(
                                       Font.custom("PT Root UI", size: 16)
                                           .weight(.medium)
                                       )
                                       .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                                       .frame(width: 104,height: 40, alignment: .topLeading)
                       
                                       Text("\(cart.author)")
                                         .font(Font.custom("PT Root UI", size: 12))
                                         .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                   }
                                   .padding(0)
                                   .frame(width: 100, alignment: .topLeading)
                                   .padding(.bottom, 50)
                               }.padding(.horizontal,4)
                           }
                           .padding(.horizontal, 10)
                       }
                   }
               }
               .frame(width: .infinity, height: 330)
               .overlay(
                   RoundedRectangle(cornerRadius: 15)
                   .inset(by: 0.5)
                   .stroke(Color(.gray), lineWidth: 1)
                   )
               .cornerRadius(15)
               .padding(.horizontal)
               .padding(.bottom)
    }
}

struct KinoCard_Previews: PreviewProvider {
    static var previews: some View {
        KinoCard()
    }
}
