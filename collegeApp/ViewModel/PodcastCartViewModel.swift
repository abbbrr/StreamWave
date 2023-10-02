////
////  PodcastCartViewModel.swift
////  collegeApp
////
////  Created by Рауан Аблайхан on 02.10.2023.
////
//
//import Foundation
//import RealmSwift
//
//class PodcastCartViewModel:ObservableObject{
//    @Published var podcastCart: PodcastCart
//    
//    init(){
//            let realm = try! Realm()
//            if let existingPodcastCart = realm.objects(PodcastCart.self).first {
//                podcastCart = existingPodcastCart
//            } else {
//                podcastCart = PodcastCart()
//                try! realm.write{
//                    realm.add(podcastCart)
//                }
//            }
//        }
//    
//    func addReview(text:String, raiting:Int, author:String){
//        let realm = try! Realm()
//        try! realm.write{
//            let newReview = Reviews()
//            newReview.text = text
//            newReview.raiting = raiting
//            newReview.author = author
//            
//            podcastCart.reviews.append(newReview)
//        }
//    }
//    
//}
