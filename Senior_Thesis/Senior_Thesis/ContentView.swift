//
//  ContentView.swift
//  Senior_Thesis
//
//  Created by Christopher Sandoval Terry on 10/13/23.
//

//
//  ContentView.swift
//  Software Project New Part
//
//  Created by Christopher Sandoval Terry on 4/18/23.
import SwiftUI

struct ContentView: View {
    @State private var pageIndex = 0
    @State private var showloginscreen = false
    private let pages:[Page] = Page.samplepages
    private let dotApperance = UIPageControl.appearance()

    var body: some View {
        NavigationView {
            ZStack {
                Color.brown
                    .ignoresSafeArea()
                    .opacity(1.0)
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white)
                    .opacity(0.15)
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                    .opacity(0.15)

                TabView(selection: $pageIndex) {
                    ForEach(pages) { page in
                        VStack {
                            Spacer()

                            PageView(page: page)

                            Spacer()
                                .frame(height: 70)

                            if page == pages.last {
                                NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true), isActive: $showloginscreen)
                                {
                                    EmptyView()
                                }

                                    Button("Sign up") {
                                        showloginscreen = true
                                    }
                                    .foregroundColor(Color("blue"))
                                    .font(.title3)

                            } else {
                                Button("Next", action: incrementPage)
                                    .foregroundColor(Color("blue"))
                                    .font(.title3)
                            }
                            Spacer()
                                .frame(height: 20)
                        }
                        .tag(page.Tag)
                    }
                }
                .animation(.easeInOut, value: pageIndex)
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                .onAppear()
                {
                    dotApperance.currentPageIndicatorTintColor = .white
                    dotApperance.pageIndicatorTintColor = .gray
                }
            }
            .ignoresSafeArea()
        }
    }

    func incrementPage() {
        pageIndex += 1
    }

    func gotoZero() {
        pageIndex = 0
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
