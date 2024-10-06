//
//  NewOrder.swift
//  app926
//
//  Created by Dias Atudinov on 07.10.2024.
//

import SwiftUI

struct NewOrder: View {
    @ObservedObject var viewModel: OrdersViewModel
    
    @State var fulfill = ""
    @State var total = ""
    
    @State var name = ""
    @State var clientName = ""
    @State var phoneNumber = ""
    @State var productQuantity = ""
    @State var adress = ""
    @State var price = ""
    @State var date = Date()
    @State var time = Date()
    @State var notes = ""
    
    @State private var selectedImage: UIImage?
    
    @State var datePickerShow = false
    @State var timePickerShow = false
    @State private var isKeyboardVisible = false
    @State private var isShowingImagePicker = false
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        ZStack {
            Color.loaderBG.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ZStack {
                    
                    HStack {
                        Text("Orders")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                    }
                    
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            HStack(spacing: 4) {
                                Image(systemName: "chevron.left")
                                Text("Back")
                            }.foregroundColor(.mainRed)
                                .font(.system(size: 17, weight: .regular))
                            
                            
                        }
                        Spacer()
                        
                    }
                }.padding(.bottom, 20).padding(.horizontal)
                ScrollView {
                    VStack {
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width - 32,height: (UIScreen.main.bounds.width - 32) * 0.53)
                                .cornerRadius(16)
                                .allowsHitTesting(false)
                            
                        } else {
                            ZStack {
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width - 32,height: (UIScreen.main.bounds.width - 32) * 0.53)
                                    .foregroundColor(.white.opacity(0.12))
                                    .cornerRadius(16)
                                
                                Image(systemName: "photo")
                                    .font(.system(size: 85))
                                    .foregroundColor(.white.opacity(0.12))
                            }
                        }
                        
                        Text("Select a photo")
                            .foregroundColor(.secondaryRed)
                            .padding(.top, 10)
                            .onTapGesture {
                                isShowingImagePicker = true
                            }
                        
                        VStack(spacing: 5) {
                            HStack {
                                Text("Name dessert")
                                    .font(.system(size: 11))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            TextField("Lambeth-style cake", text: $name)
                                .foregroundColor(.white)
                                .padding(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.mainRed, lineWidth: 1)
                                    
                                )
                                .background(Color.white.opacity(0.12)
                                    .cornerRadius(10)
                                )
                                .padding(.bottom, 10)
                            
                            
                            HStack {
                                Text("Client")
                                    .font(.system(size: 11))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            TextField("Ralph Edwards", text: $clientName)
                                .foregroundColor(.white)
                                .padding(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.mainRed, lineWidth: 1)
                                    
                                )
                                .background(Color.white.opacity(0.12)
                                    .cornerRadius(10)
                                )
                                .padding(.bottom, 10)
                            
                            HStack {
                                Text("Phone")
                                    .font(.system(size: 11))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            TextField("(316) 555-0116", text: $phoneNumber)
                                .foregroundColor(.white)
                                .padding(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.mainRed, lineWidth: 1)
                                    
                                )
                                .background(Color.white.opacity(0.12)
                                    .cornerRadius(10)
                                )
                                .padding(.bottom, 10)
                            
                            HStack {
                                Text("Product quantity")
                                    .font(.system(size: 11))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            TextField("1 pc", text: $productQuantity)
                                .foregroundColor(.white)
                                .padding(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.mainRed, lineWidth: 1)
                                    
                                )
                                .background(Color.white.opacity(0.12)
                                    .cornerRadius(10)
                                )
                                .padding(.bottom, 10)
                            
                            HStack {
                                Text("Adress")
                                    .font(.system(size: 11))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            TextField("8502 Preston Rd. Inglewood, Maine 98380", text: $adress)
                                .foregroundColor(.white)
                                .padding(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.mainRed, lineWidth: 1)
                                    
                                )
                                .background(Color.white.opacity(0.12)
                                    .cornerRadius(10)
                                )
                                .padding(.bottom, 10)
                            
                            HStack {
                                Text("Price")
                                    .font(.system(size: 11))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            TextField("$250", text: $price)
                                .foregroundColor(.white)
                                .padding(14)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.mainRed, lineWidth: 1)
                                    
                                )
                                .background(Color.white.opacity(0.12)
                                    .cornerRadius(10)
                                )
                                .padding(.bottom, 20)
                            VStack {
                                HStack {
                                    Text("Date")
                                        .font(.system(size: 17))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(formattedDate(date: date))
                                        .foregroundColor(.secondaryRed)
                                        .padding(6).padding(.horizontal, 5)
                                        .background(Color.white.opacity(0.12))
                                        .cornerRadius(6)
                                        .onTapGesture {
                                            datePickerShow.toggle()
                                        }
                                }
                                
                                if datePickerShow {
                                    
                                    DatePicker(
                                        "Choose your date",
                                        selection: $date,
                                        displayedComponents: [.date]
                                    )
                                    .datePickerStyle(.wheel)
                                    .labelsHidden()
                                    .background(Color.clear)
                                    
                                }
                                
                            }
                            .padding(14)
                            .background(Color.white.opacity(0.12)
                                .cornerRadius(10)
                            )
                            
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 1).foregroundColor(.mainRed)
                            )
                            
                            .padding(.bottom, 20)
                            VStack {
                                HStack {
                                    Text("Time")
                                        .font(.system(size: 17))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(formattedTime(time: date))
                                        .foregroundColor(.secondaryRed)
                                        .padding(6).padding(.horizontal, 5)
                                        .background(Color.white.opacity(0.12))
                                        .cornerRadius(6)
                                        .onTapGesture {
                                            timePickerShow.toggle()
                                            print(date)
                                        }
                                }
                                
                                if timePickerShow {
                                    
                                    DatePicker(
                                        "Choose your date",
                                        selection: $date,
                                        displayedComponents: [.hourAndMinute]
                                    )
                                    .datePickerStyle(.wheel)
                                    .labelsHidden()
                                    .accentColor(.white)
                                    
                                }
                                
                            }
                            .padding(14)
                            .background(Color.white.opacity(0.12)
                                .cornerRadius(10)
                            )
                            
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1).foregroundColor(.mainRed)
                            )
                            
                            .padding(.bottom, 20)
                            
                            HStack {
                                Text("Notes")
                                    .font(.system(size: 11))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            
                            TextEditor(text: $notes)
                                .frame(minHeight: 30)
                                .padding(14)
                                .background(Color.white.opacity(0.12)
                                    .cornerRadius(10)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.mainRed, lineWidth: 1)
                                    
                                )
//                            TextEditor(text: $notes)
//                                .foregroundColor(.black)
//                                .padding(14)
//                                .background(Color.white.opacity(0.12)
//                                    .cornerRadius(10)
//                                )
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.mainRed, lineWidth: 1)
//                                    
//                                )
//                                .padding(.bottom, 20)
                                
                            
                        }.padding(.vertical, 20)
                    }.padding(.horizontal)
                }
                
                
                
                Button {
                    if !name.isEmpty && !clientName.isEmpty && !phoneNumber.isEmpty && !productQuantity.isEmpty && !adress.isEmpty && !price.isEmpty && !notes.isEmpty {
                        
                        if let image = selectedImage {
                            let order = Order(imageData: image.jpegData(compressionQuality: 1.0), name: name, clientName: clientName, phoneNumber: phoneNumber, productQuantity: productQuantity, adress: adress, price: price, date: date, time: date, notes: notes)
                            
                            viewModel.createNewOrder(order)
                        } else {
                            let order = Order(name: name, clientName: clientName, phoneNumber: phoneNumber, productQuantity: productQuantity, adress: adress, price: price, date: date, time: date, notes: notes)
                            
                            viewModel.createNewOrder(order)
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 88)
                            .foregroundColor(!name.isEmpty && !clientName.isEmpty && !phoneNumber.isEmpty && !productQuantity.isEmpty && !adress.isEmpty && !price.isEmpty && !notes.isEmpty ? .mainRed : .mainRed.opacity(0.5))
                            .cornerRadius(30)
                        HStack(spacing: 10) {
                            Text("Create")
                        }.foregroundColor(.white).font(.system(size: 20, weight: .regular))
                    }
                }
                
            }.ignoresSafeArea(edges: .bottom)
            
            
        }
        .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
        }
        
        .onAppear {
            // Подписываемся на уведомления о клавиатуре
            NotificationCenter.default.addObserver(
                forName: UIResponder.keyboardWillShowNotification,
                object: nil,
                queue: .main
            ) { _ in
                isKeyboardVisible = true
            }
            
            NotificationCenter.default.addObserver(
                forName: UIResponder.keyboardWillHideNotification,
                object: nil,
                queue: .main
            ) { _ in
                isKeyboardVisible = false
            }
        }
        .onDisappear {
            // Отписываемся от уведомлений, чтобы избежать утечек памяти
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        .navigationBarBackButtonHidden()
    }
    
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
        }
    }
    
    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: date)
    }
    
    private func formattedTime(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: time)
    }
}

#Preview {
    NewOrder(viewModel: OrdersViewModel())
}
