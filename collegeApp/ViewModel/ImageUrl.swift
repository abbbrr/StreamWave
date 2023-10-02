//
//  ImageUrl.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 22.09.2023.
//

import Foundation
import Firebase

class ImageUrl: ObservableObject{
    func loadImage() {
        guard let selectedImage = image else {
            return
        }

        // Преобразуйте изображение Image в Data
        if let imageData = selectedImage.asUIImage()?.jpegData(compressionQuality: 0.5) {
            let storage = Storage.storage()
            let storageReference = storage.reference()
            let imageReference = storageReference.child("images").child(UUID().uuidString + ".jpg")

            imageReference.putData(imageData, metadata: nil) { metadata, error in
                if let error = error {
                    print("Ошибка при загрузке изображения в Firebase Storage: \(error.localizedDescription)")
                } else {
                    print("Изображение успешно загружено в Firebase Storage")
                    
                    // Здесь вы можете выполнить дополнительные действия, например, сохранить URL изображения в базе данных Firestore или Realtime Database.
                }
            }
        }
    }

}
