//
//  String + Height.swift
//  VKNews
//
//  Created by Lev Kolesnikov on 17.08.2019.
//  Copyright © 2019 Lev Kolesnikov. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let textSize = CGSize(width: width, height: .greatestFiniteMagnitude)
        
        let size = self.boundingRect(with: textSize,
                                     options: .usesLineFragmentOrigin,
                                     attributes: [NSAttributedString.Key.font : font],
                                     context: nil)
//        округление значения CGFloat
        return ceil(size.height)
    }
    
}
