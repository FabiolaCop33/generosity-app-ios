//
//  CentroBondadDetailView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 01/07/24.
//

import Foundation
import SwiftUI
 
struct CentroBondadDetailView: View{
    let centroBondad: CentroBondad
    @ObservedObject var modalManager: ModalPresentationManager
    
    var body: some View{
        ScrollView{
            VStack(spacing: 20){
                Text(centroBondad.name)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Text(centroBondad.adress)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                Text(centroBondad.description)
                    .multilineTextAlignment(.center)
                    .padding()
                Button("Cerrar"){
                    modalManager.showModal = false
                }
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

