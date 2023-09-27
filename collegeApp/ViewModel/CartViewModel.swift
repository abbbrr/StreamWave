import Foundation
import Firebase
import FirebaseFirestore

class CartViewModel:ObservableObject{
    @Published var podcasts = [PodcastCart]()

    private var db = Firestore.firestore()
    
    init() {
        fetchData()
    }
    
    
    func fetchData(){
        db.collection("PodcastCard").getDocuments {(querySnapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.podcasts = []
            
            for document in documents {
                let data = document.data()
                let name = data["name"] as? String ?? ""
                let image = data["image"] as? String ?? ""
                let author = data["author"] as? String ?? ""
                let information = data["information"] as? String ?? ""
                let videoUrl = data["videoUrl"] as? String ?? ""
                let audioUrl = data["audioUrl"] as? String ?? ""
                let raiting = data["raiting"] as? Int ?? 0
                
                let podcast = PodcastCart(id: .init(), name: name, image: image, author: author, information: information, videoUrl: videoUrl, audioUrl: audioUrl, raiting: raiting)
                self.podcasts.append(podcast)
            }
        }
    }
    
}
