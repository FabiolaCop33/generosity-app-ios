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
struct CentroBondadCategoryListView_Previews: PreviewProvider {
  static var previews: some View {
    let sampleCentrosBondad: [CentroBondadModel] = [
      CentroBondadModel(
        id: 12800010019,
        name: "Asilo Nuestra Señora de Guadalupe",
        latitude: 21.884231076106,
        longitude: -102.305133768509,
        address: "Rafael García Macías 229, Barrio de Guadalupe, 20059 Aguascalientes, Ags.",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
        id_category: "CASAM",
        category: "Centro Asistencia Social a Adultos Mayores"
      )
    ]

    return CentroBondadCategoryListView(
      category: "Centro Asistencia Social a Adultos Mayores",
      centrosBondad: sampleCentrosBondad
    )
  }
}
