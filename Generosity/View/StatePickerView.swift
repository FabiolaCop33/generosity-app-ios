//
//  StatePickerView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 13/07/24.
//

import SwiftUI

struct StatePickerView: View {
    @State private var selectedStateID = ""
    var listOfStates: [String] {
        return Constants.states
    }
    
    var body: some View {
        VStack{
            Text("Centros de Bondad en: \(selectedStateID)")
            Picker("Selecciona tu Estado...", selection: $selectedStateID){
                ForEach(listOfStates, id: \.self){state in
                    Text(state)
                        .font(.body)
                    
                }
            }
            .pickerStyle(.wheel)
        }
        .padding()
    }
}

struct StatePickerView_Previews: PreviewProvider{
    static var previews: some View {
        StatePickerView()
    }
}
