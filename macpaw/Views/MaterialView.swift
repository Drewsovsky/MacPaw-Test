//
//  MaterialView.swift
//  macpaw
//
//  Created by Andrew Shakula on 20.07.2022.
//

import Foundation
import SwiftUI

struct MaterialView: UIViewRepresentable {
    
    let material: UIBlurEffect.Style
    
    init(_ material: UIBlurEffect.Style) {
        self.material = material
    }
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: material))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: material)
    }
}
