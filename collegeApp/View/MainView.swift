//
//  MainView.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 10.09.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack{
            Color("backgroudColor")
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack{
                        VStack(alignment: .leading){
                            Text("Подкасты для тебя")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading) // Выравнивание по левому краю
                                .padding(.top, 20) // Отступ сверху
                                .padding(.leading, 20) // Отступ слева
                        }.padding(.bottom)
                        
                        Spacer()
                        
                        VStack{
                            KinoCard()
                        }
                    }
                }
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
