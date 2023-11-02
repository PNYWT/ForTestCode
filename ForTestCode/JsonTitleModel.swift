//
//  JsonTitleModel.swift
//  ForTestCode
//
//  Created by Dev on 2/11/2566 BE.
//

import Foundation

struct DataModel : Codable{
    
    let arrData:[TypeModel]?
    
    private enum CodingKeys: String, CodingKey{
        case arrData = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        arrData = try container.decodeIfPresent([TypeModel].self, forKey: .arrData)
    }
}

struct TypeModel : Codable{
    let title:String?
    
    private enum CodingKeys: String, CodingKey{
        case title
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title)
    }
}
