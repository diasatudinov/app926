//
//  OrdersUIView.swift
//  app926
//
//  Created by Dias Atudinov on 07.10.2024.
//

import SwiftUI

enum Tab {
    case active, archive
}

struct OrdersUIView: View {
    @ObservedObject var viewModel: OrdersViewModel
    @State private var selectedTab: Tab = .active
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
                        NavigationLink {
                            NewOrder(viewModel: viewModel)
                        } label: {
                                Image(systemName: "plus")
                            .foregroundColor(.mainRed)
                                .font(.system(size: 17, weight: .regular))
                            
                            
                        }
                    }
                }.padding(.bottom, 20)
                
                Picker("Select a tab", selection: $selectedTab) {
                    Text("Active").tag(Tab.active)
                    Text("Acrchive").tag(Tab.archive)
                }.frame(height: 28).pickerStyle(SegmentedPickerStyle()).cornerRadius(7)
                    .onAppear {
                        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
                        let titleTextAttributesSelected = [NSAttributedString.Key.foregroundColor: UIColor.white]
                        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
                        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributesSelected, for: .selected)
                        UISegmentedControl.appearance().backgroundColor = UIColor(Color.pickerOffGray.opacity(0.24))
                        UISegmentedControl.appearance().selectedSegmentTintColor = .pickerGray
                    }
                
                if selectedTab == .active {
                    
                    ScrollView(showsIndicators: false) {
                        ForEach(viewModel.orders.filter({ $0.isArchive == false }), id: \.self) { order in
                            OrderCell(viewModel: viewModel, order: order)
                        }.padding(.top, 20)
                        
                        
                    }
                    
                } else {
                    ScrollView(showsIndicators: false) {
                        ForEach(viewModel.orders.filter({ $0.isArchive == true }), id: \.self) { order in
                            OrderCell(viewModel: viewModel, order: order)
                        }.padding(.top, 20)
                        
                        
                    }
                }
                
                
                
                Spacer()
            }.padding(.horizontal)
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    OrdersUIView(viewModel: OrdersViewModel())
}
