//
//  CustomMarkerView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 28/06/24.
//

import SwiftUI

struct CustomMarkerView: View {
    let centroBondad: CentroBondad
    let modalPresentationManager: ModalPresentationManager
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            VStack{
                Text(centroBondad.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Text(centroBondad.adress)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                Text(centroBondad.description)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .font(.body)
                Button("Ver más"){
                    modalPresentationManager.presentarModal()
                }
                .padding()
            }
        }
    }
}
