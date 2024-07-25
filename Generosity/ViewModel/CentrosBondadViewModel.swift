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
                
                if !categories.keys.contains(categoryId) {
                                categories[categoryId] = []
                            }
                            categories[categoryId]?.append(centro)
                
                // Add category mapping
                //categoryNameMap[categoryId] = categoryName
            }
                
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func filterCentrosById(centros: [CentroBondadModel], id: Int) -> [CentroBondadModel] {
      return centros.filter { $0.id == id }
    }
    
 
    
    func filterCentrosByCategoryID(centros: [CentroBondadModel], id_category: String) -> [CentroBondadModel] {
      return centros.filter { $0.id_category == id_category }
    }

}
