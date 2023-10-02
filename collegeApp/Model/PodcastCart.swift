//
//  PodcastCart.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 12.09.2023.
//

import Foundation
import Firebase
import FirebaseFirestore
import RealmSwift

struct PodcastCart: Identifiable{
    var id: String = UUID().uuidString
    let name: String
    let image:String
    let author: String
    var information: String
    var videoUrl:String?
    var audioUrl:String?
    var raiting: Int
}
