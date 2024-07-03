//
//  ModalPresentationManager.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 02/07/24.
//

import Foundation

class ModalPresentationManager: ObservableObject {
    @Published var showModal = false
    let centroBondad: CentroBondad
    
    init(centroBondad: CentroBondad){
        self.centroBondad = centroBondad
    }
    
    func presentarModal(){
        showModal = true
    }
}
