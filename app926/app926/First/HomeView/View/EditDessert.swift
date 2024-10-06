//
//  EditDessert.swift
//  app926
//
//  Created by Dias Atudinov on 06.10.2024.
//

import SwiftUI

struct EditDessert: View {
    @Binding var createDesertShow: Bool
    @ObservedObject var viewModel: HomeViewModel
    @State var dessert: Dessert
    
    @State var fulfill = ""
    @State var total = ""
    
    @State var name = ""
    @State var grade = ""
    @State var notes = ""
    @State private var selectedImage: UIImage?
    
    @State var datePickerShow = false
    @State private var isKeyboardVisible = false
    @State private var isShowingImagePicker = false
    var body: some View {
        
        VStack {
            
            Spacer()
            ZStack {
                Rectangle()
                    .foregroundColor(.showCardMainBG)
                    .ignoresSafeArea(edges: .bottom)
                    .frame(height: UIScreen.main.bounds.height * 8/10)
                    .cornerRadius(13)
                
                VStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.showCardSecondBG)
                            .frame(height: 50)
                            .clipShape(RoundedCorner(radius: 13, corners: [.topLeft, .topRight]))
                        
                        HStack {
                            Button {
                                createDesertShow = false
                            } label: {
                                Text("Cancel")
                                    .foregroundColor(.secondaryRed)
                            }
                            Spacer()
                            Text("Edit a dessert")
                                .font(.system(size: 17, weight: .semibold))
                                .foregroundColor(.white)
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("Cancel")
                                    .foregroundColor(.clear)
                            }
                        }.padding(.horizontal)
                    }.frame(height: 50)
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(.gray.opacity(0.3))
                        .padding(.bottom, 25)
                    
                    
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 190)
                            .cornerRadius(16)
                            .padding(.horizontal)
                            .allowsHitTesting(false)
                            
                    } else {
                        ZStack {
                            Rectangle()
                                .frame(height: 190)
                                .foregroundColor(.white.opacity(0.12))
                                .cornerRadius(16)
                            
                            Image(systemName: "photo")
                                .font(.system(size: 85))
                                .foregroundColor(.white.opacity(0.12))
                        }
                            .padding(.horizontal)
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
                            Text("Grade")
                                .font(.system(size: 11))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        TextField("", text: $grade)
                            .keyboardType(.decimalPad)
                            .foregroundColor(.white)
                            .padding(14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.mainRed, lineWidth: 1)
                                
                            )
                            .background(Color.white.opacity(0.12)
                                .cornerRadius(10)
                            )
                        
                        
                        HStack {
                            Text("Notes")
                                .font(.system(size: 11))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        TextEditor(text: $notes)
                            .foregroundColor(.black)
                            
                            .padding(14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.mainRed, lineWidth: 1)
                                
                            )
                            .background(Color.white.opacity(0.12)
                                .cornerRadius(10)
                            )
                            .onAppear {
                                // Убираем дефолтный цвет фона текстового редактора в iOS 14
                                UITextView.appearance().backgroundColor = .clear
                            }
                        
                    }.padding(.horizontal).padding(.top, 20)
                        .onAppear {
                            fulfill = "\(viewModel.order.fulfilled)"
                            total = "\(viewModel.order.total)"
                            
                        }
                    
                    Spacer()
                    
                    Button {
                        if !name.isEmpty, let grade = Double(grade) {
                            viewModel.editDessert(dessert, newName: name, newImage: selectedImage, newGrade: grade, newNote: notes)
                           createDesertShow = false
                        }
                    } label: {
                        ZStack {
                            Rectangle()
                                .frame(height: 88)
                                .foregroundColor(.mainRed)
                                .cornerRadius(30)
                            HStack(spacing: 10) {
                                Text("Edit")
                            }.foregroundColor(.white).font(.system(size: 20, weight: .regular))
                        }
                    }
                    
                }
            }.frame(height: UIScreen.main.bounds.height * 8/10)
                .padding(.bottom, isKeyboardVisible ? 0 : -35)
            
            
            
        }
        .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
            ImagePicker(selectedImage: $selectedImage, isPresented: $isShowingImagePicker)
        }
        
        .onAppear {
            name = dessert.name
            grade = "\(dessert.grade)"
            selectedImage = dessert.image
            notes = dessert.notes
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
    }
    
    func loadImage() {
        if let selectedImage = selectedImage {
            print("Selected image size: \(selectedImage.size)")
        }
    }
}


#Preview {
    EditDessert(createDesertShow: .constant(true), viewModel: HomeViewModel(), dessert: Dessert(name: "Lambeth-style cake", grade: 4.9, notes: "Cake with cherry and coconut filling and chocolate sponge cake"))
}
