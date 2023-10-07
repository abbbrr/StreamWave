import Foundation


class LikeViewModel: ObservableObject{
    @Published var likedPodcasts: [PodcastCart] = []
    
    func addToLiked(podcast:PodcastCart){
        likedPodcasts.append(podcast)
        saveLikedPodcast()
    }
    
    func saveLikedPodcast(){
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(likedPodcasts){
            UserDefaults.standard.set(encodedData, forKey: "LikedPodcasts")
        }
    }
    
    func removePodcast(podcast:PodcastCart){
        likedPodcasts.removeAll{ $0.id == podcast.id }
        saveLikedPodcast()
    }
    
    func loadLikedPodcasts() {
            if let savedData = UserDefaults.standard.data(forKey: "LikedPodcasts") {
                let decoder = JSONDecoder()
                if let loadedPodcasts = try? decoder.decode([PodcastCart].self, from: savedData) {
                    likedPodcasts = loadedPodcasts
                }
            }
        }
    
}
