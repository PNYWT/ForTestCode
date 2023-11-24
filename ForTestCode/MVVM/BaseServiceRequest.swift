//
//  BaseServiceRequest.swift
//  ForTestCode
//
//  Created by Dev on 23/11/2566 BE.
//

import Foundation
import Alamofire

class CustomURL{
    static let dummyjsonURL = "https://dummyjson.com/products"
}

class BaseServiceRequest:NSObject{
    static func getDataForURL(urlPath:String, completionBlock:@escaping(_ successData:Data?,_ errorStr:String?)->Void)->Void{
        AF.request(urlPath, method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                completionBlock(data,nil)
            case .failure(let error):
                completionBlock(nil, error.localizedDescription)
            }
        }
    }
}
