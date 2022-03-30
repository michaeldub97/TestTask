//
//  TagView+Extension.swift
//  TestTask
//
//  Created by Михаил on 29.03.2022.
//

import Foundation
import TagListView

extension TagView {
    
    private static let gradientLayerAssociation = ObjectAssociation<CAGradientLayer>()

    var gradient: CAGradientLayer? {
        get { return TagView.gradientLayerAssociation[self] }
        set { TagView.gradientLayerAssociation[self] = newValue }
    }
    
    func addLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.red.cgColor, UIColor.purple.cgColor]
        gradient.frame = frame
        self.gradient = gradient
        layer.insertSublayer(gradient, at: 0)
    }
    
    func removeLayer() {
        gradient?.removeFromSuperlayer()
    }
}
