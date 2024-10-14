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
            saveOrder()
        }
    }
    @Published var progress = 0.0 {
        didSet {
            saveProgress()
        }
    }
    
    @Published var deserts: [Dessert] = []  {
        didSet {
            saveDesert()
        }
    }
    
    private let desertsFileName = "deserts.json"
    private let orderFileName = "order.json"
    private let progressFileName = "progress.json"
    init() {
        loadDesert()
        loadOrder()
        loadProgress()
    }
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private func desertsFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(desertsFileName)
    }
    
    private func orderFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(orderFileName)
    }
    
    private func progressFilePath() -> URL {
        return getDocumentsDirectory().appendingPathComponent(progressFileName)
    }
    
    private func saveDesert() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.deserts)
                try data.write(to: self.desertsFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    private func saveOrder() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.order)
                try data.write(to: self.orderFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    private func saveProgress() {
        DispatchQueue.global().async {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(self.progress)
                try data.write(to: self.progressFilePath())
            } catch {
                print("Failed to save players: \(error.localizedDescription)")
            }
        }
    }
    
    
    private func loadDesert() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: desertsFilePath())
            deserts = try decoder.decode([Dessert].self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    private func loadOrder() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: orderFilePath())
            order = try decoder.decode(StatOrder.self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
    
    private func loadProgress() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: progressFilePath())
            progress = try decoder.decode(Double.self, from: data)
        } catch {
            print("Failed to load players: \(error.localizedDescription)")
        }
    }
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
