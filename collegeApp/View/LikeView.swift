import SwiftUI
import URLImage

struct LikeView: View {
    @Binding var email: String
    @State private var isShowSheet = false
    @EnvironmentObject var likeViewModel: LikeViewModel

    var body: some View {
        ZStack{
            Color("backgroudColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("\(likeViewModel.likedPodcasts.count) подкастов ")
                              .font(Font.custom("PT Root UI", size: 16).weight(.medium))
                              .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                              .padding(.horizontal)
//                              .padding(.top,5)
                
                List(likeViewModel.likedPodcasts, id: \.id) { podcast in
                    NavigationLink(destination: PageScreenView(email: $email, podcast: podcast)) {
                        HStack(alignment: .top, spacing: 20) {
                            // Photo
                            URLImage(URL(string: "\(podcast.image)")!) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 140.41293334960938)
                                    .clipped()
                                    .cornerRadius(10)
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                // First text
                                HStack {
                                    Text("\(podcast.name)")
                                        .font(
                                            Font.custom("PT Root UI", size: 16)
                                                .weight(.medium)
                                        )
                                        .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                                        .frame(width: 170, alignment: .topLeading)

                                    Button {
                                        self.isShowSheet.toggle()
                                    } label: {
                                        Image("vector")
                                            .resizable()
                                            .frame(width: 3.5, height: 18.2)
                                            .padding(.bottom, 40)
                                            .padding(.horizontal)
                                    }
                                }

                                // Second text
                                Text("\(podcast.author)")
                                    .font(Font.custom("PT Root UI", size: 12))
                                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                    .frame(width: 170, alignment: .topLeading)

                                // Rating
                                RaitingView(raiting: 4)
                            }
                            .padding(0)
                            .frame(width: 179, height: 144, alignment: .topLeading)
                        }
                        .padding(0)
                        .frame(width: 343, height: 144, alignment: .top)
                    }
                    .listRowBackground(Color("backgroudColor"))
                    .swipeActions {
                        Button(action: {
                            likeViewModel.removePodcast(podcast: podcast)
                        }) {
                            Label("Удалить", systemImage: "trash")
                        }
                    }
                }
                .listStyle(PlainListStyle())

//                .padding()
            }
//            .padding()
        }
    }
}
