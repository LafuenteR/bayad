//
//  GlobalVariable.swift
//  bayad
//
//  Created by Ruel Lafuente on 8/18/21.
//

import Foundation

struct GlobalVariable {
    
    static var url = "https://crudcrud.com/api/4e044677f5f84475bbf39e6b1149dc07/"
    static var bayad = url + "bayad"
    static var promo = "Promos"
}

struct Promo: Codable {
    var _id: String
    var name: String
    var details: String
    var image_url: String
    var read: Int
}
