//
//  CentroBondadListView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 08/07/24.
//

import SwiftUI

struct CentroBondadListView: View {
    let viewModel = CentrosBondadViewModel()
    
    var body: some View {
        NavigationStack(){
            List(viewModel.centrosBondad){centroBondad in
                VStack(alignment: .leading){
                    Text(centroBondad.name)
                        .font(.headline)
                    Text(centroBondad.address)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Lista de Centros de Bondad")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                Task {
                    await viewModel.loadCentrosBondad()
                }
            }
        }
    }
}

#Preview {
    CentroBondadListView()
}
