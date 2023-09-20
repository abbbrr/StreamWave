//
//  ProfileView.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 20.09.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack{
            Color("backgroudColor")
                    .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center, spacing: 40){
                //MARK: - personInfo
                VStack(alignment: .center,spacing: 5){
                    Text("Привет,")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                        .frame(width: 250)
                    
                    Text("ruanablaikz45@gmail.com!")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                        .frame(width: 250)

                    Text("Прочитано 6 книг за 7 недель")
                      .font(Font.custom("PT Root UI", size: 16))
                      .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                }
                .padding(.horizontal)
                
                //MARK: - infoReading
                AdditionalSecond()
                
                //MARK: -table
                TableList()
                
                
                //MARK: -exit Button
                Button {
                    print("exit")
                } label: {
                    Text("Выйти")
                        .foregroundColor(.red)
                        .frame(width: 343, height: 48, alignment: .center)
                        .background(Color("textFieldcolor"))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.27, green: 0.27, blue: 0.27), lineWidth: 1)
                        )
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
