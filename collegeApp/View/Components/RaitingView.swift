//
//  RaitingView.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 12.09.2023.
//

import SwiftUI

struct RaitingView: View {
    let raiting:Double
    let maxRaiting: Int = 5
    
    var body: some View {
        HStack(spacing:15){
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
}

//struct RaitingView_Previews: PreviewProvider {
//    static var previews: some View {
//        RaitingView()
//    }
//}
