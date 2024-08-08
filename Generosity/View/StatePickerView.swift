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
    
    var body: some View {
    ZStack{
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 380,height: 180)
            .foregroundStyle(.regularMaterial)
      RoundedRectangle(cornerRadius: 10)
          .frame(width: 350,height: 120)
          .foregroundStyle(.regularMaterial)
            Picker("Selecciona tu Estado...", selection: $selectedStateID){
                ForEach(listOfStates, id: \.self){state in
                    Text(state)
                        .font(.body)
                        .bold()
                        .foregroundStyle(.brown)
                }
            }
            .pickerStyle(.wheel)
        }
        .padding()
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
