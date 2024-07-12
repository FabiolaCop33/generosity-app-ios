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
                CategoryGridView(categories: ["Centro Asistencia Social a Niñas, Niños y Adolescentes": [], "Centro Asistencia Social a Adultos Mayores": [], "Centro de Asistencia Social a Personas con Discapacidad": [], "Centro de Asistencia Social a Personas con Adicciones": []])
                    .navigationTitle("Explorar en Generosity")
            }
            .tabItem {
                Text("Explorar")
                Image(systemName:"magnifyingglass")
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
