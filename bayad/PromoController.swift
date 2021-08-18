//
//  PromoController.swift
//  bayad
//
//  Created by Ruel Lafuente on 8/18/21.
//

import UIKit
import Alamofire

class PromoController: UIViewController {

    var Promos = [Promo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPromos()
    }
    
    func loadPromos() {
        Network.request(URLString: GlobalVariable.bayad) { success, response in
            if success! {
                let decoder = JSONDecoder()
                self.Promos.removeAll()
                if let thisPromos = try? decoder.decode([Promo].self, from: response as! Data) {
                    for promo in thisPromos {
                        self.Promos.append(promo)
                    }
                }
            }
        } failed: { failed, response in
            print("Failed",response as Any)
        }
    }

}
