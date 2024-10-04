//
//  HomeViewModel.swift
//  app926
//
//  Created by Dias Atudinov on 04.10.2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var order: Order = Order(fulfilled: 0, total: 0, earnings: 0) {
        didSet {
            progressCount()
        }
    }
    @Published var progress = 0.0
    
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
    
}
