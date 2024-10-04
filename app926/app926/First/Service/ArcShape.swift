//
//  ArcShape.swift
//  app926
//
//  Created by Dias Atudinov on 04.10.2024.
//

import SwiftUI

struct ArcShape: Shape {
    var progress: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Центр и радиус для рисования дуги
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2
        
        // Стартовый и конечный угол для корректной ориентации дуги
        let startAngle = Angle(degrees: 180)
        let endAngle = Angle(degrees: 180 + 180 * progress) // Прогресс рисования дуги
        
        // Рисуем дугу
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        return path
    }
}

struct ProgressArc: View {
    var progress: Double // Процент выполнения (от 0 до 1)
    
    var body: some View {
        ZStack {
            // Фон для дуги (серый цвет)
            ArcShape(progress: 1.0)
                .stroke(Color.loaderBG, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .frame(height: 104)
            
            // Цветная дуга, которая показывает прогресс
            ArcShape(progress: progress) // Прогресс от 0 до 1
                .stroke(Color.secondaryRed, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                .frame(height: 104)
                .animation(.easeInOut)
        }
    }
}

extension UIApplication {
    // Метод для завершения редактирования (закрытия клавиатуры)
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
