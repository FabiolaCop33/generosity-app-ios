//
//  BlurView.swift
//  Generosity
//
//  Created by Familia Alvarado Perez on 02/07/24.
//

import Foundation
import SwiftUI


struct BlurView: UIViewRepresentable{
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context)-> UIVisualEffectView{
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        return blurView
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
