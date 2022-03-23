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
    @IBAction func didSwipeToShare(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .up:
            transformLayoutViewWithUp(gesture: sender)
        case .left:
            transformLayoutViewWithLeft(gesture: sender)
        default:
            break
        }
        shareLayoutView()
        print(sender.direction)
    }
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    
// Layout View
    @IBOutlet var layoutView : UIView!
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
    private func setStyleButton(_ style: Style) {
        switch style {
        case .layout1:
            layout1Button.isSelected = true
            layout2Button.isSelected = false
            layout3Button.isSelected = false
            
            addPictureButtons[0].imageView?.contentMode = .scaleAspectFill
            addPictureButtons[1].isHidden = true
            addPictureButtons[2].imageView?.contentMode = .scaleToFill
            addPictureButtons[3].isHidden = false
        case .layout2:
            layout2Button.isSelected = true
            layout3Button.isSelected = false
            layout1Button.isSelected = false
            
            addPictureButtons[0].imageView?.contentMode = .scaleToFill
            addPictureButtons[1].isHidden = false
            addPictureButtons[2].imageView?.contentMode = .scaleAspectFill
            addPictureButtons[3].isHidden = true
        case .layout3:
            layout3Button.isSelected = true
            layout1Button.isSelected = false
            layout2Button.isSelected = false
            
            addPictureButtons[0].imageView?.contentMode = .scaleToFill
            addPictureButtons[1].isHidden = false
            addPictureButtons[2].imageView?.contentMode = .scaleToFill
            addPictureButtons[3].isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initSwipeDirection()
        
        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeToShare(_:)))
        layoutView.addGestureRecognizer(swipeGestureRecognizer)
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
// Transform LayoutView when swipe
    private func transformLayoutViewWithUp(gesture: UISwipeGestureRecognizer) {
        // let translation = gesture.location(in: layoutView)
        let screenHeight = UIScreen.main.bounds.height
        let translationtransform = CGAffineTransform(translationX: 0, y: -screenHeight)
        UIView.animate(withDuration: 0.5, animations: {
            self.layoutView.transform = translationtransform})
        {(succes) in
            if succes {
                self.shareLayoutView()
            }
        }
    }
    private func transformLayoutViewWithLeft(gesture: UISwipeGestureRecognizer) {
        // let translation = gesture.location(in: layoutView)
        let screenWidth = UIScreen.main.bounds.width
        let translationtransform = CGAffineTransform(translationX: -screenWidth, y:0)
        UIView.animate(withDuration: 0.5, animations: {
            self.layoutView.transform = translationtransform})
        {(succes) in
            if succes {
                self.shareLayoutView()
            }
        }
    }
    
    private func showLayoutView() {
        layoutView.transform = .identity
    }
// Action Button from Bottom stack
    @IBAction func didTapLayout1Button() {
        setStyleButton(.layout1)
        layout1Button.titleLabel?.isHidden = true
    }
    @IBAction func didTapLayout2Button() {
        setStyleButton(.layout2)
        layout2Button.titleLabel?.isHidden = true
    }
    @IBAction func didTapLayout3Button() {
        setStyleButton(.layout3)
        layout3Button.titleLabel?.isHidden = true
    }
// Picking Image from library
    func imagePickerController() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
// Select Image from library
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
