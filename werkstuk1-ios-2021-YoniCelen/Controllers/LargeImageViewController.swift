//
//  LargeImageViewController.swift
//  werkstuk1-ios-2021-YoniCelen
//
//  Created by user201042 on 8/16/21.
//

import Foundation
import UIKit

class LargeImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    var image : UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }
}
