//
//  CategoryGridView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 11/07/24.
//

import SwiftUI

struct CategoryGridView: View {
    var viewModel = CentrosBondadViewModel()
    var categories: [String: [CentroBondadModel]]
    @State private var selectedStateID = ""
    var showPicker = true
    
    init(categories: [String: [CentroBondadModel]]){
        self.categories = categories
    }
    
    var body: some View {
        VStack{
            ScrollView {
              LazyVGrid(columns: [GridItem(.flexible())]) {
                ForEach(categories.keys.sorted(), id: \.self) { category in
                    NavigationLink(
                      destination: CentroBondadCategoryListView(
                        category: category,
                        centrosBondad: categories[category] ?? []
                      )
                    ) {
                      CategoryCardView(category: category)
                    }
                  }
                }
                .padding()
            }
        }
      }
    }
struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCategories: [String: [CentroBondadModel]] = [
            "Niños y Adolescentes": [],
            "Adultos Mayores": [],
            "Discapacidad": [],
            "Adicciones": [],
            "Salud": []
        ]
        return CategoryGridView(categories: sampleCategories)
    }
}

