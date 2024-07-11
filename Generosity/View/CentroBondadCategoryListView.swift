//
//  CentroBondadCategoryListView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 11/07/24.
//

import SwiftUI

struct CentroBondadCategoryListView: View {
    let category: String
    let centrosBondad: [CentroBondadModel]
    
    var body: some View {
        List{
            ForEach(centrosBondad, id: \.id) { centroBondad in
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
