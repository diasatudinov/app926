//
//  Dessert.swift
//  app926
//
//  Created by Dias Atudinov on 04.10.2024.
//

import SwiftUI

struct Dessert: Hashable, Codable {
    var id = UUID()
    var imageData: Data?
    var name: String
    var grade: Double
    var notes: String
    
    var image: UIImage? {
        get {
            guard let data = imageData else { return nil }
            return UIImage(data: data)
        }
        set {
            imageData = newValue?.jpegData(compressionQuality: 1.0)
        }
    }
    
}

