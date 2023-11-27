import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var firestoreManager: CartViewModel
    @Binding var email: String
    
    @State private var selectedButton: String?
    @State private var filteredPodcasts: [PodcastCart] = []
    
    @State private var searchPodcast = ""
    @State private var isTrueSearch = false
    
    let columns = [
        GridItem(.fixed(200)),
        GridItem(.flexible()),
    ]
    
    @State private var selectedGenre: String?
    
    var genreFilterd: [PodcastCart] {
           if let selectedGenre = selectedGenre {
               return firestoreManager.podcasts.filter { $0.genre == selectedGenre }
           } else {
               return firestoreManager.podcasts
           }
       }

       var searchFilteredPodcasts: [PodcastCart] {
           if searchPodcast.isEmpty {
               return genreFilterd
           } else {
               return genreFilterd.filter { $0.name.lowercased().contains(searchPodcast.lowercased()) }
           }
       }

       var finalFilteredPodcasts: [PodcastCart] {
           if let selectedGenre = selectedGenre, !searchPodcast.isEmpty {
               return genreFilterd.filter { $0.name.lowercased().contains(searchPodcast.lowercased()) && $0.genre == selectedGenre }
           } else {
               return searchFilteredPodcasts
           }
       }
    
    var body: some View {
        ZStack {
            Color("backgroudColor")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Подкасты для тебя")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                    }
                    .padding(.bottom)
                    
                    TextField("Введите ваш подкаст!", text: $searchPodcast)
                        .font(Font.system(size: 17, weight: .regular))
                        .padding(15)
                        .background(Color(.white))
                        .cornerRadius(13)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .padding()
                    
                    Spacer()
                    
                    HStack {
                        ForEach(["Хорор", "Любовь"], id: \.self) { genre in
                            Button(action: {
                                if selectedGenre == genre {
                                        selectedGenre = nil
                                        selectedButton = nil
                                    } else {
                                        selectedGenre = genre
                                        selectedButton = genre
                                    }
                                    filterPodcasts()
                            }) {
                                Text(genre)
                                    .foregroundColor(genre == selectedButton ? .white : .black)
                                    .padding(.vertical, 12)
                                    .frame(width: 148, height: 48, alignment: .center)
                                    .background(genre == selectedButton ? Color(.black) : Color(red: 1, green: 0.6, blue: 0.46))
                                    .cornerRadius(10)
                                    .disabled(genre != selectedButton && selectedButton != nil)
                            }
                        }
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Рекомендуем")
                                .font(.title2)
                                .bold()
                                .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                            
                            Text("\(firestoreManager.podcasts.count) подкаста")
                                .font(Font.custom("PT Root UI", size: 15))
                                .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                        }
                        .padding()
                        
                        VStack {
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(finalFilteredPodcasts, id: \.id) { podcast in
                                    NavigationLink(destination: PageScreenView(email: $email, podcast: podcast)) {
                                        KinoCard(podcast: podcast)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(20)
                        .onAppear() {
                            firestoreManager.fetchData()
                        }
                    }
                }
            }
        }
    }
    
    func filterPodcasts() {
        if let selectedGenre = selectedGenre {
            filteredPodcasts = firestoreManager.podcasts.filter { $0.genre == selectedGenre }
        } else {
            filteredPodcasts = firestoreManager.podcasts
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(email: .constant("Sd"))
            .environmentObject(CartViewModel()) 
    }
}
