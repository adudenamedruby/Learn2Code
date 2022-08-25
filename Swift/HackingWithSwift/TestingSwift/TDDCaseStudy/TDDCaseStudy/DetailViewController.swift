//
// Created by Roux Buciu on 2022-08-05.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {

    public let imageView = UIImageView()

    public var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }

    }

    override func loadView() {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        view = imageView
    }
}
