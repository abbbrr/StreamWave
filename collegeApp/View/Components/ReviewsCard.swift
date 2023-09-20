//
//  ReviewsCard.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 20.09.2023.
//

import SwiftUI

struct ReviewsCard: View {
    let text = "Это было захватывающее и увлекательное путешествие. Я очень люблю работы Миядзаки, с самого раннего детства. И эта книга заставила меня полюбить их ещё сильнее."
    
    @State  var isShowingText = false
    
    
    let raiting:Double = 4.6
    let maxRaiting: Int = 5
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            //MARK: -reviews, profile
            VStack(alignment: .leading,spacing: 13){
                VStack(alignment: .leading,spacing: 2){
                    Text("ruanablaikz45@gmail.com")
                        .foregroundColor(.white)
                      
                    
                    HStack(spacing: 15){
                        ForEach(1..<maxRaiting + 1, id: \.self){ star in
                            Image(systemName: star <= Int(raiting) ? "star.fill" : "star")
                                .padding(.top)
                                .padding(.leading)
                                .frame(width: 6, height: 5)
                                .foregroundColor(.yellow)
                                .padding(.bottom)
                        }
                    }
                }
                Text(text)
                    .foregroundColor(.white)
                    .frame(width: .infinity, alignment: .topLeading)
            }
        }.padding(.top)
    }
}

struct ReviewsCard_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsCard()
    }
}
