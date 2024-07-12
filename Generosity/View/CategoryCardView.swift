//
//  CategoryCardView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 11/07/24.
//

import SwiftUI

struct CategoryCardView: View {
    let category: String

    var body: some View {
        ZStack {
            Color.pink
                .opacity(0.2)
                .cornerRadius(10)

            VStack(alignment: .center) {
                Image(systemName: "figure.stand")
                    .font(.largeTitle)
                    .foregroundColor(.white)

                Text(category)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()
        }
        .frame(width: 370, height: 150)
    }
}
struct CategoryCardView_Previews: PreviewProvider {
        static let sampleCentroBondad = CentroBondadModel(
            id: 12800010019,
            name: "Asilo Nuestra Señora de Guadalupe",
            latitude: 21.884231076106,
            longitude: -102.305133768509,
            address: "Rafael García Macías 229, Barrio de Guadalupe, 20059 Aguascalientes, Ags.",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. ",
            id_category: "CASAM",
            category: "Centro Asistencia Social a Adultos Mayores"
        )
    static var previews: some View {
        CategoryCardView(category: sampleCentroBondad.category)
    }
}
