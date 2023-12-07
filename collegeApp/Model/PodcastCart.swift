import Foundation
import Firebase
import FirebaseFirestore
import RealmSwift

struct PodcastCart: Identifiable, Encodable, Decodable,Equatable{
    var id: String = UUID().uuidString
    let name: String
    let image:String
    let author: String
    var information: String
    let videoUrl:String?
    var audioUrl:String?
    var raiting: Int
    var time: String
    var people: Int
    let genre:String
    var isLiked: Bool
}
