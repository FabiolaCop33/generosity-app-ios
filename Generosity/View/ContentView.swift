//
//  ContentView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 25/06/24.
//

import SwiftUI
import MapKit


struct ContentView: View {
    var viewModel = CentrosBondadViewModel()
    
    var body: some View {
        
        TabView {
            
            NavigationStack() {
                Text("Vista del Perfil")
                    .navigationTitle("Perfil Generosity")
            }
            .tabItem {
                Text("Perfil")
                Image(systemName: "person.fill")
            }
            
            NavigationStack(){
                CentroBondadMapView()
                    .navigationTitle("Mapa Generosity")
            }
            .tabItem {
                Text("Mapa")
                Image(systemName: "map")
            }
            NavigationStack(){
                CategoryGridView(viewModel: viewModel)
                    .navigationTitle("Explorar en Generosity")
            }
            .tabItem {
                Text("Explorar")
                Image(systemName:"magnifyingglass")
            }
            
        }
        .tint(.pink)
        .onAppear(perform: {
            Task {
                            await viewModel.loadCentrosBondad()
                        }
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
