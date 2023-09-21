//
//  CartViewModel.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 21.09.2023.
//

import Foundation
import FirebaseFirestore

class CartViewModel:ObservableObject{
    
    func addPodcastCart(podcastCart: PodcastCart){
        let db = Firestore.firestore()
        
        db.collection("podcastCart").addDocument(data: [
            "name": podcastCart.name,
            "image": podcastCart.image,
            "author": podcastCart.author,
            "information": podcastCart.information,
            "video": podcastCart.videoUrl,
            "raiting": podcastCart.raiting
        ]) { (error) in
            if let error = error {
                print("Ошибка при добавлении карточки в Firestore: \(error)")
            } else{
                print("Карточка успешно добавлена в Firestore")
            }
        }
    }
    
    
    func getPodcastCart(completion: @escaping([PodcastCart]?, Error?) -> Void){
        let db = Firestore.firestore()
        
        db.collection("podcastCart").getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(nil, error)
            } else {
                var podcastCarts = [PodcastCart]()
                
                for document in querySnapshot!.documents{
                    if let data = document.data() as? [String: Any],
                       let name = data["name"] as? String,
                       let image = data["image"] as? String,
                       let author = data["author"] as? String,
                       let information = data["information"] as? String,
                       let video = data["videoUrl"] as? String,
                       let raiting = data["raiting"] as? Double{
                            
                        let podcastCard = PodcastCart(name: name, image: image, author: author, information: information, videoUrl: video,  raiting: raiting)
                        podcastCarts.append(podcastCard)
                    }
                }
                completion(podcastCarts, nil)
            }
        }
    }
}
