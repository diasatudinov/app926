//
//  OrderCell.swift
//  app926
//
//  Created by Dias Atudinov on 07.10.2024.
//

import SwiftUI

struct OrderCell: View {
    @ObservedObject var viewModel: OrdersViewModel
    @State var order: Order
    
    @State var editView = false
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Image(systemName: "paperplane")
                    Text(order.adress)
                    Spacer()
                }.font(.system(size: 12)).foregroundColor(.secondaryRed).padding(.bottom, 15)
                
                HStack(alignment: .top) {
                    
                    if let image = order.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width / 3.12 ,height: UIScreen.main.bounds.width / 3.12)
                            .cornerRadius(14)
                        
                    } else {
                        Rectangle()
                            .foregroundColor(.white.opacity(0.12))
                            .frame(width: UIScreen.main.bounds.width / 3.12 ,height: UIScreen.main.bounds.width / 3.12)
                            .cornerRadius(14)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(order.name)
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.white)
                        Text(order.notes)
                            .font(.system(size: 12, weight: .regular))
                            .foregroundColor(.white.opacity(0.5))
                        Spacer()
                    }.frame(height: UIScreen.main.bounds.width / 3.12)
                }.padding(.bottom, 15)
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Client:")
                            .font(.system(size: 15))
                            .foregroundColor(.white.opacity(0.5))
                        Spacer()
                        Text(order.clientName)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Text("Phone:")
                            .font(.system(size: 15))
                            .foregroundColor(.white.opacity(0.5))
                        Spacer()
                        Text(order.phoneNumber)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Text("Product quantity:")
                            .font(.system(size: 15))
                            .foregroundColor(.white.opacity(0.5))
                        Spacer()
                        Text(order.productQuantity)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                    
                    HStack {
                        Text("Date & Time:")
                            .font(.system(size: 15))
                            .foregroundColor(.white.opacity(0.5))
                        Spacer()
                        HStack {
                            Text(formattedDate(date: order.date))
                            Text(formattedTime(time: order.time))
                        }.font(.system(size: 15))
                            .foregroundColor(.white)
                    }
                }.padding(.bottom, 15)
                
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(.black.opacity(0.05))
                    .padding(.bottom, 15)
                
                HStack(spacing: 10) {
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.mainRed)
                            .cornerRadius(8)
                            .frame(height: 30)
                        Text(order.price)
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                    }
                    
                    NavigationLink(destination: EditOrderView(viewModel: viewModel, order: order), isActive: $editView) {
                        EmptyView()
                    }
                    
                    Button {
                        editView = true
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(height: 30)
                                .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(lineWidth: 1.0)
                                    
                                )
                            Text("Edit")
                                .font(.system(size: 15, weight: .semibold))
                        }.foregroundColor(.mainRed)
                    }
                }.padding(.bottom, 5)
                
            }.padding()
        }.frame(maxWidth: .infinity).background(Color.white.opacity(0.12)).cornerRadius(16)
        
    }
    
    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM. yyyy,"
        return formatter.string(from: date)
    }
    
    private func formattedTime(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        return formatter.string(from: time)
    }
}

#Preview {
    OrderCell(viewModel: OrdersViewModel(), order: Order(name: "Lambeth-style cake", clientName: "Ralph Edwards", phoneNumber: "(316) 555-0116", productQuantity: "1 pc", adress: "8502 Preston Rd. Inglewood, Maine 98380", price: "$250", date: Date(), time: Date(), notes: "White cream cake. Design in the form of a frame of red ribbons and an inscription in the middle. Inscription: 23 years"))
}

