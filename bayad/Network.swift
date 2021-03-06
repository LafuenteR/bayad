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
    static func request(URLString: String, method: HTTPMethod, parameter: Parameters? = nil , successed: @escaping complete, failed: @escaping complete) {
        AF.request(URLString, method: method, parameters: parameter).responseJSON { response in
            print("Response: ", response.value)
            switch response.result {
            case .success(_):
                if method == .get {
                    successed(true, response.data)
                } else {
                    successed(true, response.value)
                }
            case .failure(_):
                if method == .get {
                    successed(false, response.data)
                } else {
                    successed(false, response.value)
                }
            }
        }
    }
}
