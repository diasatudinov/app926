//
//  OrdersViewModel.swift
//  app926
//
//  Created by Dias Atudinov on 07.10.2024.
//

import SwiftUI

class OrdersViewModel: ObservableObject {
    
    @Published var orders: [Order] = [] {
        didSet {
            saveOrders()
        }
    }
    
    private let ordersFileName = "orders.json"
    
    init() {
        loadOrders()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func ordersFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(ordersFileName)
    }
    
    private func saveOrders() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.orders)
                try data.write(to: self.ordersFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    private func loadOrders() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: ordersFilePath())
            orders = try decoder.decode([Order].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
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
