//
//  PromoControllerExtension.swift
//  bayad
//
//  Created by Ruel Lafuente on 8/18/21.
//

import Foundation
import UIKit
import Alamofire

extension PromoController {
    
    @objc func longPress(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.began {
            let touchPoint = sender.location(in: promoTableView)
            if promoTableView.indexPathForRow(at: touchPoint) != nil {
                let promoIndex = promoTableView.indexPathForRow(at: touchPoint)?.row
                print(promos[promoIndex!].name)
                deleteAlert(promo: promos[promoIndex!])
            }
        }
    }
    
    func deleteAlert(promo: Promo) {
        let alert = UIAlertController(title: "", message: "\(promo.name)",preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: {(_: UIAlertAction!) in
            self.deletePromo(id: promo._id)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func deletePromo(id: String) {
        let url = GlobalVariable.bayad + "/\(id)"
        Network.request(URLString: url, method: .delete, parameter: nil) { success, response in
            self.loadPromos()
        } failed: { failed, response in
            print("Failed",response as Any)
        }
    }
}
