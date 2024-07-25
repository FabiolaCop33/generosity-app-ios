//
//  CentrosBondadViewModel.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 03/07/24.
//

import Foundation
@Observable

class CentrosBondadViewModel{
    var centrosBondad: [CentroBondadModel] = []
    var categories: [String: [CentroBondadModel]] = [:]
    
    
    func loadCentrosBondad() async {
        do {
           let response = try await Networking.shared.fetchCentrosBondad(at: Constants.Urls.centrosBondad)
            centrosBondad = response.results
            for centro in centrosBondad {
                let categoryId = centro.id_category
                let categoryName = centro.category
                
                if !categories.keys.contains(categoryName) {
                                categories[categoryName] = []
                            }
                            categories[categoryName]?.append(centro)
                
            }
                
        } catch {
            print(error.localizedDescription)
        }
    }
    

    
 
    
    func filterCentrosByCategoryID(centros: [CentroBondadModel], id_category: String) -> [CentroBondadModel] {
      return centros.filter { $0.id_category == id_category }
    }

}
