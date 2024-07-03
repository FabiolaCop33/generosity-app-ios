//
//  ContentView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 25/06/24.
//

import SwiftUI
import MapKit


struct ContentView: View {
    @State private var centrosBondad: [CentroBondad] = []
    @State private var selectedCentroBondad: CentroBondad? = nil
    @State private var showModal: Bool = false

    
       
    private func loadCentrosBondad() async {
        do {
           let response = try await ClienteCentroBondad.shared.fetchCentrosBondad(at: Constantes.Urls.centrosBondad)
            centrosBondad = response.results
            print("Successfully fetched centrosBondad: \(centrosBondad.count)")  // Print the number of fetched objects
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
      NavigationView {
          Map() {
              ForEach(centrosBondad){
                  centroBondad in Marker(centroBondad.name,systemImage: "figure.2", coordinate: centroBondad.coordinate)
                  .tint(.purple)
              }
          }
          .navigationTitle("Centros de Bondad")
          .task {
            await loadCentrosBondad()
          }
      }
    }
  }

#Preview {
    ContentView()
}
