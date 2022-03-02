//
//  LayoutView.swift
//  Instagrid
//
//  Created by Giovanni Gabriel on 24/01/2022.
//

import UIKit

class LayoutView: UIView {
    
// Top stack View
    @IBOutlet var firstTopImage : UIView?
    @IBOutlet var secondTopImage : UIView?
// Bottom stack View
    @IBOutlet var firstBottomImage : UIView?
    @IBOutlet var secondBottomImage : UIView?
    
// Button
    
    
    
    enum Style {
        case layout1, layout2, layout3
    }
    
    var style : Style = .layout3 {
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style) {
        switch style {
        case .layout1:
            firstTopImage?.isHidden = false
            secondTopImage?.isHidden = true
            firstBottomImage?.isHidden = false
            secondBottomImage?.isHidden = false
        case .layout2:
            firstTopImage?.isHidden = false
            secondTopImage?.isHidden = false
            firstBottomImage?.isHidden = false
            secondBottomImage?.isHidden = true
        case .layout3:
            firstTopImage?.isHidden = false
            secondTopImage?.isHidden = false
            firstBottomImage?.isHidden = false
            secondBottomImage?.isHidden = false
        }
        
    }
    
    
}
