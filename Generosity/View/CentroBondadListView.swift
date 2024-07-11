//
//  CentroBondadListView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 08/07/24.
//

import SwiftUI

struct CentroBondadListView: View {
    let viewModel = CentrosBondadViewModel()
    let backgroundGradient = LinearGradient(
        colors: [Color.white,
                 Color.cyan
                    .opacity(0.08)],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        
            List(viewModel.centrosBondad){centroBondad in
                VStack(alignment: .leading){
                    Text(centroBondad.name)
                        .font(.headline)
                    Text(centroBondad.address)
                        .font(.subheadline)
                }
            }
            .onAppear {
            Task {
                await viewModel.loadCentrosBondad()
            }
        }
    }
}

#Preview {
    CentroBondadListView()
}
