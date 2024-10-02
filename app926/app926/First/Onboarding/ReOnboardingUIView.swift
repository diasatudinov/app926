//
//  ReOnboardingUIView.swift
//  app926
//
//  Created by Dias Atudinov on 02.10.2024.
//

import SwiftUI

struct ReOnboardingUIView: View {
    @State private var pageNum: Int = 1
    @State private var showSheet = false
    @AppStorage("signedUP") var signedUP: Bool = false
    
    var body: some View {
        if !signedUP {
            ZStack {
                Color.loaderBG
//                LinearGradient(gradient: Gradient(colors: [.gradientTop, .gradientBottom]),
//                               startPoint: .top,
//                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    
                    HStack(spacing: 8) {
                        Circle()
                            .fill(pageNum == 1 ? Color.white : Color.white.opacity(0.5))
                            .frame(width: 8, height: 8)
                            .cornerRadius(19)
                        
                        Circle()
                            .fill(pageNum == 2 ? Color.white : Color.white.opacity(0.5))
                            .frame(width: 8, height: 8)
                            .cornerRadius(19)
                        
                        Circle()
                            .fill(pageNum == 3 ? Color.white : Color.white.opacity(0.5))
                            .frame(width: 8, height: 8)
                            .cornerRadius(19)
                    }
                    .padding(8).padding(.horizontal, 4)
                    .background(Color.black.opacity(0.55))
                    .cornerRadius(50)
                    VStack {
                        switch pageNum {
                        case 1:
                            VStack(spacing: 12) {
                                Text("Monitoring of statistics!")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                Text("Easily track order counts, revenue, popular items and sales trends.")
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.center)
                            }.frame(height: 85).padding(.horizontal, 30).foregroundColor(.white).padding(.top, 20).padding(.bottom, 40)
                        case 2:
                            VStack(spacing: 12) {
                                Text("Order management")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .multilineTextAlignment(.center)
                                Text("Quickly add new orders, update information and track their status.")
                                    .font(.system(size: 15))
                                    .multilineTextAlignment(.center)
                            }.frame(height: 85).padding(.horizontal, 30).foregroundColor(.white).padding(.top, 20).padding(.bottom, 40)
                        case 3:
                            VStack(spacing: 12) {
                                Text("Run your business easily!")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .multilineTextAlignment(.center)
                                Text("The user-friendly interface will help you focus on creating sweet masterpieces.")
                                    .font(.system(size: 15))
                                    .multilineTextAlignment(.center)
                            }.frame(height: 85).padding(.horizontal, 30).foregroundColor(.white).padding(.top, 20).padding(.bottom, 40)
                        default:
                            Text("Save information about \nyour favorite routes")
                                .font(.title)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .frame(height: 70)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding(.bottom, 10)
                            
                        }
                        
                    }
                    switch pageNum {
                    case 1: Image("app926Screen1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width)
                        
                    case 2: Image("app926Screen2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width)
                    case 3: Image("app926Screen3")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width)
                    default:
                        Image("appScreen3")
                            .resizable()
                            .frame(height: 549)
                            .ignoresSafeArea()
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.mainRed)
                            .cornerRadius(30)
                        
                        Button {
                            if pageNum < 3 {
                                pageNum += 1
                            } else {
                                signedUP = true
                            }
                        } label: {
                            ZStack {
                                Rectangle()
                                    .frame(height: 60)
                                    .foregroundColor(.mainRed)
                                        .cornerRadius(35)
                                Text("Next")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20, weight: .semibold))
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        
                    }
                    
                    
                }.edgesIgnoringSafeArea(.bottom)
            }
            
        } else {
          //  TabUIView()
        }
    }
}


#Preview {
    ReOnboardingUIView()
}
