//
//  CategoryGridView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 11/07/24.
//

import SwiftUI

struct CategoryGridView: View {
    let viewModel = CentrosBondadViewModel()
    var categories: [String: [CentroBondadModel]]
    
    init(categories: [String: [CentroBondadModel]]){
        self.categories = categories
    }
    
    var body: some View {
        ScrollView {
          LazyVGrid(columns: [GridItem(.flexible())]) {
            ForEach(categories.keys.sorted(), id: \.self) { category in
              CategoryCardView(category: category)
            }
          }
          .padding()
        }
      }
    }
struct CategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCategories: [String: [CentroBondadModel]] = [
            "Niños y Adolescentes": [],
            "Adultos Mayores": [],
            "Discapacidad": [],
            "Adicciones": []
        ]
        return CategoryGridView(categories: sampleCategories)
    }
}

