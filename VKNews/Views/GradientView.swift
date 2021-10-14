//
//  GradientView.swift
//  VKNewsFeed
//
//  Created by Lev Kolesnikov on 19.08.2019.
//  Copyright © 2019 Lev Kolesnikov. All rights reserved.
//

import Foundation
import UIKit

class GradientView: UIView {

    @IBInspectable private var startColor: UIColor? {
        didSet {
            setupGradientsColor()
        }
    }

    @IBInspectable private var endColor: UIColor? {
        didSet {
            setupGradientsColor()
        }
    }

    private let gradienLayer = CAGradientLayer()

// Инициализатор при работе с View кодом
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

// Инициализатор при работе с View из Storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupGradient()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        растягиваем по всем границами
        gradienLayer.frame = bounds
    }

    private func setupGradient() {
        self.layer.addSublayer(gradienLayer)
        setupGradientsColor()
        gradienLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradienLayer.endPoint = CGPoint(x: 0.5, y: 1)
    }

    private func setupGradientsColor() {
        if let startColor = startColor, let endColor = endColor {
            gradienLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }

}
