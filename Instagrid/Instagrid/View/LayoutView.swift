//
//  LayoutView.swift
//  Instagrid
//
//  Created by Giovanni Gabriel on 24/01/2022.
//

import UIKit

class LayoutView: UIView {
    
// Top stack View
    @IBOutlet var firstTopImage : UIImageView?
    @IBOutlet var secondTopImage : UIImageView?
 // Bottom stack View
    @IBOutlet var firstBottomImage : UIImageView?
    @IBOutlet var secondBottomImage : UIImageView?

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
            firstTopImage?.image = UIImage()
            firstTopImage?.isHidden = false
            secondTopImage?.isHidden = true
            firstBottomImage?.image = UIImage()
            firstBottomImage?.isHidden = false
            secondBottomImage?.image = UIImage()
            secondBottomImage?.isHidden = false
        case .layout2:
            firstTopImage?.image = UIImage()
            firstTopImage?.isHidden = false
            secondTopImage?.image = UIImage()
            secondTopImage?.isHidden = false
            firstBottomImage?.image = UIImage()
            firstBottomImage?.isHidden = false
            secondBottomImage?.isHidden = true
        case .layout3:
            firstTopImage?.image = UIImage()
            firstTopImage?.isHidden = false
            secondTopImage?.image = UIImage()
            secondTopImage?.isHidden = false
            firstBottomImage?.image = UIImage()
            firstBottomImage?.isHidden = false
            secondBottomImage?.image = UIImage()
            secondBottomImage?.isHidden = false
        }
        
    }
}
