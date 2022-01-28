//
//  ContentView.swift
//  DemoNavigation
//
//  Created by PRADYOT DHULIPALA on 1/27/22.
//

import SwiftUI

struct MainView: View {
    
    private enum Tab: Hashable {
        case home
        case photo
    }
    
    @State private var selectedTab: Tab = .home
    
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                RootView()
                    .tag(0)
                    .tabItem { Image(systemName: "house.fill") }
                PhotoLoadView()
                    .tag(1)
                    .tabItem { Image(systemName: "photo") }
                
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .padding(.horizontal, 5)    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
