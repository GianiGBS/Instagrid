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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didTapLayout1Button() {
        //changeLayout()
        layoutView.style = .layout1
    }
    @IBAction func didTapLayout2Button() {
        //changeLayout()
        layoutView.style = .layout2
    }
    @IBAction func didTapLayout3Button() {
        //changeLayout()
        layoutView.style = .layout3
    }
    
    private func changeLayout() {
        // Modifier image du bouton
        // Modifier le style depuis LayoutView
    }
    
}
