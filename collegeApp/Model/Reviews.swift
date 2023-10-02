//
//  Reviews.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 28.09.2023.
//

import Foundation
import RealmSwift

struct Reviews{
    var id: String = UUID().uuidString
    var text: String
    var raiting: Int
    var author: String
}
