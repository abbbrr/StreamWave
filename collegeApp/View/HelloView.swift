//
//  HelloView.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 09.09.2023.
//

import SwiftUI

struct HelloView: View {
    @Binding var isLoggedIn: Bool
    
    var body: some View {
//        NavigationView {
            ZStack{
                Color("backgroudColor")
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center, spacing: 15){
                    Spacer()
                    
                    Image("micro")
                        .resizable()
                        .frame(width: .infinity, height: 300)
                    
                    // H1
                    Text("Добро пожаловать в StreamWave ")
                      .font(
                        Font.custom("Cera Pro", size: 28)
                          .weight(.bold)
                      )
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                      .frame(width: 270, alignment: .top)
                  
                    
                    // text
                    Text("Доступно тысячи подкастов для прослушивания бесплатно.")
                      .font(Font.custom("PT Root UI", size: 16))
                      .multilineTextAlignment(.center)
                      .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                      .frame(width: 270, alignment: .top)
                    
                    
                    Spacer()
                    
                    //MARK: -auth
                    
                    NavigationLink(destination: AuthView(isLoggedIn:$isLoggedIn, login:true)){
                        Text("Зарегистрироваться")
                            .frame(width: 343, height: 48, alignment: .center)
                            .background(Color(red: 1, green: 0.6, blue: 0.46))
                            .cornerRadius(10)
                            .font(
                                Font.custom("SF Pro Text", size: 17)
                                .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.16))
                    }
                    NavigationLink(destination: AuthView(isLoggedIn:$isLoggedIn, login: false)){
                        Text("Войти")
                            .frame(width: 343, height: 48, alignment: .center)
                            .background(Color(red: 0.16, green: 0.16, blue: 0.16))
                            .cornerRadius(10)
                            .font(
                                Font.custom("SF Pro Text", size: 17)
                                .weight(.semibold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 1, green: 0.6, blue: 0.46))
                                           
                    }
                    
                    Spacer()
                }
            }
//        }
    }
}

//struct HelloView_Previews: PreviewProvider {
//    static var previews: some View {
//        HelloView(isLoggedIn: $isLoggedIn)
//    }
//}
