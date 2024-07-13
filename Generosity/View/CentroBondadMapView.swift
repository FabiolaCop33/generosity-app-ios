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
    @State private var selectedStateID: Int? = nil
    
    
    var body: some View {
        Map() {
            ForEach(viewModel.centrosBondad) { centroBondad in
                Annotation(centroBondad.name, coordinate: centroBondad.coordinate){
                    Image(systemName: "house.circle")
                        .shadow(color:.pink, radius: 3)
                        .onTapGesture {
                            selectedCentroBondad = centroBondad
                        }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.loadCentrosBondad()
                // Optionally filter based on selectedStateID if it has a value
                if let stateID = selectedStateID {
                    viewModel.centrosBondad = viewModel.filterCentrosById(centros: viewModel.centrosBondad, id: stateID)
                }
            }
        }.sheet(item: $selectedCentroBondad) { centroBondand in
            CentroBondadDetailView(centroBondad: centroBondand)
        }
    }
}

#Preview {
    CentroBondadMapView()
}
