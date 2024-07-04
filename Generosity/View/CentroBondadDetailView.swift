//
//  CentroBondadDetailView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 01/07/24.
//

import Foundation
import SwiftUI

struct CentroBondadDetailView: View{
    let centroBondad: CentroBondadModel
    
    var body: some View{
        ScrollView{
            VStack(spacing: 20){
                Text(centroBondad.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Text(centroBondad.address)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                Text(centroBondad.description)
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.body)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                BlurView(style: .systemMaterial)
                    .ignoresSafeArea()
            )
        }
    }
}

#Preview{
    CentroBondadDetailView(centroBondad: CentroBondadModel(id: 12800010009, name: "Casa del Niño Villa de la Asunción, A.C.", latitude: 21.8867269621701, longitude: -102.320783705718, address: "Dr Salvador Quezada Limon 501, Curtidores, 20040 Aguascalientes, Ags.", description: "Asistencia social a niños, niñas y adolescentes. Albergue, alimentación, vestido, atención médica, educación, recreación, formación moral y talleres."))
}
