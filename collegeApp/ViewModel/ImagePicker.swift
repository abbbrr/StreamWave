//
//  ImagePicker.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 22.09.2023.
//

import Foundation
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable{
    @Binding var image: Image?
    @Binding var isShown: Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
           let picker = UIImagePickerController()
           picker.delegate = context.coordinator
           return picker
       }

       func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

       func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }

       class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
           let parent: ImagePicker

           init(_ parent: ImagePicker) {
               self.parent = parent
           }

           func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
               if let uiImage = info[.originalImage] as? UIImage {
                   parent.image = Image(uiImage: uiImage)
               }
               parent.isShown = false
           }

           func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
               parent.isShown = false
           }
       }
}
