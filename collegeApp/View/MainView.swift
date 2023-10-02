//
//  MainView.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 10.09.2023.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var firestoreManager:CartViewModel
    @Binding var email:String

    
    let columns = [
        GridItem(.fixed(200)),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ZStack{
            Color("backgroudColor")
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack(alignment: .leading){
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

                        VStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("Рекомендуем")
                                  .font(.title2)
                                  .bold()
                                  .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))

                                Text("\(firestoreManager.podcasts.count) подкаста")
                                  .font(Font.custom("PT Root UI", size: 15))
                                  .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                            }
                            .padding()
                            .padding(.top, 30)

                            VStack {
                                LazyVGrid(columns: columns, spacing: 20) {
                                    ForEach(firestoreManager.podcasts, id: \.id) { podcast in
                                        NavigationLink(destination: PageScreenView(email: $email, podcast: podcast)) {
                                            KinoCard(podcast: podcast)
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                            .padding()
                            .onAppear(){
                                firestoreManager.fetchData()
                            }
                        }
                    }
                }
               
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(email: .constant("Sd"))
    }
}
