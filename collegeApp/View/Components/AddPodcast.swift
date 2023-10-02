//
//  AddPodcast.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 24.09.2023.
//

import SwiftUI


struct AddPodcast: View {
    @State var name = ""
    @State var image = ""
    @State var author = ""
    @State var information = "" 
    @State var videoUrl = ""
    @State var raiting: Double = 0.0
    
    var body: some View {
        VStack {
            Text("Заполните свой подкаст!")
                .font(.title3)
                .bold()
                .padding()
            VStack{
                TextField("Введите название подкаста", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("URL на обложку", text: $image)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("ФИО автора", text: $author)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Краткое описание вашего подкаста", text: $information)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Ссылка на ваш подкаст", text: $videoUrl)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Slider(value: $raiting, in: 0.0...5.0, step: 0.1)
                               .padding()

                Text("Рейтинг: \(raiting, specifier: "%.1f")")
                    .font(.headline)
                
            }.padding()
            
                Button {
                    //
                } label: {
                    HStack{
                        Text("Отправить")
                            .font(
                                Font.custom("Cera Pro", size: 20)
                                .weight(.bold)
                            )
                        Image(systemName: "arrow.up.square")
                            .font(
                                Font.custom("Cera Pro", size: 20)
                                .weight(.bold)
                            )
                        }
                }
                .padding()
        }
    }
}

struct AddPodcast_Previews: PreviewProvider {
    static var previews: some View {
        AddPodcast()
    }
}
