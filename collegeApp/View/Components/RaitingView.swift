import SwiftUI

struct RaitingView: View {
    let raiting:Int
    let maxRaiting: Int = 5
    
    var body: some View {
        HStack(spacing:19){
            ForEach(1..<maxRaiting + 1, id: \.self){ star in
                Image(systemName: star <= Int(raiting) ? "star.fill" : "star")
                    .padding(.top)
                    .padding(.leading)
                    .frame(width: 5, height: 4)
                    .foregroundColor(.yellow)
                    .padding(.bottom)
            }
        }
    }
}
