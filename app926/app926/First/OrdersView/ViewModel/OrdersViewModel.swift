//
//  OrdersViewModel.swift
//  app926
//
//  Created by Dias Atudinov on 07.10.2024.
//

import SwiftUI

class OrdersViewModel: ObservableObject {
    
    @Published var orders: [Order] = []
    
    
    func createNewOrder(_ order: Order) {
        orders.append(order)
    }
    
    func deleteOrder(_ order: Order) {
        if let index = orders.firstIndex(where: { $0.id == order.id }) {
            orders.remove(at: index)
        }
    }
    
    func editDessert(_ order: Order, newName: String, newImage: UIImage?, clientName: String, phone: String, quantity: String, adress: String, price: String,  newDate: Date, newNote: String) {
        if let index = orders.firstIndex(where: { $0.id == order.id }) {
            orders[index].name = newName
            orders[index].image = newImage
            orders[index].clientName = clientName
            orders[index].phoneNumber = phone
            orders[index].productQuantity = quantity
            orders[index].adress = adress
            orders[index].price = price
            orders[index].date = newDate
            orders[index].notes = newNote
        }
    }
}
