//
//  TableList.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 20.09.2023.
//

import SwiftUI

struct TableList: View {
    var body: some View {
        ZStack(alignment: .leading){
                   Color("textFieldcolor")
                           .edgesIgnoringSafeArea(.all)
                       
                       VStack(alignment: .leading){
                           
                           HStack(spacing: 20){
                               Image(systemName: "gearshape")
                                   .font(.title2)
                                   .foregroundColor(.white)
                
                               Text("Настройки")
                                 .font(
                                   Font.custom("PT Root UI", size: 16)
                                     .weight(.medium)
                                 )
                                 .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                               
                           }
                           .padding(10)
                           
                           Divider()
                               .background(Color.gray)
                               .frame(width: .infinity)
                           
                           HStack(spacing: 20){
                               Image(systemName: "star")
                                   .font(.title2)
                                   .foregroundColor(Color(red: 1, green: 0.6, blue: 0.46))
                
                               Text("Поддержка")
                                 .font(
                                   Font.custom("PT Root UI", size: 16)
                                     .weight(.medium)
                                 )
                                 .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                               
                           }
                           .padding(10)
                
                    
                   }
            
               }
               .frame(width: .infinity, height: 130)
               .overlay(
                   RoundedRectangle(cornerRadius: 15)
                   .inset(by: 0.5)
                   .stroke(Color(red: 0.27, green: 0.27, blue: 0.27), lineWidth: 1)
                   )
               .cornerRadius(15)
               .padding(.horizontal)
               .padding(.bottom)
    }
}

struct TableList_Previews: PreviewProvider {
    static var previews: some View {
        TableList()
    }
}
