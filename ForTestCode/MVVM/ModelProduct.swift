//
//  ModelProduct.swift
//  ForTestCode
//
//  Created by Dev on 22/11/2566 BE.
//

import Foundation

struct ProductsModel:Decodable{
    var products:[ProductModel] = []
    let total:String?
    let skip:String?
    let limit:String?
    
    private enum CodingKeys: String, CodingKey{
        case products, total, skip, limit
    }
    
    init(products: [ProductModel], total: String?, skip: String?, limit: String?) {
        self.products = products
        self.total = total
        self.skip = skip
        self.limit = limit
    }
}

struct ProductModel:Decodable{
    var id:String?
    var title:String?
    var description:String?
    var price:String?
    var discountPercentage:String?
    var rating:String?
    var stock:String?
    var brand:String?
    var category:String?
    var thumbnail:String?
    var images: [String]?
    
    private enum CodingKeys: String, CodingKey{
        case id
        case title
        case description
        case price
        case discountPercentage
        case rating
        case stock
        case brand
        case category
        case thumbnail
        case images
    }
}
