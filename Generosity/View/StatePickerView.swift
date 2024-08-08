//
//  StatePickerView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 13/07/24.
//

import SwiftUI

struct StatePickerView: View {
    @Binding var selectedStateID: String
    var listOfStates: [String]
    @State private var isVisible = false
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 380,height: 200)
                .foregroundStyle(.regularMaterial)
                .shadow(color: .gray.opacity(0.7), radius: 40, x: 0, y: 3)
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 350,height: 120)
                .foregroundStyle(.white)
            Picker("Selecciona tu Estado...", selection: $selectedStateID){
                ForEach(listOfStates, id: \.self){state in
                    Text(state)
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.brown)
                }
            }
            .pickerStyle(.wheel)
            .opacity(isVisible ? 1 : 0)
        }
        .padding()
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                isVisible = true
            }
        }
        .onDisappear {
            withAnimation(.easeInOut(duration: 0.3)) {
                isVisible = false
            }
        }
    }
}
    struct StatePickerView_Previews: PreviewProvider {
        static var previews: some View {
            StatePickerView(
                selectedStateID: .constant("1280001"),
                listOfStates: ["Aguascalientes", "Baja California", "Campeche"]
            )
        }
    }
