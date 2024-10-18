//
//  HomeUIView.swift
//  app926
//
//  Created by Dias Atudinov on 03.10.2024.
//

import SwiftUI

struct HomeUIView: View {
    @ObservedObject var viewModel: HomeViewModel
    @ObservedObject var orderVM: OrdersViewModel
    @State var editOrder = false
    @State var editErnings = false
    @State var newDessert = false
    @State var editDessert = false
    
    @State var selectedDessert: Dessert? = nil
    @State private var earningText = "0"
    var body: some View {
        ZStack {
            Color.loaderBG.ignoresSafeArea()
            VStack {
                
                HStack {
                    Text("Statistic")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.top, 20)
                
                HStack {
                    Text("You have today")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                    Spacer()
                }.padding(.top, 20)
                ScrollView(showsIndicators: false) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white.opacity(0.12))
                            .cornerRadius(20)
                            .frame(height: 197)
                        VStack {
                            ZStack {
                                
                                ProgressArc(progress: viewModel.progress)
                                    .padding(.horizontal, 74)
                                    .padding(.bottom, -44)
                                VStack {
                                    Text("\(viewModel.order.fulfilled)")
                                        .font(.system(size: 34, weight: .bold))
                                        .foregroundColor(.secondaryRed)
                                    Text("out of \(viewModel.order.total)")
                                        .font(.system(size: 13, weight: .regular))
                                        .foregroundColor(.white)
                                }.padding(.top, -30)
                                
                                
                            }
                            HStack {
                                Text("Orders fulfilled")
                                    .foregroundColor(.secondaryRed)
                                Spacer()
                                Text("Total orders")
                                    .foregroundColor(.white)
                            }.padding(.horizontal, 34)
                        }.padding(.top, 40)
                        
                        VStack {
                            HStack {
                                Spacer()
                                Button {
                                    editOrder = true
                                } label: {
                                    ZStack {
                                        Circle()
                                            .frame(height: 35)
                                            .foregroundColor(.white.opacity(0.12))
                                        Image(systemName: "pencil")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            
                            Spacer()
                        }.padding().padding(.trailing, 5)
                    }.frame(height: 197)
                    
                    HStack {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white.opacity(0.12))
                                .cornerRadius(20)
                                .frame(height: 166)
                            
                            VStack(spacing: 10) {
                                Text("Orders left")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                Text("\(viewModel.order.total - viewModel.order.fulfilled)")
                                    .font(.system(size: 34, weight: .bold))
                                    .foregroundColor(.secondaryRed)
                                    .padding(.bottom, 10)
                                Button {
                                    editOrder = true
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(height: 30)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.mainRed, lineWidth: 1)
                                            )
                                        Text("Edit")
                                            .font(.system(size: 15, weight: .semibold))
                                            .foregroundColor(.mainRed)
                                    }
                                    
                                }
                                
                                
                            }.padding(20)
                        }
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white.opacity(0.12))
                                .cornerRadius(20)
                                .frame(height: 166)
                            
                            VStack(spacing: 10) {
                                Text("Earnings")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                                
                                Text("$\(String(format: "%.1f", viewModel.order.earnings))")
                                    .font(.system(size: 34, weight: .bold))
                                    .foregroundColor(.secondaryRed)
                                    .padding(.bottom, 10)
                                Button {
                                    editErnings = true
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .frame(height: 30)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 8)
                                                    .stroke(Color.mainRed, lineWidth: 1)
                                            )
                                        Text("Edit")
                                            .font(.system(size: 15, weight: .semibold))
                                            .foregroundColor(.mainRed)
                                    }
                                    
                                }
                                
                                
                            }.padding(20)
                        }
                    }.frame(height: 166)
                    
                    HStack {
                        Text("Most popular desserts")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                        Button {
                            newDessert = true
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .regular))
                                .foregroundColor(.mainRed)
                        }
                    }.padding(.vertical, 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.deserts, id: \.self) { dessert in
                                HomeCell(dessert: dessert, onEdit: {
                                    selectedDessert = dessert
                                    editDessert = true
                                })
                            }
                        }
                    }
                    
                    HStack {
                        Text("Settings")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Button {
                                viewModel.openUsagePolicy()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white.opacity(0.12))
                                        .frame(width: 146 * 1.2, height: 146)
                                        .cornerRadius(12)
                                    
                                    VStack(spacing: 10) {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.white.opacity(0.12))
                                                .frame(height: 84)
                                                .cornerRadius(16)
                                            
                                            Image(systemName: "doc.text.magnifyingglass")
                                                .font(.system(size: 45, weight: .regular))
                                                .foregroundColor(.secondaryRed)
                                            
                                        }
                                        
                                        Text("Usage Policy")
                                            .font(.system(size: 17, weight: .semibold))
                                            .foregroundColor(.white)
                                        Spacer()
                                    }.padding(10)
                                }.frame(height: 146)
                            }
                            
                            Button {
                                viewModel.rateApp()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white.opacity(0.12))
                                        .frame(width: 146 * 1.2, height: 146)
                                        .cornerRadius(12)
                                    
                                    VStack(spacing: 10) {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.white.opacity(0.12))
                                                .frame(height: 84)
                                                .cornerRadius(16)
                                            
                                            Image(systemName: "star.square")
                                                .font(.system(size: 45, weight: .regular))
                                                .foregroundColor(.secondaryRed)
                                            
                                        }
                                        
                                        Text("Rate our app")
                                            .font(.system(size: 17, weight: .semibold))
                                            .foregroundColor(.white)
                                        Spacer()
                                    }.padding(10)
                                }.frame(height: 146)
                            }
                            
                            Button {
                                viewModel.shareApp()
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white.opacity(0.12))
                                        .frame(width: 146 * 1.2, height: 146)
                                        .cornerRadius(12)
                                    
                                    VStack(spacing: 10) {
                                        ZStack {
                                            Rectangle()
                                                .foregroundColor(.white.opacity(0.12))
                                                .frame(height: 84)
                                                .cornerRadius(16)
                                            
                                            Image(systemName: "square.and.arrow.up")
                                                .font(.system(size: 45, weight: .regular))
                                                .foregroundColor(.secondaryRed)
                                            
                                        }
                                        
                                        Text("Share our app")
                                            .font(.system(size: 17, weight: .semibold))
                                            .foregroundColor(.white)
                                        Spacer()
                                    }.padding(10)
                                }.frame(height: 146)
                            }
                            
                        }.padding(.bottom, 50)
                    }
                    
                }
                
            }.padding(.horizontal).padding(.bottom, 55)
            
            VStack {
                Spacer()
                NavigationLink {
                    OrdersUIView(viewModel: orderVM)
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(height: 88)
                            .foregroundColor(.mainRed)
                            .cornerRadius(30)
                        HStack(spacing: 10) {
                            Text("Go to orders")
                            Image(systemName: "arrow.right")
                        }.foregroundColor(.white).font(.system(size: 20, weight: .regular))
                    }
                }
            }.ignoresSafeArea(edges: .bottom)
            
            if editOrder {
                ZStack {
                    Rectangle().opacity(0.6).ignoresSafeArea()
                        .onTapGesture {
                            editOrder = false
                        }
                    
                    EditOrder(editOrderShow: $editOrder, viewModel: viewModel, order: viewModel.order)
                    
                }
            }
            
            if newDessert {
                ZStack {
                    Rectangle().opacity(0.6).ignoresSafeArea()
                        .onTapGesture {
                            newDessert = false
                        }
                    
                    NewDessert(createDesertShow: $newDessert, viewModel: viewModel)
                    
                }
            }
            
            if editDessert {
                if let dessert = selectedDessert {
                    EditDessert(createDesertShow: $editDessert, viewModel: viewModel, dessert: dessert)
                }
            }
            
            if editErnings {
                Rectangle()
                    .foregroundColor(.black.opacity(0.4))
                    .ignoresSafeArea()
                    .onTapGesture {
                        editErnings = false
                    }
                
                VStack(spacing: 20) {
                    VStack(spacing: 0) {
                        Text("Earnings")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .semibold))
                            .padding(.top, 20)
                        
                        Text("Add new data to your progress")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .regular))
                    }
                    
                    TextField("", text: $earningText)
                        .keyboardType(.decimalPad)
                        .foregroundColor(.white)
                        .padding(6)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.65), lineWidth: 1)
                                
                        )
                        .background(Color.gray.opacity(0.12)
                            .cornerRadius(5)
                        )
                        .padding(.horizontal)
                    
                    HStack(spacing: 1) {
                        Button("Cancel") {
                            editErnings = false
                        }
                        .font(.system(size: 17))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black.opacity(0.82))
                        .background(Color.alertBG)
                        .foregroundColor(.secondaryRed)
                        .padding(.top, 1)
                        
                        Button("Add") {
                            if let earning = Double(earningText) {
                                // Handle the submit action
                                print("User input: \(earningText)")
                                viewModel.editEarning(earning)
                                editErnings = false
                            }
                        }
                        .font(.system(size: 17, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black.opacity(0.82))
                        .background(Color.alertBG)
                        .foregroundColor(.secondaryRed)
                        .padding(.top, 1)
                    }.background(Color.gray.opacity(0.12))
                }
                .frame(width: 300)
                .background(Color.black.opacity(0.82))
                .background(Color.alertBG)
                
                .cornerRadius(20)
                .shadow(radius: 20)
                .onAppear {
                    earningText = "\(viewModel.order.earnings)"
                }
                
            }
        }
    }
}

#Preview {
    HomeUIView(viewModel: HomeViewModel(), orderVM: OrdersViewModel())
}




struct EditOrder: View {
    @Binding var editOrderShow: Bool
    @ObservedObject var viewModel: HomeViewModel
    @State var order: StatOrder
    
    @State var fulfill = ""
    @State var total = ""
    
    @State var datePickerShow = false
    @State private var isKeyboardVisible = false
    var body: some View {
        
        VStack {
            
            Spacer()
            ZStack {
                Rectangle()
                    .foregroundColor(.showCardMainBG)
                    .ignoresSafeArea(edges: .bottom)
                    .frame(height: UIScreen.main.bounds.width * 0.9)
                    .cornerRadius(13)
                
                VStack(spacing: 0) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.showCardSecondBG)
                            .frame(height: 50)
                            .clipShape(RoundedCorner(radius: 13, corners: [.topLeft, .topRight]))
                        
                        HStack {
                            Button {
                                editOrderShow = false
                            } label: {
                                Text("Cancel")
                                    .foregroundColor(.secondaryRed)
                            }
                            Spacer()
                            Text("Edit order statistics")
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
                    
                    VStack(spacing: 5) {
                        HStack {
                            Text("Orders fulfilled")
                                .font(.system(size: 11))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        TextField("", text: $fulfill)
                            .keyboardType(.numberPad)
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
                            Text("Total orders")
                                .font(.system(size: 11))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        TextField("", text: $total)
                            .keyboardType(.numberPad)
                            .foregroundColor(.white)
                            .padding(14)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.mainRed, lineWidth: 1)
                                
                            )
                            .background(Color.white.opacity(0.12)
                                .cornerRadius(10)
                            )
                        
                    }.padding(.horizontal)
                        .onAppear {
                            fulfill = "\(viewModel.order.fulfilled)"
                            total = "\(viewModel.order.total)"
                            
                        }
                    
                    Spacer()
                    
                    Button {
                        if let fulfill = Int(fulfill), let total = Int(total) {
                            viewModel.editOrder(fulfill, total)
                            editOrderShow = false
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
            }.frame(height: UIScreen.main.bounds.width * 0.9)
                .padding(.bottom, isKeyboardVisible ? 0 : -35)
            
            
        
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
    }
}


struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
