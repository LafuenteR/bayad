//
//  PromoController.swift
//  bayad
//
//  Created by Ruel Lafuente on 8/18/21.
//

import UIKit
import Alamofire

class PromoController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var promoTableView: UITableView!
    var promos = [Promo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initController()
        loadPromos()
    }
    
    func initController() {
        self.title = GlobalVariable.promo
        promoTableView.delegate = self
        promoTableView.dataSource = self
        promoTableView.register(UINib(nibName: "PromoCell", bundle: nil), forCellReuseIdentifier: "PromoCell")
    }
    
    func loadPromos() {
        Network.request(URLString: GlobalVariable.bayad) { success, response in
            if success! {
                let decoder = JSONDecoder()
                self.promos.removeAll()
                if let thisPromos = try? decoder.decode([Promo].self, from: response as! Data) {
                    for promo in thisPromos {
                        self.promos.append(promo)
                    }
                    DispatchQueue.main.async {
                        self.promoTableView.reloadData()
                    }
                }
            }
        } failed: { failed, response in
            print("Failed",response as Any)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = promoTableView.dequeueReusableCell(withIdentifier: "PromoCell", for: indexPath) as! PromoCell
        cell.update(promo: promos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "viewPromo", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewPromo" {
            let viewController = segue.destination as! PromoDetailsController
            let selectedRow = sender as? Int
            viewController.promo = promos[selectedRow!]
        }
    }


}
