//
//  Additional.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 20.09.2023.
//

import SwiftUI

struct Additional: View {
    var body: some View {
        HStack(spacing: 50){
            VStack{
                ZStack{
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.27, green: 0.27, blue: 0.27), lineWidth: 1)
                        )
                        .overlay(
                            Image(systemName: "clock")
                                .font(.title2)
                                .foregroundColor(Color(red: 1, green: 0.6, blue: 0.46))
                        )
                    
                }

                Text("00:27:27")
                  .font(
                    Font.custom("PT Root UI", size: 16)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                
                Text("по времени")
                  .font(Font.custom("PT Root UI", size: 12))
                  .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
            }
            VStack{
                ZStack{
                    Circle()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.27, green: 0.27, blue: 0.27), lineWidth: 1)
                        )
                        .overlay(
                            Image(systemName: "person")
                                .font(.title2)
                                .foregroundColor(Color(red: 1, green: 0.6, blue: 0.46))
                        )
                    
                }

                Text("2500 чел")
                  .font(
                    Font.custom("PT Root UI", size: 16)
                      .weight(.medium)
                  )
                  .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                
                Text("прослушали")
                  .font(Font.custom("PT Root UI", size: 12))
                  .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
            }
           
        }
    }
}

struct Additional_Previews: PreviewProvider {
    static var previews: some View {
        Additional()
    }
}
