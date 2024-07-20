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
            Text("Mi estado es: \(selectedStateID)")
                .font(.system(size: 15, weight: .regular))
                .multilineTextAlignment(.leading).foregroundColor(.blue
                    .opacity(0.5))
                .shadow(color:.blue,radius: 2)
            Picker("Selecciona tu Estado...", selection: $selectedStateID){
                ForEach(listOfStates, id: \.self){state in
                    Text(state)
                        .font(.body)
                        .bold().foregroundStyle(.brown)
                    
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
