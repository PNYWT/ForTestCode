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
        if ConfigApp.showLog{
            print(String(format: "URL: %@ ---------> REQUEST NOW", urlPath))
        }
        AF.request(urlPath, method: .get).responseData { response in
            switch response.result {
            case .success(let data):
                if ConfigApp.showLog{
                    let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    print(String(format: "URL: %@ <--------- RESPONSE SUCCESS\n%@", urlPath, "\(jsonObject)"))
                }
                completionBlock(data,nil)
            case .failure(let error):
                if ConfigApp.showLog{
                    print(String(format: "URL: %@ <--------- RESPONSE ERROR", urlPath))
                }
                completionBlock(nil, error.localizedDescription)
            }
        }
    }
}
