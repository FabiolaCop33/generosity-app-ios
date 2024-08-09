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
    colors: [Color.white, Color.gray.opacity(0.5)],
    startPoint: .top, endPoint: .bottom)
  let backgroundGradient = LinearGradient(
    colors: [Color.pink.opacity(0.1), Color.pink.opacity(0.8)],
    startPoint: .top, endPoint: .bottom)
  let selectedCategory: String
  @State private var showStatePicker = false
  @State private var selectedStateID = ""
  let viewModel = CentrosBondadViewModel()

  var filteredCentros: [CentroBondadModel] {
    return centros.filter { centro in
      guard let stateName = viewModel.getState(for: centro.id) else { return false }
      return stateName == selectedStateID
    }
  }

  var body: some View {
      VStack(alignment: .center, spacing: 3) {
      Text("Centros de Bondad")
        .font(.system(size: 40, weight: .bold))
        .multilineTextAlignment(.leading)
        .foregroundColor(.pink)
        .padding()
        Form {
            Section("Información General") {
                LabeledContent {
                    Text(selectedCategory)
                } label: {
                    Label("Categoría:", systemImage: "figure.stand")
                }
                LabeledContent {
                    Text(selectedStateID)
                        .onTapGesture {
                            showStatePicker.toggle()
                        }
                } label: {
                    Label("Estado:", systemImage: "map")
                }
            }
        }
        .listStyle(.grouped)
        
      if showStatePicker {
        StatePickerView(selectedStateID: $selectedStateID, listOfStates: Constants.states)
      }
        Button {
          showStatePicker.toggle()
        } label: {
          Text(showStatePicker ? "Cerrar estados" : "Selecciona tu Estado...")
                .foregroundColor(.white).font(.title3)
                .padding(.top)
        }

      if filteredCentros.isEmpty {
        Spacer()
        if selectedStateID.isEmpty {
          Text("Selecciona un estado para ver los Centros de Bondad.")
            .font(.subheadline.italic())
            .foregroundColor(Color(.white))
            .padding(50)
        } else {
          Text("Actualmente no hay Centros de Bondad en \(selectedStateID) en la categoría \(selectedCategory)")
            .font(.subheadline.italic())
            .foregroundColor(Color(.white))
            .padding()
        Text("Amplía tu búsqueda o explora otras categorías.")
            .font(.caption)
            .foregroundColor(Color(.gray))
            padding()
        }
        Spacer()
      } else {
                List(filteredCentros) { centro in
                    HStack{
                        Image(systemName: "person.circle.fill").resizable().scaledToFit().foregroundColor(Color(.systemPink))
                            .frame(width: 40, height: 40)
                        Text(centro.name)
                            .font(.system(size: 15, weight: .bold))
                            .multilineTextAlignment(.leading).foregroundColor(.brown)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(.systemBrown))
                            .imageScale(.large)
                            .bold()
                    }
                    .listRowBackground(
                        Capsule()
                        .fill(backgroundGradientCapsule)
                        .padding(1)
                        )
                    
                }
                .listStyle(.plain)
                .padding(10)
                .shadow(radius: 100)
            }
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
