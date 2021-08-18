//
//  Network.swift
//  bayad
//
//  Created by Ruel Lafuente on 8/18/21.
//

import Foundation
import Foundation
import Alamofire

class Network: NSObject {
    
    typealias complete = (Bool?,Any?)->Void
    
    //Handling Network Request
    static func request(URLString: String, method: HTTPMethod, successed: @escaping complete, failed: @escaping complete) {
        AF.request(URLString, method: method).responseJSON { response in
//            print("Response: ", response.value)
            switch response.result {
            case .success(_):
                successed(true, response.data)
            case .failure(_):
                successed(false, response.data)
            }
        }
    }
}
