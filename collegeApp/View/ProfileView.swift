//
//  ProfileView.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 20.09.2023.
//

import SwiftUI
import Firebase

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)].uppercased())
    }
}

struct ProfileView: View {
    @Binding var email:String
    @Binding var pass:String
    @Binding var isLoggedIn:Bool
    
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("backgroudColor")
                        .edgesIgnoringSafeArea(.all)

                VStack(alignment: .center, spacing: 40){
                    //MARK: - personInfo
                    VStack(alignment: .center,spacing: 5){
                        let name = String(email[email.startIndex]).uppercased() + String(email.split(separator: "")[1][email.split(separator: "")[1].startIndex]).uppercased()
                        
                        ZStack {
                            Circle().frame(width: 50, height: 50)
                            Text(name).foregroundStyle(Color(UIColor.white))
                        }
                        
                        Text("\(email)!")
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
                    TableList(pass:$pass)
                    
                    
                    //MARK: -exit Button
                    Button {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                            do{
                                try Auth.auth().signOut()
                                self.isLoggedIn = false
                                print("okkk")
                            } catch let error{
                                print("Ошибка при выходе из аккаунта: \(error.localizedDescription)")
                            }
                        }
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
}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView(email: .constant("raun@gmail"), pass: .constant("adsad"), user: People.init(email: "rayn", password: "adsads"))
//    }
//}
