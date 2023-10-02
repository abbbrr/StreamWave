//
//  AddPodcast.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 22.09.2023.
//

import SwiftUI
import Firebase
import FirebaseStorage


struct AddPodcast: View {
    @State var isPickerShow = false
//    @State var image = UIImage(systemName: "photo")!
    
    @State private var imageURL: URL?
    @State private var selectedImage: UIImage?
    
    
    var body: some View {
            VStack {



            }
            .padding()
        }
    
    func uploadImageToFirebase() {
        guard let selectedImage = selectedImage else { return }
        
        let storageRef = Storage.storage().reference().child("logoPodcast").child(UUID().uuidString)
        if let imageData = selectedImage.jpegData(compressionQuality: 0.5) {
            storageRef.putData(imageData, metadata: nil) { (metadata, error) in
                if let error = error {
                    print("Error uploading image: \(error.localizedDescription)")
                } else {
                    storageRef.downloadURL { (url, error) in
                        if let error = error {
                            print("Error fetching download URL: \(error.localizedDescription)")
                        } else {
                            if let url = url {
                                imageURL = url
                            }
                        }
                    }
                }
            }
        }
    }
    
}



struct AddPodcast_Previews: PreviewProvider {
    static var previews: some View {
        AddPodcast()
    }
}
