//
//  CentroBondadMapView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 03/07/24.
//

import SwiftUI
import MapKit

struct CentroBondadMapView: View {
    @State private var selectedCentroBondad: CentroBondadModel? = nil
    @State private var showModal: Bool = false
    @State private var navigateToList: Bool = false
    let viewModel = CentrosBondadViewModel()
    
    var body: some View {
        NavigationStack {
            Map() {
                ForEach(viewModel.centrosBondad) { centroBondad in
                    Annotation(centroBondad.name, coordinate: centroBondad.coordinate){
                        Image(systemName: "house.circle")
                            .tint(.purple)
                            .shadow(color:.blue, radius: 3)
                            .onTapGesture {
                                selectedCentroBondad = centroBondad
                            }
                    }
                }
            }
            .navigationTitle("Centros de Bondad")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .onAppear{
            Task {
                await viewModel.loadCentrosBondad()
            }
        
        }
        .sheet(item: $selectedCentroBondad) { centroBondand in
            CentroBondadDetailView(centroBondad: centroBondand)
        }
    }
}

#Preview {
    CentroBondadMapView()
}
