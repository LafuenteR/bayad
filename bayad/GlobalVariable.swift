//
//  GlobalVariable.swift
//  bayad
//
//  Created by Ruel Lafuente on 8/18/21.
//

import Foundation

struct GlobalVariable {
    
    static var url = "https://crudcrud.com/api/b55105ca36b34138a3c48e176a05aed2/"
    static var bayad = url + "bayad"
}

struct Promo: Codable {
    var _id: String
    var name: String
    var details: String
    var image_url: String
    var read: Int
}
