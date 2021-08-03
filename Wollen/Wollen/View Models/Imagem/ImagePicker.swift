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
    @Binding var image: UIImage
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePicker.Coordinator(child1: self)
    }
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> some UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = context.coordinator
        return picker
    }
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
        var child: ImagePicker
        init(child1: ImagePicker) {
            child = child1
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.child.show.toggle()
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])  {
            
            self.child.image = (info[.originalImage] as! UIImage)
            NotificationCenter.default.post(Notification.init(name: Notification.Name("atualiza_array_images")))
            //self.child.image.append(info[.originalImage] as! UIImage)
            self.child.show.toggle()
        }
    }
}


