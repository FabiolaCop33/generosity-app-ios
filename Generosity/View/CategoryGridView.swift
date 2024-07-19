//
//  CategoryGridView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 11/07/24.
//

import SwiftUI

struct CategoryGridView: View {
    var viewModel = CentrosBondadViewModel()
    @State private var selectedCategory: String? = nil
    @State private var showSheet = false

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300))]) {
                    if viewModel.categories.isEmpty {
                        Text("No hay categorías disponibles")
                    } else {
                        ForEach(viewModel.categories.keys.sorted(), id: \.self) { category in
                            CategoryCardView(category: category)
                                .onTapGesture {
                                    selectedCategory = category
                                    showSheet = true
                                }
                        }
                    }
                }
                .padding()
            }
        }
        .sheet(isPresented: $showSheet) {
            if let selectedCategory = selectedCategory, let centros = viewModel.categories[selectedCategory] {
                CentroBondadCategoryListView(centros: centros)
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

