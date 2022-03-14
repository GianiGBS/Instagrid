//
//  ViewController.swift
//  Instagrid
//
//  Created by Giovanni Gabriel on 24/12/2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
// Top Stack
    @IBOutlet var swipeLabel: UILabel!
    @IBAction func swipeToShare(_ sender: UISwipeGestureRecognizer) {
        shareLayoutView()
        print(sender.direction)
    }
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    
// Layout View
    @IBOutlet weak var layoutView: LayoutView!
    @IBOutlet var addPictureButtons: [UIButton]!
    var currentButton = 0
    @IBAction func addImageTapped(_ sender: UIButton) {
        currentButton = sender.tag
        imagePickerController()
    }
// Bottom HStack
    @IBOutlet weak var layout1Button: UIButton!
    @IBOutlet weak var layout2Button: UIButton!
    @IBOutlet weak var layout3Button: UIButton!
    
// Selected Style Button
    enum Style {
        case layout1, layout2, layout3
    }
    private func setImageButton(_ style: Style) {
        switch style {
        case .layout1:
            layout1Button.setImage(UIImage(named: "Groupe 1"), for: .normal)
            layout2Button.setImage(UIImage(named: "Layout 2"), for: .normal)
            layout3Button.setImage(UIImage(named: "Layout 3"), for: .normal)
            addPictureButtons[0].imageView?.contentMode = .scaleAspectFill
            addPictureButtons[2].imageView?.contentMode = .scaleToFill
        case .layout2:
            layout1Button.setImage(UIImage(named: "Layout 1"), for: .normal)
            layout2Button.setImage(UIImage(named: "Groupe 2"), for: .normal)
            layout3Button.setImage(UIImage(named: "Layout 3"), for: .normal)
            addPictureButtons[0].imageView?.contentMode = .scaleToFill
            addPictureButtons[2].imageView?.contentMode = .scaleAspectFill
        case .layout3:
            layout1Button.setImage(UIImage(named: "Layout 1"), for: .normal)
            layout2Button.setImage(UIImage(named: "Layout 2"), for: .normal)
            layout3Button.setImage(UIImage(named: "Groupe 3"), for: .normal)
            addPictureButtons[0].imageView?.contentMode = .scaleToFill
            addPictureButtons[2].imageView?.contentMode = .scaleToFill
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initSwipeDirection()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async {
            self.initSwipeDirection()
        }
    }
// Init Swipe direction
    private func initSwipeDirection() {
        if UIApplication.shared.statusBarOrientation.isPortrait {
            swipeGesture.direction = .up
            swipeLabel.text = "Swipe up to share"
        } else {
            swipeGesture.direction = .left
            swipeLabel.text = "Swipe left to share"
        }
    }
// Action Button from Bottom stack
    @IBAction func didTapLayout1Button() {
        setImageButton(.layout1)
        layout1Button.titleLabel?.isHidden = true
        layoutView.style = .layout1
    }
    @IBAction func didTapLayout2Button() {
        setImageButton(.layout2)
        layout2Button.titleLabel?.isHidden = true
        layoutView.style = .layout2
    }
    @IBAction func didTapLayout3Button() {
        setImageButton(.layout3)
        layout3Button.titleLabel?.isHidden = true
        layoutView.style = .layout3
    }
// Picking Image from library
    func imagePickerController() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            addPictureButtons[currentButton].setImage(editedImage, for: .normal)
            addPictureButtons[currentButton].clipsToBounds = true
        }
        else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            addPictureButtons[currentButton].setImage(originalImage, for: .normal)
            addPictureButtons[currentButton].clipsToBounds = true
        }
        // Close picker
        dismiss(animated: true, completion: nil)
    }
// Share creation
    func shareLayoutView() {
        let items = [UIImage.init(view: layoutView)]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(ac, animated: true)
    }
}

extension UIImage {
    convenience init(view: UIView) {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
    view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    self.init(cgImage: (image?.cgImage)!)
    }
}
