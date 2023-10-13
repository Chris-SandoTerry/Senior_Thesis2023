//
//  SignUpView.swift
//  Senior_Thesis

import Foundation
import SwiftUI

struct SignUpView: View {
    @State private var newUserName = ""
    @State private var newPassword = ""
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.brown.ignoresSafeArea()
                
                Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
                
                Circle().scale(1.35).foregroundColor(.white.opacity(0.15))
                
                VStack {
                    
                    Spacer()
                        .frame(height: 80)
                    
                    Text("Sign Up")
                        .font(.largeTitle)
                        .foregroundColor(.black.opacity(0.65))
                        .bold()
                    
                    Spacer()
                        .frame(height: 60)
                    
                    TextField("New Username", text: $newUserName)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(1.0))
                        .cornerRadius(10)
                        .padding()
                    
                    SecureField("New Password", text: $newPassword)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(1.0))
                        .cornerRadius(10)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Button(action: {
                    showingLoginScreen = true
                    }) {
                        Text("Create Account")
                        .padding()
                        .foregroundColor(.black)
                        .font(.title2)
                        .frame(width: 200, height: 50)
                        .background(Color.brown.opacity(0.8))
                        .cornerRadius(10)
                        .padding()
                        }
                    
                    Button("Log In") {
                        showingLoginScreen = true
                    }
        
                    .foregroundColor(.blue)
                    .frame(width: 200,height: 20)
                    .cornerRadius(10)
                    
                    Spacer()
                        .frame(height: 100)
                }
            }
            .navigationBarHidden(true)
            .background(
                NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), isActive: $showingLoginScreen) {
                    EmptyView()
                }
            )
        }
    }
}

       

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

