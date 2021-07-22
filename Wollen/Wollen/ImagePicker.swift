//
//  ImagePicker.swift
//  Wollen
//
//  Created by Palloma Ramos on 20/07/21.
//

import SwiftUI
import UIKit
import Combine

struct  ImagePicker: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    
    @Binding var show: Bool
    @Binding var image: Data
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePicker.Coordinator(child1: self)
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> some UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
//    func updateViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentable<ImagePicker>) {
//
//    }
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
        var child: ImagePicker
        init(child1: ImagePicker) {
            child = child1
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.child.show.toggle()
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])  {
            let image = info[.originalImage]as! UIImage
            let data = image.jpegData(compressionQuality: 0.45)
            
            self.child.image = data!
            self.child.show.toggle()
        }
    }
}
