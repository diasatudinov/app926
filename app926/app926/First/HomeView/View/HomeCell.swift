//
//  HomeCell.swift
//  app926
//
//  Created by Dias Atudinov on 04.10.2024.
//

import SwiftUI

struct HomeCell: View {
    @State var dessert: Dessert
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 294)
                .foregroundColor(.black.opacity(0.12))
                .cornerRadius(16)
            
            VStack(alignment: .leading, spacing: 10) {
                ZStack {
                    if let image = dessert.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 170)
                            .cornerRadius(14)
                            .allowsHitTesting(false)
                    } else {
                        Rectangle()
                            .frame(height: 170)
                            .foregroundColor(.gray.opacity(0.2))
                            .cornerRadius(14)
                    }
                    VStack {
                        
                        HStack {
                            Spacer()
                            Button {
                                
                            } label: {
                                
                                ZStack {
                                    Circle()
                                        .frame(height: 29)
                                        .foregroundColor(.black)
                                    Image(systemName: "pencil")
                                        .foregroundColor(.white)
                                }
                                    
                            }
                            
                        }.padding(10)
                        Spacer()
                    }
                }.frame(height: 170)
                HStack {
                    Text(dessert.name)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                    Spacer()
                }
                HStack(alignment: .top) {
                    Text(dessert.notes)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.white.opacity(0.5))
                        
                }.frame(height: 32)
                
                HStack {
                    Image(systemName: "star.fill")
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(.secondaryRed)
                    Text("\(String(format: "%.1f",dessert.grade))")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.white)
                }
            }.padding(.horizontal, 10).padding(.vertical, 10)
        } .frame(width: 294 * 0.8, height: 294)
    }
}

#Preview {
    HomeCell(dessert: Dessert(name: "Lambeth-style cake", grade: 4.9, notes: "Cake with cherry and coconut filling and chocolate sponge cake"))
}
