//
//  PromoDetailsController.swift
//  bayad
//
//  Created by Ruel Lafuente on 8/18/21.
//

import UIKit
import Kingfisher

class PromoDetailsController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsTextVIew: UITextView!
    var promo: Promo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPromoDetailsController()
    }
    
    func initPromoDetailsController() {
        nameLabel.text = promo!.name
        detailsTextVIew.text = promo!.details
        detailsTextVIew.textColor = .lightGray
        let url = URL(string: promo!.image_url)
        imageView.contentMode = .scaleAspectFill
        imageView.kf.setImage(with: url)
//        updatePromo(id: promo!._id)
    }
    
    func updatePromo(id: String) {
        let url = GlobalVariable.bayad + "/\(id)"
        Network.request(URLString: url, method: .put) { success, response in
            print("updatePromo",success,response)
        } failed: { failed, response in
            print("Failed",response as Any)
        }
    }

}
