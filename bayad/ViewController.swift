//
//  ViewController.swift
//  bayad
//
//  Created by Ruel Lafuente on 8/18/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadPromos()
    }
    
    func loadPromos() {
        Network.request(URLString: GlobalVariable.bayad) { success, response in
            if success! {
                let decoder = JSONDecoder()
                if let promos = try? decoder.decode([Promo].self, from: response as! Data) {
                    for promo in promos {
                        print(promo._id,promo.name)
                    }
                }
            }
        } failed: { failed, response in
            print("failed",response as Any)
        }
    }


}

struct Promo: Codable {
    var _id: String
    var name: String
    var details: String
    var image_url: String
    var read: Int
}

