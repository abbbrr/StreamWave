//
//  KinoCard.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 10.09.2023.
//

import SwiftUI
import URLImage

struct KinoCard: View {
//    var carts: [PodcastCart] = [
//        PodcastCart(id: "1", name: "человек", image: "spiderman", author: "rauan", information: "dsadasdada", raiting: 3)
//    ]
//
    var podcast: PodcastCart
    
    var body: some View {
        VStack(alignment: .leading){
        //MARK: - card
            VStack(alignment: .leading, spacing: 10) {
                URLImage(URL(string: "\(podcast.image)")!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 220)
                        .cornerRadius(10)
                        .clipped()
                }
                .frame(width: 150, height: 230)

                RaitingView(raiting: podcast.raiting)

                VStack(alignment: .leading, spacing: 2) {
                    Text(podcast.name)
                        .font(Font.custom("PT Root UI", size: 12).weight(.medium))
                        .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(2) // Максимум 2 строки для имени подкаста

                    Text(podcast.author)
                        .font(Font.custom("PT Root UI", size: 10))
                        .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal, 4)
            }
            .padding(8)
            .cornerRadius(10)
            .frame(width: 200)

        }
        .padding()
        .padding(.horizontal)
    }
}

//struct KinoCard_Previews: PreviewProvider {
//    static var previews: some View {
//        KinoCard()
//    }
//}
