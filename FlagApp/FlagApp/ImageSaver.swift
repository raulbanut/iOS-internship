//
//  ImageSaver.swift
//  FlagApp
//
//  Created by Banut Raul on 24.03.2022.
//

import Foundation
import UIKit

class ImageSaver: NSObject, ObservableObject {
    @Published var isSaved = false
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(savedCompleted), nil)
    }
    
    @objc func savedCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
        isSaved = true
    }
}


