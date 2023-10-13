//
//  LoginView.swift
//  Software Project New Part
//

import SwiftUI

struct LoginView: View {
    @State private var userName = ""
    @State private var passWord = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginscreen = false
    @State private var showingsignupscreen = false
    @State private var showAlert = false
    @State private var loggedIn = false // new state variable for tracking login status
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.brown
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white.opacity(0.15))
                
                VStack {
                    
                    Spacer()
                        .frame(height: 80)
                    
                    Text("Login")
                        .font(.largeTitle)
                        .foregroundColor(.black.opacity(0.65))
                        .bold()
                    
                    Spacer()
                        .frame(height: 60)
                        
                    
                    TextField("Username", text: $userName)
                        .padding()
                        .frame(width: 300,height: 50)
                        .background(Color.white.opacity(1.0))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongUsername))
                        .padding()
                    
                    SecureField("Password", text: $passWord)
                        .padding()
                        .frame(width: 300,height: 50)
                        .background(Color.white.opacity(1.0))
                        .cornerRadius(10)
                        .border(.red,width: CGFloat(wrongPassword))
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Button(action: {
                        if userName == "" {
                        wrongUsername = 2
                        }
                        else {
                        wrongUsername = 0
                        }
                        if passWord == "" {
                        wrongPassword = 2
                        }
                        else {
                            wrongPassword = 0
                        }
                        if userName == "Admin" && passWord == "123"
                        {
                        loggedIn = true // set login status to true
                        showingLoginscreen = true
                                            }
                        else {
                        // show an alert if the credentials are invalid
                        showAlert = true
                            }
                            }) {
                            Text("Login")
                            .padding()
                            .foregroundColor(.black)
                            .font(.title2)
                            .frame(width: 200, height: 50)
                            .background(Color.brown.opacity(0.8))
                            .cornerRadius(10)
                            .padding()
                            }
                    
                    Button("Sign Up") {
                        showingsignupscreen = true
                    }
        
                    .foregroundColor(.blue)
                    .frame(width: 200,height: 20)
                    .cornerRadius(10)
                    
                    Spacer()
                        .frame(height: 100)
                    
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Invalid Credentials"), message: Text("Please check your username and password and try again."), dismissButton: .default(Text("OK")))
                }
            }
             .navigationBarHidden(true)
             .background( NavigationLink(destination: SignUpView().navigationBarBackButtonHidden(true),
                               isActive: $showingsignupscreen)
                {
                    EmptyView()
                }
            )
            .background(  NavigationLink(destination: ProfileView().navigationBarHidden(true),
                               isActive: $showingLoginscreen)
                {
                    EmptyView()
                }
            )


        }
    }
}
        struct LoginView_Previews: PreviewProvider {
            static var previews: some View {
                LoginView()
            }
        }
