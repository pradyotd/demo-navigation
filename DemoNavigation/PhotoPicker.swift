//
//  PhotoPicker.swift
//  DemoNavigation
//
//  Created by PRADYOT DHULIPALA on 1/28/22.
//

import Foundation
import SwiftUI
import UIKit
import PhotosUI
import UniformTypeIdentifiers


struct PhotoPicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    //var didFinishPicking: (_ didSelectItems: Bool) -> Void
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1
        config.preferredAssetRepresentationMode = .current
        let controller = PHPickerViewController(configuration: config)
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Use a Coordinator to act as your PHPickerViewControllerDelegate
    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        
        private let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            print(results)
            
            guard !results.isEmpty else {
                return
            }
            guard let itemProvider = results.first?.itemProvider else { return }
            print("Invoking getPhoto")
            self.getPhoto(from: itemProvider)
            //parent.didFinishPicking(!results.isEmpty)
        }
        
        private func getPhoto(from itemProvider: NSItemProvider) {
            print("getPhoto")
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                    self.parent.image = image as? UIImage
                    print("Loaded Image error: \(error)")
                }
            }
        }
    }
}

