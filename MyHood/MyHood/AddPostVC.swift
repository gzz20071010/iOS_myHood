//
//  AddPostVC.swift
//  MyHood
//
//  Created by shengxiang guo on 1/19/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var postImage: UIImageView!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var descriptionField: UITextField!
    
    var imgPicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImage.layer.cornerRadius = postImage.frame.size.width/2
        postImage.clipsToBounds = true
        
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
    }

    @IBAction func addPicButtonPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imgPicker, animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func makePostButtonPressed(sender: AnyObject) {
        if let title = titleField.text, let desc = descriptionField.text, let img = postImage.image{
            let imagePath = DataService.instance.saveImgAndCreatePath(img)
            
            let post = Post(imagePath: imagePath, title: title, postDesc: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgPicker.dismissViewControllerAnimated(true, completion: nil)
        postImage.image = image
    }
}
