//
//  HomeViewModel.swift
//  app926
//
//  Created by Dias Atudinov on 04.10.2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var order: StatOrder = StatOrder(fulfilled: 0, total: 0, earnings: 0) {
        didSet {
            progressCount()
        }
    }
    @Published var progress = 0.0
    
    @Published var deserts: [Dessert] = []
    
    func progressCount() {
        var progress = 0.0
        progress = Double(order.fulfilled)/Double(order.total)
        if progress == 0 {
            self.progress = 0
        } else {
            
            self.progress = progress
        }
    }
    
    func editOrder(_ newFulfilled: Int, _ newTotal: Int) {
        order.fulfilled = newFulfilled
        order.total = newTotal
    }
    
    func editEarning(_ newEarning: Double) {
        order.earnings = newEarning
    }
    
    func createNewDessert(_ dessert: Dessert) {
        deserts.append(dessert)
    }
    
    func editDessert(_ dessert: Dessert, newName: String, newImage: UIImage?, newGrade: Double, newNote: String) {
        if let index = deserts.firstIndex(where: { $0.id == dessert.id }) {
            deserts[index].name = newName
            deserts[index].image = newImage
            deserts[index].grade = newGrade
            deserts[index].notes = newNote
        }
    }
}
