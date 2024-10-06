//
//  Order.swift
//  app926
//
//  Created by Dias Atudinov on 07.10.2024.
//

import SwiftUI

struct Order: Hashable, Codable {
    var id = UUID()
    var imageData: Data?
    var name: String
    var clientName: String
    var phoneNumber: String
    var productQuantity: String
    var adress: String
    var price: String
    var date: Date
    var time: Date
    var notes: String
    
    var isArchive: Bool {
        get {
            let currentDate = Date()
            let calendar = Calendar.current
            let orderDateTime = calendar.date(bySettingHour: calendar.component(.hour, from: time),
                                              minute: calendar.component(.minute, from: time),
                                              second: 0, of: date) ?? date
            return orderDateTime < currentDate
        }
    }
    
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
