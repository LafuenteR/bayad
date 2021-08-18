//
//  PromoDetailsController.swift
//  bayad
//
//  Created by Ruel Lafuente on 8/18/21.
//

import UIKit

class PromoDetailsController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsTextVIew: UITextView!
    var promo: Promo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = promo!.name
        detailsTextVIew.text = promo!.details
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
