//
//  ProfileView.swift
//  Senior_Thesis
//

import Foundation


import SwiftUI
import MapKit

struct ProfileView: View {
    @State private var selection = 0
    @Environment(\.presentationMode) var presentationMode
    @State private var showloginscreen = false
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                VStack(spacing: 20) {
                    Image("Unknown-2")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                    Text("CST")
                        .font(.title)
                        .bold()
                    
                    Text("Software Developer")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 30) {
                        VStack {
                            Text("0")
                                .font(.title)
                                .bold()
                            Text("Posts")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        VStack {
                            Text("3.7K")
                                .font(.title)
                                .bold()
                            Text("Followers")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        VStack {
                            Text("1.5K")
                                .font(.title)
                                .bold()
                            Text("Following")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("About Me")
                            .font(.headline)
                            .bold()
                        Text("I'm a software developer from Kenosha, Wisconsin. I enjoy coding.")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .padding(.vertical)
                    
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        showloginscreen = true
                    })
                    {
                        Text("Sign Out")
                            .font(.headline)
                            .foregroundColor(.red)
                        
                    
                    }
                    
                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), isActive: $showloginscreen)
                    {
                        EmptyView()
                    }
                    
                }
                .padding()
                .navigationTitle("Profile")
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
            .tag(0)

            CameraViewDemo()
                .tabItem {
                    Image(systemName: "camera.fill")
                    Text("Camera")
                }
                .tag(1)
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
