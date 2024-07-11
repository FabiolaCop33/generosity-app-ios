//
//  CategoryCardView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 11/07/24.
//

import SwiftUI

struct CategoryCardView: View {
    let category: String

    var body: some View {
        ZStack {
            Color.blue
                .opacity(0.2)
                .cornerRadius(10)

            VStack(alignment: .center) {
                Image(systemName: "list.bullet")
                    .font(.largeTitle)
                    .foregroundColor(.white)

                Text(category)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()
        }
        .frame(width: 100, height: 100)
    }
}
