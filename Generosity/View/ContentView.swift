//
//  ContentView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 25/06/24.
//

import SwiftUI
import MapKit


struct ContentView: View {
    
    var body: some View {
        
        TabView {
            
            NavigationStack() {
                Text("Vista del Perfil")
                    .navigationTitle("Profile")
            }
            .tabItem {
                Text("Perfil")
                Image(systemName: "person.fill")
            }
            
            CentroBondadMapView()
                .tabItem {
                    Text("Mapa")
                    Image(systemName: "map")
                }
            CentroBondadListView()
                .tabItem {
                    Text("Lista")
                    Image(systemName:"list.bullet")
                }
            
        }
        .tint(.pink)
        .onAppear(perform: {
            UITabBar.appearance().unselectedItemTintColor = .systemBrown
            UITabBarItem.appearance().badgeColor = .systemPink
            UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.4)
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.systemPink]
            
        })
    }

  }

#Preview {
    ContentView()
}
