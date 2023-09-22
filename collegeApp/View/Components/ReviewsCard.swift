//
//  ReviewsCard.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 20.09.2023.
//

import SwiftUI

struct Review: Identifiable {
    var id = UUID()
    var author: String
    var text: String
    var raiting:Double
}


struct ReviewsCard: View {
    
    let allReviews: [Review] = [
        Review(author: "ruanablaikz45@gmail.com", text: "Отличная книга!!", raiting: 4.5),
        Review(author: "adel@gmail.com", text: "Все понравилась, подкаст интересный, захватывающий", raiting: 2.4),
        Review(author: "abr010202@gmail.com", text: "Все супер интересно", raiting: 3.5),
        Review(author: "iskaSosiska@gmail.com", text: "Искандер лох!", raiting: 1.4),
    ]

    @Binding var showAllReviews: Bool
    
    
    let maxRaiting: Int = 5
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            //MARK: -reviews, profile
            ForEach(showAllReviews ? Array(allReviews) : Array(allReviews.prefix(2))) {review in
                VStack(alignment: .leading,spacing: 13){
                    VStack(alignment: .leading,spacing: 2){
                        Text("\(review.author)")
                            .foregroundColor(.blue)
                          
                        
                        HStack(spacing: 15){
                            ForEach(1..<maxRaiting + 1, id: \.self){ star in
                                Image(systemName: star <= Int(review.raiting) ? "star.fill" : "star")
                                    .padding(.top)
                                    .padding(.leading)
                                    .frame(width: 6, height: 5)
                                    .foregroundColor(.yellow)
                                    .padding(.bottom)
                            }
                        }
                    }
                    Text("\(review.text)")
                        .foregroundColor(.white)
                        .frame(width: .infinity, alignment: .topLeading)
                }
            }
            
        }
        .padding(.top)
    }
}

//struct ReviewsCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewsCard(showAllReviews: false)
//    }
//}
