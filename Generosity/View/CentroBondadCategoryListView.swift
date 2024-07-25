//
//  CentroBondadCategoryListView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 11/07/24.
//

import SwiftUI

struct CentroBondadCategoryListView: View {
    let centros: [CentroBondadModel]
    let backgroundGradientCapsule = LinearGradient(
        colors: [Color.white,
                 Color.pink
            .opacity(0.2)],
        startPoint: .top, endPoint: .bottom)
    let backgroundGradient = LinearGradient(
        colors: [Color.white,
                 Color.pink
            .opacity(0.1)],
        startPoint: .top, endPoint: .bottom)
    let selectedCategory: String
    @State private var showStatePicker = false
    @State private var selectedStateID = ""


    var body: some View {
        VStack(){
            Text("Centros de Bondad")
                .font(.system(size: 40, weight: .bold))
                .multilineTextAlignment(.leading)
                .foregroundColor(.pink)
                .padding()
            HStack{
                Text("Categoria:" )
                    .font(.system(size: 15, weight: .regular))
                    .multilineTextAlignment(.leading).foregroundColor(.blue
                        .opacity(0.5))
                    .shadow(color:.blue,radius: 2)
                Text("\(selectedCategory)")
                    .font(.system(size: 15, weight: .regular))
                    .multilineTextAlignment(.leading).foregroundColor(.blue
                        .opacity(0.5))
                    .shadow(color:.blue,radius: 2)
            }
            HStack(){
                Text("Estado:")
                    .font(.system(size: 15, weight: .regular))
                    .multilineTextAlignment(.leading).foregroundColor(.blue
                        .opacity(0.5))
                    .shadow(color:.blue,radius: 2)
                Button(showStatePicker ? "Cerrar estados" : "Selecciona tu Estado..."){
                    showStatePicker.toggle()
                }
                .foregroundColor(.gray)
                .padding()
            }
            
            if showStatePicker{
                StatePickerView(selectedStateID: $selectedStateID)
            }
                List(centros) { centro in
                    HStack{
                        Image(systemName: "person.circle.fill").resizable().scaledToFit().foregroundColor(Color(.systemBrown))
                            .frame(width: 40, height: 40)
                        Text(centro.name)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.leading).foregroundColor(.blue
                                .opacity(0.5))
                            .shadow(color:.blue,radius: 2)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(.systemBrown))
                            .imageScale(.large)
                            .bold()
                    }
                    .listRowBackground(Capsule()
                        .fill(backgroundGradientCapsule))
                    .padding()
                    
                }
                .listStyle(.plain)
                .padding(20)
                .shadow(radius: 100)
        }
        .background(backgroundGradient)
        
    }
}

    struct CentroBondadCategoryListView_Previews: PreviewProvider {
        static var previews: some View {

            CentroBondadCategoryListView(centros: [
                CentroBondadModel(id: 12800010054, name: "Fundación Tres Legados Centro contra las Adicciones, A. C.", latitude: 21.7914715716143,longitude: -102.258060040021, address: "Calle Las Vegas, #101, Esquina con Chicago Colonia Lomas de Nueva York, 20298 Aguascalientes, México", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu", id_category: "CASPA", category: "Centro de Asistencia Social a Personas con Adicciones"),
                CentroBondadModel(id: 12800010063, name: "Grupo Despertar de Ags., A.C.", latitude: 21.8735336697963,longitude: -102.277687413211, address: "Av. Paseo de la Cruz 520, Lázaro Cárdenas, 20257 Aguascalientes, Ags.", description: "Grupo Despertar de Neuróticos Anónimos en la ciudad de Aguascalientes, Organización de Auto-ayuda basada en los doces pasos, doce tradiciones de AA.", id_category: "CASPA", category: "Centro de Asistencia Social a Personas con Adicciones")
                
            ], selectedCategory: "Centro de Asistencia Social a Personas con Adicciones")
    }
}
