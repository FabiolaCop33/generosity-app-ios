//
//  CentroBondadDetailView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 01/07/24.
//

import Foundation
import SwiftUI

struct CentroBondadDetailView: View{
    let centroBondad: CentroBondadModel
    let backgroundGradient = LinearGradient(
        colors: [Color.white,
                 Color.pink
            .opacity(0.1)],
        startPoint: .top, endPoint: .bottom)
    
    var body: some View{
        ScrollView{
            VStack(alignment: .leading){
                Text("Centro de Bondad")
                    .font(.system(size: 40, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.pink)
                    .padding()
                    HStack{
                        Image(systemName: "person.circle.fill").resizable().scaledToFit().foregroundColor(Color(.systemGray))
                            .frame(width: 50, height: 50)
                            Text(centroBondad.name)
                                .font(.system(size: 25, weight: .regular))
                                .multilineTextAlignment(.leading).foregroundColor(.blue
                                    .opacity(0.5))
                                .shadow(color:.blue,radius: 2)
                    }
                    
                    Spacer()
                    
                    HStack(alignment:.center, spacing: 10){
                        Image(systemName:"arrow.triangle.turn.up.right.diamond").imageScale(.large)
                            .foregroundColor(.blue
                                .opacity(0.5))
                            .shadow(color:.blue,radius: 2)
                        Text(centroBondad.address)
                            .font(.system(size: 12, weight: .thin))
                            .multilineTextAlignment(.trailing)
                        Image(systemName:"mappin.circle").imageScale(.large).foregroundColor(.gray
                            .opacity(0.5))
                        .shadow(color:.black,radius: 2)
                    }.padding(4)
                HStack{
                    Text("Horarios de atención:")                  .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.leading).foregroundColor(.blue
                            .opacity(0.5))
                        .shadow(color:.blue,radius: 2)
                    Text("De Lunes a viernes , de 8 am a 3 pm").font(.system(size: 12, weight: .thin))
                        .multilineTextAlignment(.trailing)
                }
                
                    Divider()
                HStack(alignment:.center, spacing: 40){
                        Image(systemName:"phone.circle").imageScale(.large).foregroundColor(.blue
                            .opacity(0.5))
                        .shadow(color:.blue,radius: 2)
                        Image(systemName:"envelope.circle").imageScale(.large).foregroundColor(.blue
                            .opacity(0.5))
                        .shadow(color:.blue,radius: 2)
                        Image(systemName:"network").imageScale(.large).foregroundColor(.blue
                            .opacity(0.5))
                        .shadow(color:.blue,radius: 2)
                        Image(systemName:"bolt.horizontal.circle").imageScale(.medium).foregroundColor(.blue
                            .opacity(0.5))
                        .shadow(color:.blue,radius: 2)
                        Image(systemName:"heart").imageScale(.large).foregroundColor(.blue
                            .opacity(0.5))
                        .shadow(color:.blue,radius: 2)
                    Image(systemName:"bookmark").imageScale(.large).foregroundColor(.blue
                        .opacity(0.5))
                    .shadow(color:.blue,radius: 2)
                    
                    }.padding()
                    Text("Categoría")
                    .font(.system(size: 15, weight: .regular))
                    .multilineTextAlignment(.leading).foregroundColor(.blue
                        .opacity(0.5))
                    .shadow(color:.blue,radius: 2)
                    Spacer()
                Text(centroBondad.category)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.brown)
                    .shadow(color:.gray,radius: 1)
                    Spacer()
                
                    Text("Descripción")
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.leading).foregroundColor(.blue
                            .opacity(0.5))
                        .shadow(color:.blue,radius: 2)
                    Spacer()
                    Text(centroBondad.description)
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 20, weight: .regular))
                        .foregroundColor(.brown)
                        .shadow(color:.gray,radius: 1)
                    Spacer()
                    Text("Actividades")
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.leading).foregroundColor(.blue
                            .opacity(0.5))
                        .shadow(color:.blue,radius: 2)
                    Spacer()
                    Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur").multilineTextAlignment(.leading)
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.brown)
                    .shadow(color:.gray,radius: 1)
                    
                }
                .padding()
                .frame(height:.infinity)
                .frame(maxWidth:.infinity)
                .transition(.move(edge: .bottom))
                .background(backgroundGradient)
        }
    }
}

#Preview{
    CentroBondadDetailView(centroBondad: CentroBondadModel(id: 12800010009, name: "Casa del Niño Villa de la Asunción, A.C.", latitude: 21.8867269621701, longitude: -102.320783705718, address: "Dr Salvador Quezada Limon 501, Curtidores, 20040 Aguascalientes, Ags.", description: "Asistencia social a niños, niñas y adolescentes. Albergue, alimentación, vestido, atención médica, educación, recreación, formación moral y talleres.", id_category: "CASNNA", category: "Centro Asistencia Social a Niñas, Niños y Adolescentes"))
}
