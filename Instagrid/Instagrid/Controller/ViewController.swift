//
//  ViewController.swift
//  Instagrid
//
//  Created by Giovanni Gabriel on 24/12/2021.
//

import UIKit

class ViewController: UIViewController {
    //Top HStack
    
    
    // Layout View
    @IBOutlet weak var layoutView: LayoutView!
    
    // Bottom HStack
    @IBOutlet weak var layout1Button: UIButton!
    @IBOutlet weak var layout2Button: UIButton!
    @IBOutlet weak var layout3Button: UIButton!
    enum Style {
        case layout1, layout2, layout3
    }
    
    var style : Style = .layout3 {
        didSet {
            setImageButton(style)
        }
    }
    private func setImageButton(_ style: Style) {
        switch style {
        case .layout1:
            layout1Button.setBackgroundImage(UIImage(named: "Groupe 1"), for: UIControl.State.selected)
            layout2Button.setBackgroundImage(UIImage(named: "Layout 2"), for: UIControl.State.normal)
            layout3Button.setBackgroundImage(UIImage(named: "Layout 3"), for: UIControl.State.normal)
        case .layout2:
            layout1Button.setBackgroundImage(UIImage(named: "Layout 1"), for: UIControl.State.normal)
            layout2Button.setBackgroundImage(UIImage(named: "Groupe 2"), for: UIControl.State.normal)
            layout3Button.setBackgroundImage(UIImage(named: "Layout 3"), for: UIControl.State.normal)
        case .layout3:
            layout1Button.setBackgroundImage(UIImage(named: "Layout 1"), for: UIControl.State.normal)
            layout2Button.setBackgroundImage(UIImage(named: "Layout 2"), for: UIControl.State.normal)
            layout3Button.setBackgroundImage(UIImage(named: "Groupe 3"), for: UIControl.State.normal)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func didTapLayout1Button() {
        //changeLayout()
        self.style = .layout1
        layout1Button.titleLabel?.isHidden = true
        layoutView.style = .layout1
    }
    @IBAction func didTapLayout2Button() {
        //changeLayout()
        self.style = .layout2
        layout2Button.titleLabel?.isHidden = true
        layoutView.style = .layout2
    }
    @IBAction func didTapLayout3Button() {
        //changeLayout()
        self.style = .layout3
        layout3Button.titleLabel?.isHidden = true
        layoutView.style = .layout3
    }
    
    private func changeLayout() {
        // Modifier image du bouton
        // Modifier le style depuis LayoutView
    }
    

}
