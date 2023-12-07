import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class LikeViewModel: ObservableObject {
    @Published var likedPodcasts: [PodcastCart] = [] {
        didSet {
            saveLikedPodcast()
        }
    }
    private var db = Firestore.firestore()

    init() {
        loadLikedPodcasts()
    }

    func addToLiked(podcast: PodcastCart) {
        guard !likedPodcasts.contains(where: { $0.id == podcast.id }) else {
            return
        }

        var updatedPodcast = podcast
        updatedPodcast.isLiked = true
        likedPodcasts.append(updatedPodcast)
        updateFirestore(isLiked: true, podcast: updatedPodcast)
    }

    func removePodcast(podcast: PodcastCart) {
        guard let index = likedPodcasts.firstIndex(where: { $0.id == podcast.id }) else {
            return
        }

        var updatedPodcast = podcast
        updatedPodcast.isLiked = false
        likedPodcasts.remove(at: index)
        updateFirestore(isLiked: false, podcast: updatedPodcast)
    }

    private func saveLikedPodcast() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(likedPodcasts) {
            UserDefaults.standard.set(encodedData, forKey: "LikedPodcasts")
        }
    }

    private func loadLikedPodcasts() {
        if let savedData = UserDefaults.standard.data(forKey: "LikedPodcasts") {
            let decoder = JSONDecoder()
            if let loadedPodcasts = try? decoder.decode([PodcastCart].self, from: savedData) {
                likedPodcasts = loadedPodcasts
            }
        }
    }

    private func updateFirestore(isLiked: Bool, podcast: PodcastCart) {
        let docRef = db.collection("PodcastCard").document(podcast.id)

        docRef.updateData(["isLiked": isLiked]) { error in
            if let error = error {
                print("Error updating document: \(error)")
            } else {
                print("Document successfully updated")
            }
        }
    }
}
