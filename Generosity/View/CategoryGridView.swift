//
//  CategoryGridView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 11/07/24.
//

import SwiftUI

struct CategoryGridView: View {
var viewModel = CentrosBondadViewModel()
@State private var selectedCategory: String = ""

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300))]) {
                    if viewModel.categories.isEmpty {
                        Text("No hay categorías disponibles")
                    } else {
                        ForEach(viewModel.categories.keys.sorted(), id: \.self) { category in
                            NavigationLink(
                                destination: CentroBondadCategoryListView(
                                    selectedCategory: category,
                                    viewModel: viewModel
                                )
                            ) {
                                CategoryCardView(category: category)
                                    .onTapGesture {
                                        
                                    }
                            }
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
        let viewModel = CentrosBondadViewModel()
        viewModel.categories = [
            "Niños y Adolescentes": [],
            "Adultos Mayores": [],
            "Discapacidad": [],
            "Adicciones": [],
            "Salud": []
        ]

        return CategoryGridView(viewModel: viewModel)
    }
}

