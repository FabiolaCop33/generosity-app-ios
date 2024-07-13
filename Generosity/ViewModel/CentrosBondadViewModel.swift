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
    
    func loadCentrosBondad() async {
        do {
           let response = try await Networking.shared.fetchCentrosBondad(at: Constants.Urls.centrosBondad)
            centrosBondad = response.results
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
