//
//  UsOnboardingUIView.swift
//  app926
//
//  Created by Dias Atudinov on 03.10.2024.
//

import SwiftUI
import StoreKit
struct UsOnboardingUIView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    @State private var isLoadingView: Bool = true
    @State private var isNotificationView: Bool = true
    @State private var pageNum: Int = 1
    @AppStorage("onboardingShowed") var onboardingShowed: Bool = false
    
    var body: some View {
        if !onboardingShowed {
            if pageNum < 3 {
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
                                    Text("Start playing and earning")
                                        .font(.system(size: 28, weight: .bold))
                                        .multilineTextAlignment(.center)
                                    Text("A proven way to make easy money")
                                        .font(.system(size: 16))
                                        .multilineTextAlignment(.center)
                                }.frame(height: 85).padding(.horizontal, 30).foregroundColor(.white).padding(.top, 20).padding(.bottom, 10)
                                
                            case 2:
                                VStack(spacing: 12) {
                                    Text("Rate our app in the \nAppStore")
                                        .font(.system(size: 28, weight: .bold))
                                        .multilineTextAlignment(.center)
                                    Text("Help make the app even better")
                                        .font(.system(size: 16))
                                        .multilineTextAlignment(.center)
                                }.frame(height: 100).padding(.horizontal, 30).foregroundColor(.white).padding(.top, 20).padding(.bottom, 40)
                                    .onAppear{
                                        rateApp()
                                    }
                            default:
                                Text("Don’t miss anything")
                                    .font(.title)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.black)
                                    .padding(.bottom, 10)
                                Text("Don’t miss the most userful information")
                                    .foregroundColor(.white).opacity(0.7)
                                
                            }
                            //Spacer()
                            
                            
                            
                            
                        }
                        
                        
                        switch pageNum {
                        case 1:
                            VStack {
                                Image("firstScreen926")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: UIScreen.main.bounds.width)
                                    .padding(.bottom, -30)
                                
                            }
                        case 2: Image("ratings926")
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width)
                            
                        default:
                            Image("notifications926")
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width)
                        }
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(.mainRed)
                                .cornerRadius(30)
                            
                            Button {
                                if pageNum < 3 {
                                    pageNum += 1
                                } else {
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
                            
                            
                        }.edgesIgnoringSafeArea(.bottom)
                    }
                    
                    
                }
            } else {
                if isNotificationView {
                    ZStack {
                        Color.loaderBG
                        //                LinearGradient(gradient: Gradient(colors: [.gradientTop, .gradientBottom]),
                        //                               startPoint: .top,
                        //                               endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack(spacing: 0) {
                            ZStack {
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
                                
                                HStack {
                                    Spacer()
                                    Button {
                                        isNotificationView = false
                                    } label : {
                                        ZStack {
                                            Circle()
                                                .frame(width: 30 ,height: 30)
                                                .foregroundColor(.black.opacity(0.2))
                                            Image(systemName: "xmark")
                                                .font(.system(size: 12, weight: .bold))
                                                .foregroundColor(.white)
                                        }
                                    }
                                }.padding(.horizontal)
                            }
                            
                            VStack {
                                VStack(spacing: 12) {
                                    Text("Don’t miss anything")
                                        .font(.system(size: 28, weight: .bold))
                                        .multilineTextAlignment(.center)
                                    Text("Don’t miss the most userful information")
                                        .font(.system(size: 17, weight: .semibold))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.white.opacity(0.5))
                                }.frame(height: 100).padding(.bottom, 50).padding(.horizontal, 30).foregroundColor(.white)
                                
                            }
                            
                            Image("notifications926")
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width - 20)
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.mainRed)
                                    .cornerRadius(30)
                               
                                    Button {
                                        isNotificationView = false
                                        onboardingShowed = true
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
                                
                            }.edgesIgnoringSafeArea(.bottom)
                        }
                        
                        
                    }
                    
                } else {
                    //WebUIView()
                }
            }
        } else {
            // WebUIView()
        }
    }
    
    func startTimer() {
        timer?.invalidate()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
                isLoadingView.toggle()
            }
        }
    }
    
    func rateApp() {
        SKStoreReviewController.requestReview()
    }
}

#Preview {
    UsOnboardingUIView()
}
