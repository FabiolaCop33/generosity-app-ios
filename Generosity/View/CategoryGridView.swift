//
//  CategoryGridView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 11/07/24.
//

import SwiftUI

struct CategoryGridView: View {
    let viewModel = CentrosBondadViewModel()
    var categories: [String: [CentroBondadModel]] {
        var categoriesDict = [String:[CentroBondadModel]]()
        for centroBondad in viewModel.centrosBondad{
            categoriesDict[centroBondad.category, default: []].append(centroBondad)
        }
        return categoriesDict
    }
    
    @State private var searchText: String = ""
    
    var filteredCategories: [String: [CentroBondadModel]]{
        var filteredDict = [String: [CentroBondadModel]]()
        for (category, centros) in categories {
            if category.lowercased().contains(searchText.lowercased()){
                filteredDict[category] = centros
            }
        }
        return filteredDict
    }
    
    var body: some View {
        ScrollView{
           Text("Catálogo de categorias")
        }
    }
}

#Preview {
    CategoryGridView()
}
