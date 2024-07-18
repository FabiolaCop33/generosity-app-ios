//
//  CentroBondadCategoryListView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 11/07/24.
//

import SwiftUI

struct CentroBondadCategoryListView: View {
    var selectedCategory: String
    var viewModel: CentrosBondadViewModel
    
    var body: some View {
        let filteredCentros = viewModel.filterCentrosByCategoryID(centros: viewModel.centrosBondad, id_category: selectedCategory)
        List(filteredCentros, id: \.id_category){centroBondad in
            ForEach(filteredCentros, id: \.id) { centroBondad in
                NavigationLink(destination: CentroBondadDetailView(centroBondad: centroBondad)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(centroBondad.name)
                                .font(.headline)
                            Text(centroBondad.address)
                                .font(.subheadline)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }.padding()
                }
            }
        }
    }
}
